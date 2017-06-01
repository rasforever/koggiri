function postIframe(target_url, method, params, strCallBackMethod) {
    //Add iframe
    //IE 이외의 브라우져에서도 사용 가능하도록 JQuery 사용
    var frame_name = "frame_name" + (new Date).getTime();
    var iframe = $("<iframe></iframe>")
        .css("display", "none")
        .attr("name", frame_name)
        .appendTo("body");

    if (iframe.length > 0 && iframe[0].contentWindow != undefined) {
        iframe[0].contentWindow.name = frame_name;
    }
    
    var form = $("<form></form>")
        .attr("target", frame_name)
        .attr("action", target_url)
        .attr("method", method)
        .appendTo("body");

    //loop through all parameters
    for (var key in params) {
        if (params.hasOwnProperty(key)) {
            $("<input />")
                .attr("type", "hidden")
                .attr("name", key)
                .val(params[key])
                .appendTo(form);
        }
    }

    $("<input />")
        .attr("type", "hidden")
        .attr("name", "strCallBackMethod")
        .val(strCallBackMethod)
        .appendTo(form);

    form.submit();
}