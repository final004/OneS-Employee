 $("input[type=submit]").click(function () {
        $.ajax({
          url: "loginSuccess",
            type: "POST",
            contentType: "application/json;charset=utf-8",
            data: JSON.stringify({
            	employeeId: $("input[placeholder=employeeId]").val(),
                password: $("input[placeholder=password]").val()
            }),
            success: function (response) {
                alert("success");
            },
            error: function (e) {
                alert("error");
            }
        });
    });