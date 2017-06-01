// 쿠키값 가져오기
function getCookie(key) {
    var cook = document.cookie + ";";
    var idx = cook.indexOf(key, 0);
    var val = "";

    if (idx != -1) {
        cook = cook.substring(idx, cook.length);
        begin = cook.indexOf("=", 0) + 1;
        end = cook.indexOf(";", begin);
        val = unescape(cook.substring(begin, end));
    }

    return val;
}

// 쿠키값 설정
function setCookie(name, value, expiredays) {
    var today = new Date();
    today.setDate(today.getDate() + expiredays);
    document.cookie = name + "=" + escape(value) + "; path=/; expires=" + today.toGMTString() + ";";
}

function keyPressOnlyNumber() {
    if (event.keyCode < 48 || event.keyCode > 57) {
        event.returnValue = false;

        return false;
    }
    return true;
}

// 유효한 IP값 체크
function checkIP(obj) {
    if (obj.val() == '') {
        alert('IP를 입력하여 주십시오.');
        obj.focus();
        return false;
    }

    // 입력한 값이 유효한 값인지 체크
    var ival = parseInt(obj.val());

    if ((ival < 0) || (ival > 255)) {
        alert('IP는 0 ~ 255 사이의 숫자로 입력하여야 합니다.');
        obj.select();
        return false;
    }
    return true;
}

function checkIPCClass(strUserRequestClass, ipObj) {
    //var strUserRequestClass = $("#txtIP1").val() + "." + $("#txtIP2").val() + "." + $("#txtIP3").val();
    var length = $("option", ipObj).size();

    if (length > 0) {
        for (var i = 0; i < length; i++) {
            var strAddedIPString = $("option:eq(" + i + ")", ipObj).text();
            var strAddedIPClass = strAddedIPString.substring(0, strAddedIPString.lastIndexOf("."));

            if (strUserRequestClass != strAddedIPClass) {
                alert("기존 등록된 IP와 C클래스가 달라 등록할 수 없습니다.");
                return false;
            }
        }
        return true;
    }
    else
        return true;
}

// IP Validation Check
function fnValidateCheckIP(val) {    
    if (/^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/.test(val)) {
        return true;
    } 
    return false;
    
}

function convertOptionToString(listbox, type, sp1, sp2) {
    var tempdata = '';

    listbox.each(function () {
        if (type == 1) {
            tempdata += $(this).text();
            tempdata += sp1;
        }
        else if (type == 2) {
            tempdata += $(this).val();
            tempdata += sp1;
        }
        else if (type == 3) {
            tempdata += $(this).text();
            tempdata += sp2;
            tempdata += $(this).val();
            tempdata += sp1;
        }
    });

    if (tempdata.substring(tempdata.length - 1, tempdata.length) == ';') {
        tempdata = tempdata.substring(0, tempdata.length - 1);
    }

    return tempdata;
}


// 팝업 호출 후 포커스 처린
// popup_url : 주소&파라메터
// name : 창이름
// width : 가로크기
// height : 세로크기
function openPopupFocus(popup_url, name, width, height, showScrollBar) {
    var left = (screen.width - Number(width)) / 2;
    var top = (screen.height - Number(height)) / 2;

    showScrollBar = showScrollBar == undefined || showScrollBar == null ? "no" : "yes";

    var obj = window.open(popup_url, name, "width=" + width + "px, height=" + height + "px, left=" + left + ", top=" + top + ", scrollbars=" + showScrollBar + ", menubar=no, resizable=no, titlebar=no, toolbar=no");

    // 팝업에 Focus 주기
    if (obj != null) {
        obj.focus();
    }
}

// 지정된 시간을 시/분/초로 보여준다.
function convertTime(time, termsType) {
    switch (termsType) {
        case 1:
            return parseInt(time / 60) + "시간 " + parseInt(time % 60) + "분 0초";
        case 2:
            return parseInt(time / 3600) + "시간 " + parseInt((time % 3600) / 60) + "분 " + parseInt(time % 60) + "초";
        case 3:
            return time + "일";
    }
}

function faqResize(isFirst) {
    var docH = $(".container_wrap").height();

    if (isFirst) {
        docH += 65;
    }

    docH += 278;

    if (docH >= 970) {
        $('.faq_wrap').css('height', docH);
        $('.search_result_wrap').css('height', docH - 158);
        $('.search_result').css('height', docH - 158);
        $('.search_faq_best').css('height', docH - 158);
    }
    else {
        $('.faq_wrap').css('height', 970);
        $('.search_result_wrap').css('height', 812);
        $('.search_result').css('height', 812);
        $('.search_faq_best').css('height', 812);
    }
}

//인증서 검사 플러그인 설치를 확인합니다.
function startSmartUpdate() {
    if (typeof (StartSmartUpdate) == "function") {
        StartSmartUpdate();
    }
    else {
        if (navigator.appVersion.indexOf("MSIE 7") != -1)
            alert("플러그인 설치가 되지 않았습니다.\n\n"
                + "브라우저(인터넷 익스플로어) 상단의 보안 인증서 " +
                "오류 컨텐츠 차단 표시줄을 클릭하여 차단된 컨텐츠를 표시하세요.");
        else
            alert("플러그인 설치가 되지 않았습니다.\n\n" +
                "브라우저에서 [새로고침]버튼을 클릭하신 후 " +
                "[보안경고]창이 나타나면 [예]버튼을 클릭하세요.");
    }
}

String.prototype.format = function () {
    var formatted = this;
    for (var i = 0; i < arguments.length; i++) {
        var regexp = new RegExp("\\{" + i + "\\}", "gi");
        formatted = formatted.replace(regexp, arguments[i]);
    }
    return formatted;
}