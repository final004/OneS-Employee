/****************************************************************************
 * Initial setup
 ****************************************************************************/

var pc_configuration = {'iceServers': [{'url': 'stun:stun.l.google.com:19302'}]};
var pc_constraints = {
	'optional': [
		{'DtlsSrtpKeyAgreement': true},
		{'RtpDataChannels': false}
	]
};

// defult value
var ip = document.getElementById("ip").value;
var room = document.getElementById("key").value;
var clientId =document.getElementById("name").value;
var socket;

// Peer Connection
var isInitiator;
start();

/*
// Local video Element
var localVideo			= document.getElementById("localVideo");
var localUnmuteButton		= document.getElementById("localMuteBtn");
var localBlankButton	= document.getElementById("localBlankBtn");
var localUnmuteButton	= document.getElementById("localUnmuteBtn");
var localUnblankButton	= document.getElementById("localUnblankBtn");
localUnmuteButton.disabled = true;
localBlankButton.disabled = true;
localUnmuteButton.disabled = true;
localUnblankButton.disabled = true;
localUnmuteButton.onclick		= clickTest;
localBlankButton.onclick	= clickTest;
localUnmuteButton.onclick	= clickTest;
localUnblankButton.onclick	= clickTest;

// Remote video Element
var remoteVideo			= document.getElementById("remoteVideo");
var remoteMuteButton	= document.getElementById("remoteMuteBtn");
var remoteBlankButton	= document.getElementById("remoteBlankBtn");
var remoteUnmuteButton	= document.getElementById("remoteUnmuteBtn");
var remoteUnblankButton	= document.getElementById("remoteUnblankBtn");
remoteMuteButton.disabled = true;
remoteBlankButton.disabled = true;
remoteUnmuteButton.disabled = true;
remoteUnblankButton.disabled = true;
remoteMuteButton.onclick	= clickTest;
remoteBlankButton.onclick	= clickTest;
remoteUnmuteButton.onclick	= clickTest;
remoteUnblankButton.onclick	= clickTest;
*/
// Video Method
// sendVideoStreamOn();
// sendVideoStreamOff();
// sendAudioStreamOn();
// sendAudioStreamOff();
// remoteVideoStreamOn();
// remoteVideoStreamOff();
// remoteAudioStreamOn();
// remoteAudioStreamOff();

// Chat
var sendChatArea		= document.getElementById("sendChatArea");
var receivedChatArea	= document.getElementById("receivedChatArea");
var sendChatButton		= document.getElementById("sendChatBtn");

/*
sendChatArea.Disabled = true;
sendChatButton.disabled = true;
*/
sendChatButton.onclick = sendChatMessage;
// File
var sendFileInfo	= document.getElementById("sendFileInfo");
var sendFileInput	= document.getElementById("sendFileInput");
var sendFileButton	= document.getElementById("sendFileBtn");
var sendProgress	= document.getElementById("sendProgress");
/*
sendFileInput.disabled = true;
sendFileButton.disabled = true;
*/
sendFileInput.onchange = sendFileCheck;
sendFileButton.onclick = sendFile;

var receivedFile		= document.getElementById("receivedFileURL");
//var downloadAnchor		= document.getElementById("download");
//var statusMessage		= document.getElementById("status");
var bitrateDiv			= document.getElementById("bitrate");

function clickTest(event) {
	console.log("'" + event.target.id + "' is clicked.");
}

function changeTest(event) {
	console.log("'" + event.target.id + "' is changed.");
}

/*******************************************************************************
 * Custom Utils
 ******************************************************************************/

function getTimeStamp() {
	var d = new Date();

	var s = leadingZeros(d.getHours(), 2) + ':'
			+ leadingZeros(d.getMinutes(), 2) + ':'
			+ leadingZeros(d.getSeconds(), 2);
	return s;
}

function leadingZeros(n, digits) {
	var zero = '';
	n = n.toString();

	if (n.length < digits) {
		for (i = 0; i < digits - n.length; i++)
			zero += '0';
	}
	return zero + n;
}

function appendMessage( who, data ){
	var wrapDiv = document.createElement("div");
	var li = document.createElement("li");
	var timeDiv = document.createElement("div");
	wrapDiv.appendChild(li);
	wrapDiv.appendChild(timeDiv);
	receivedChatArea.appendChild(wrapDiv);
	wrapDiv.setAttribute("class",who+"wrap");
	li.setAttribute("class", who);
	timeDiv.setAttribute("class","time");
	timeDiv.innerHTML = getTimeStamp();
	
	if(who==='mine'){
		li.innerHTML = data.message;
	}else{
		li.innerHTML = '<span>'+data.name+'</span>' +data.message;
	}
}

/*******************************************************************************
 * Connection obj
 ******************************************************************************/

function start() {
	socket = io.connect('https://'+ip+':3000');

	socket.on('log', function (array) {
		console.log.apply(console, array);
	});

	socket.on('signal', function (signal) {
		console.log('Client received signal message:', signal);
		signalingMessageCallback(signal);
	});

	socket.on('ipaddr', function (ipaddr) {
		console.log('Server IP address is: ' + ipaddr);
		updateRoomURL(ipaddr);
	});

	socket.on('created', function (room) {
		console.log('Created room [', room, '] - my client ID is [', clientId, ']');
		isInitiator = true;
		//grabWebCamVideo();
	});

	socket.on('joined', function (room) {
		console.log('This peer has joined room [', room, '] with client ID [', clientId, ']');
		isInitiator = false;
		//grabWebCamVideo();
	});

	socket.on('full', function (room) {
		alert('Room "' + room + '" is full. We will create a new room for you.');
		window.location.hash = '';
		window.location.reload();
	});

	socket.on('ready', function () {
		trace("ready for peerConnection");
		createPeerConnection(isInitiator, pc_configuration);
	});

	socket.on('roomList', function(list) {
		console.log('[Current Room List]');
		console.log(list);
	})

	/**
	 * start()'s Biz Area
	 */
	trace("start() called");

	if (room === '') {
		room = 'q';
	}

	// Create or Join a room
	socket.emit('create or join', room);

	if (location.hostname.match(/localhost|127\.0\.0/)) {
		socket.emit('ipaddr');
	}

	console.log(socket);
}

function hangUp() {
	trace("hangUp() called");
	socket.emit('leaveRoom', clientId);
}

function sendSignal(signal) {
	console.log('Client sending signal : ', signal);
	socket.emit('signal', signal);
}

function updateRoomURL(ipaddr) {
	var url;
	if (!ipaddr) {
		url = location.href
	} else {
		url = location.protocol + '//' + ipaddr + ':3000/#' + room
	}
	roomURL.innerHTML = url;
}

/****************************************************************************
 * PeerConnection obj
 ****************************************************************************/

var peerConnection;
var dataChannel;

function signalingMessageCallback(signal) {
	if (signal.type === 'offer') {
		console.log('Got offer. Sending answer to peer.');
		peerConnection.setRemoteDescription(new RTCSessionDescription(signal), function() {}, logError);
		peerConnection.createAnswer(onLocalSessionCreated, logError);

	} else if (signal.type === 'answer') {
		console.log('Got answer.');
		peerConnection.setRemoteDescription(new RTCSessionDescription(signal), function() {}, logError);

	} else if (signal.type === 'candidate') {
		peerConnection.addIceCandidate(new RTCIceCandidate({candidate: signal.candidate}));

	} else if (signal === 'bye') {
		hangUp();
		// redirect to home?
	}
}

function createPeerConnection(isInitiator, config) {
	console.log('Creating Peer connection as initiator?', isInitiator, 'config:', config);
	peerConnection = new RTCPeerConnection(config, pc_constraints);
	trace('PeerConnection is created');

	// send any ice candidates to the other peer
	peerConnection.onicecandidate = function(event) {
		console.log('onIceCandidate event:', event);
		if (event.candidate) {
			sendSignal({
				type: 'candidate',
				label: event.candidate.sdpMLineIndex,
				id: event.candidate.sdpMid,
				candidate: event.candidate.candidate
			});
		} else {
			console.log('End of candidates.');
		}
	};

	if (isInitiator) {
		console.log('Creating Data Channel');
		dataChannel = peerConnection.createDataChannel("dataChannel");
		trace('DataChannel is created');
		onDataChannelCreated(dataChannel);
		console.log('Creating an offer');
		peerConnection.createOffer(onLocalSessionCreated, logError);

	} else {
		peerConnection.ondatachannel = function (event) {
			console.log('ondatachannel:', event.channel);
			dataChannel = event.channel;
			onDataChannelCreated(dataChannel);
		};
	}
}

function onLocalSessionCreated(desc) {
	console.log('local session created:', desc);
	peerConnection.setLocalDescription(desc, function () {
		console.log('sending local desc:', peerConnection.localDescription);
		sendSignal(peerConnection.localDescription);
	}, logError);
}

function onDataChannelCreated(channel) {
	console.log('onDataChannelCreated:', channel);

	channel.onopen = function () {
		console.log('CHANNEL opened!!!');
		enableDataChannelInterface(dataChannel.readyState == "open");
		dataChannel.binaryType = 'arraybuffer';
	};
	//channel.onmessage = receiveDataChromeFactory();
	channel.onmessage = handleReceiveData;
}

function enableDataChannelInterface(shouldEnable) {
	if (shouldEnable) {
		sendChatArea.focus();
		sendChatArea.disabled = false;
		sendChatButton.disabled = false;
		sendFileInput.disabled = false;
		//hangUpButton.disabled = false;
	}
}

// Receive
function handleReceiveData(event) {
	var packet = JSON.parse(event.data);

	if(packet.category === 'chat') {
		// message receive
		appendMessage('yours', packet);
	} else if(packet.category === 'file') {
		receiveFile(packet);
	}
	// scroll bottom fix
	receivedChatArea.scrollTop=receivedChatArea.scrollHeight;
}

function receiveDataChromeFactory() {
	console.log();
	var count, file;
	var receiveBuffer = [];
	return function onmessage(event) {
		if (typeof event.data === 'string') {
			receiveBuffer = window.buf = new Uint8ClampedArray(parseInt(event.data));
			count = 0;
			console.log('Expecting a total of ' + receiveBuffer.byteLength + ' bytes');
			return;
		}

		var data = new Uint8ClampedArray(event.data);
		receiveBuffer.set(data, count);

		receiveProgress.value = count;
		count += data.byteLength;
		console.log('count: ' + count);

		if (count === receiveBuffer.byteLength) {
			// we're done: all data chunks have been received
			file = receiveBuffer;
			console.log(file);
			console.log('Done. File Reassemble');
			renderPhoto(receiveBuffer);
		}
	}
}

/****************************************************************************
 * Chat
 ****************************************************************************/

function sendChatMessage() {
	var message = {};
	message.category = 'chat';
	message.message = sendChatArea.value;
	message.name = clientId;
	sendChatArea.value='';
	
	if(message == null || message === '')
		return;

	// mine message
	appendMessage('mine', message);
	
	// scroll bottom fix
	receivedChatArea.scrollTop=receivedChatArea.scrollHeight;
	
	dataChannel.send(JSON.stringify(message));
}

function stringToArrayBuffer(str) {
	var buf = new ArrayBuffer(str.length*2); // 2 bytes for each char
	var bufView = new Uint16Array(buf);
	for (var i=0, strLen=str.length; i < strLen; i++) {
		bufView[i] = str.charCodeAt(i);
	}
	return buf;
}

/****************************************************************************
 * File Sharing
 ****************************************************************************/

var file;
var receivedFileURL;
var receivedFileName;
var totalSize;
var receivedBuffer = [];

function receiveFile(packet) {
	//console.log(packet);
	receivedFileName = packet.fileName;
	totalSize = packet.totalSize;

	receivedBuffer.push(packet.message);

	if(packet.last) {
		receivedFileURL = receivedBuffer.join('');
		receivedBuffer = [];
		createAnchor();
	}
}

function createAnchor() {
	
	var anc = "<a ";
	anc += ' href="'+receivedFileURL+'"';
	anc += ' style="display:block;"';
	anc += ' download='+receivedFileName+'>';
	anc += receivedFileName + "</br> (" + totalSize + " bytes)";
	anc += "</a>";
	
	appendMessage('yours', {name:'FILE', message:anc});
	
}

function sendFileCheck() {
	file = sendFileInput.files[0];
	sendFileInput.disabled = true;
	//trace('file is ' + [file.name, file.size, file.type, file.lastModifiedDate].join(' '));

	// Handle 0 size files.
	if (file.size === 0) {
		bitrateDiv.innerHTML = '';
		sendFileInput.disabled = false;
		//closeDataChannels();
		return;
	} else {
		sendFileButton.disabled = false;
	}
};

function sendFile() {
	console.log(file);
	var CHUNK_SIZE = 64000;
	

	var reader = new window.FileReader();
	reader.readAsDataURL(file);
	reader.onload = onReadAsDataURL;

	// temp progress create
	
	var temp = document.createElement("li");
	temp.setAttribute("id", "fileLi");
	temp.setAttribute("class", "mine");
	receivedChatArea.appendChild(temp);
	temp.innerHTML='<progress id="customProgress" max="0" value="0"></progress></li>';
	
	// scroll bottom fix
	receivedChatArea.scrollTop=receivedChatArea.scrollHeight;
	
	var customProgress	= document.getElementById("customProgress");
	customProgress.max = file.size;
	
	function onReadAsDataURL(event, text) {
		var data = {};
		data.category = 'file';
		data.fileName = file.name;
		data.totalSize = file.size;

		if(event)
			text = event.target.result;

		if(text.length > CHUNK_SIZE) {
			data.message = text.slice(0, CHUNK_SIZE);

		} else {
			data.message = text;
			data.last = true;
		}

		dataChannel.send(JSON.stringify(data));

		var remainingDataURL = text.slice(data.message.length);
		if(remainingDataURL.length) setTimeout(function() {
			onReadAsDataURL(null, remainingDataURL);
		}, 500)
		customProgress.value = file.size - remainingDataURL.length;
		
		// complete sending file
		if(remainingDataURL.length==0){
			var fileLi	= document.getElementById("fileLi");
			receivedChatArea.removeChild(fileLi);
			
			var tempReader = new window.FileReader();
			tempReader.readAsDataURL(file);
			
			var anc = "<a ";
			anc += ' href="'+tempReader+'"';
			anc += ' style="display:block;"';
			anc += ' download='+file.name+'>';
			anc += file.name + "</br> (" + file.size + " bytes)";
			anc += "</a>";
			
			appendMessage('mine', {message:anc});
			
			// scroll bottom fix
			receivedChatArea.scrollTop=receivedChatArea.scrollHeight;
		}
	}
}

/****************************************************************************
 * Aux functions, mostly UI-related
 ****************************************************************************/

function logError(err) {
	console.log(err.toString(), err);
}

function show() {
	Array.prototype.forEach.call(arguments, function (elem) {
		elem.style.display = null;
	});
}

function hide() {
	Array.prototype.forEach.call(arguments, function (elem) {
		elem.style.display = 'none';
	});
}

var packetForm = function(packet) {
	var type;
	var data;

	if(packet != null) {
		this.type = packet.type;
		this.data = packet.data;
	}
}
