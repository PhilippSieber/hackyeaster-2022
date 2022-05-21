
function doSubmit() {
    var amount = $("#amount").val();
    var item = $("#item").val();
    var settings = {
        "url": "/order",
        "method": "POST",
        "timeout": 0,
        "headers": {
          "Content-Type": "application/json"
        },
        "data": JSON.stringify({"amount":amount,"item":item}),
    };
  
    $.ajax(settings).done(function (response) {
        $("#output").text(response);
    });
}