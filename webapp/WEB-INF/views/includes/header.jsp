<%@ page pageEncoding="UTF-8"%>
<div data-role="header" id="header">
	<a id="menuPanel" href="#myPanel" class="ui-btn ui-btn-inline ui-corner-all ui-shadow" >MENU</a>
	<h1>OneS</h1>
</div>

<div data-role="panel" id="myPanel" >
	<h1 style="text-align: center"> M E N U </h1> 
	<ul data-role="listview">
		<li><a href="/ones/" class="">HOME</a></li>
	    <li><a href="${pageCotext.request.contextPath }/" class="">화상전환</a></li>
	    <li><a href="${pageCotext.request.contextPath }/" class="">파일전송</a></li>
	</ul>
</div> 
