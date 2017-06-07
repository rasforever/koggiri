<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="imagetoolbar" content="no" />
<meta name="robots" content="index,follow" />
<meta name="subject" content="NEXON PC방 홈페이지에 오신것을 환영합니다." />
<meta name="author" content="NEXON Networks" />
<meta name="keywords" content="NEXON PC방, NEXON, PC방 " />
<meta name="copyright" content="copyrights 2011 NEXON Networks" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Koggiri</title>

<script type="text/javascript" src="Scripts/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="Scripts/jquery-ui.min.js"></script>
<script type="text/javascript" src="Scripts/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="Scripts/jquery.bxslider.min.js"></script>
<script type="text/javascript" src="Scripts/jquery.paging.min.js"></script>
<script type="text/javascript" src="Scripts/ajaxOverSsl.js"></script>
<script type="text/javascript" src="Scripts/common.js"></script>
<script type="text/javascript" src="Scripts/common.formatNumber-1.0.0.js"></script>
<script type="text/javascript" src="Scripts/jquery.validate.min.js"></script>
<script type="text/javascript" src="Scripts/jquery.validate.unobtrusive.min.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="http://s.nx.com/S2/billing/pcbang/real/common/favicon.ico" />
<link rel="stylesheet" href="Content/themes/real/ui_sub.css" />
<script src="http://js.nx.com/s1/da/playlog.min.js" type="text/javascript"></script>
<script type="text/javascript" src="Scripts/ui.js"></script>
<link href="Content/themes/base/jquery-ui.min.css" rel="stylesheet" type="text/css" /> 
</head>
<body class="sub">
<div id="wrap">
<div id="main_header">
<%-- 	<jsp:include page="../header.jsp" /> --%>
</div>
   
<span class="container_wrap">		
<div id="container">
<div id="lnb">
	<div class="lnb01">
		<strong class="menu05"><span>회사 정보</span></strong>
		<ul>
                <li class="menu01 ">
                    <a href="sub_information.jsp">Koggiri란?</a>
                    <ul> </ul>
                </li>
                <li class="menu02 ">
                    <a href="/chart/listAll">조직도</a>
                    <ul>
                    	<li class="sub01"><a href="/chart/list?dept_id=MM">경영진</a></li>
		                <li class="sub02"><a href="/chart/list?dept_id=PL">인사팀</a></li>
		                <li class="sub03"><a href="/chart/list?dept_id=MT">관리팀</a></li>
		                <li class="sub04"><a href="/chart/list?dept_id=SN">솔루션팀</a></li>
		                <li class="sub05"><a href="/chart/list?dept_id=BS">영업팀</a></li>
		                <li class="sub06"><a href="/chart/list?dept_id=MG">마게팅팀</a></li>
                    </ul>
                </li>
           </ul>
	</div>
</span>

<!-- 본문 시작 -->
<div id="content">
                   
<h1><img src="img/s_menu10.png"/></h1>
<div class="breadcrumb">	
    <span><a href="main.jsp">홈</a>  <span> &gt; </span> <a href="#">회사 정보</a>   &gt;  <strong>조직도</strong></span>
</div>
<!-- 본문 내용 -->              
</div>
		</div>
	</div>
<hr />

<div>
	<a href="/chart/list?dept_id=MM">경영팀</a>
	<a href="/chart/list?dept_id=PL">인사팀</a>
	<a href="/chart/list?dept_id=MT">관리팀</a>
	<a href="/chart/list?dept_id=SN">솔루션팀</a>
	<a href="/chart/list?dept_id=BS">영업팀</a>
	<a href="/chart/list?dept_id=MG">마게팅팀</a>
	
</div>

<!-- 본문 끝 -->

<script type="text/javascript">
</script>

<div id="main_footer">
<%-- 	<jsp:include page="../footer.jsp" /> --%>
</div>

<!-- 좌측 탭 -->
<div class="faq_wrap">
	<div class="search_header">
		<a href="#" class="btn_faq"><span>Faq 열기</span></a>
		<input type="text" id="txtSearchKeyword" style="width:190px;" /><a href="#" id="imgLeftFAQSearch"><img src="http://s.nx.com/S2/billing/pcbang/real/homepage/btn/btn_search.gif" alt="검색" /></a>
	</div>
	<div class="search_result_wrap">
		<div class="search_result search_faq_best">
			<p><strong>총 0건</strong>의 게시물이 검색되었습니다.</p>
            <div>
            <p>
				<img src="http://s.nx.com/S2/billing/pcbang/real/homepage/common/txt_faq_best.png" alt="자주 찾는 질문 BEST 10" />
				<a href="/HelpDesk/Faq"><img src="http://s.nx.com/S2/billing/pcbang/real/homepage/btn/btn_faq_more.gif" alt="FAQ 더보기" /></a>
			</p>
            </div>
		</div>
	</div>
</div>


<script type="text/javascript">
    $("#txtSearchKeyword").focus(function (event) {
        $("#txtSearchKeyword").val("");
        $("#txtSearchKeyword").unbind("focus");
    });

    $("#txtSearchKeyword").keypress(function (event) {
        event.stopImmediatePropagation();

        if (event.keyCode == 13) {
            $("#imgLeftFAQSearch").click();
        }
    });

    $(".btn_faq").click(function () {
        if (!$(this).hasClass("on")) {
            $(this).addClass("on");
            $(".search_header>div").hide();
            $(".faq_wrap").stop().animate({ "left": "0px" }, 500, "easeInOutQuad");
            $("#wrap").stop().animate({ "padding-left": "350px" }, 500, "easeInOutQuad");
        } else {
            $(this).removeClass("on");
            $(".search_header>div").show();
            $(".faq_wrap").stop().animate({ "left": "-340px" }, 500, "easeInOutQuad");
            $("#wrap").stop().animate({ "padding-left": "0px" }, 500, "easeInOutQuad");
        }

        return false;
    });

    $("#imgLeftFAQSearch").click(function () {
        searchLeftFaq();

        return false;
    });

    /* function bindLeftFaqInit(target, faqList) {
        $.each(faqList, function (idx, obj) {
            $(target)
                .append($("<ul>")
                    .append($("<li>")
                        .append($("<a>").attr({ "href": "#" }).text(obj.Title).bind("click", function () { $(".answer", $(this).parent()).css("display", function (index, style) { return style == "none" ? "block" : "none"; }); return false; }))
                        .append($("<div>").addClass("answer").html(obj.Content).css("display", "none"))
                    )
                );
        });
    }

    function searchLeftFAQInit() {
        var target = $(".search_result");
        
        $("ul", target).remove();

        $.ajax({
            url: "/HelpDesk/Faq/GetFaq",
            type: "post",
            data: {
                searchType: "best"
                , keyword: ""
                , currentPageNo: 1
                , pageSize: 15
            },
            dataType: "json",
            success: function (context) {
                switch (context.result) {
                    case 0:
                        if (context.faqList.length > 0) {
                            bindLeftFaqInit(target, context.faqList);
                        }
                        break;
                    default:
                        alert("잠시 후 다시 시도해주세요.");
                        break;
                }
            },
            error: function () {
                alert("시스템에서 에러가 발생했습니다.");
            }
        });
    } */

    function bindLeftFaqTitle(target, length, type) {
        var typeName = "";
        var link = "";
        var imageName = "";
        var keyword = $("#txtSearchKeyword").val();

        var imageUrl = "http://s.nx.com/S2/billing/pcbang/real/homepage/btn/";
        switch (type) {
            case 1:
                typeName = "FAQ";
                link = "/HelpDesk/Faq/Index?type=keyword&keyword=" + encodeURI(keyword);
                imageName = "btn_faq_more";
                break;
            case 2:
                typeName = "공지사항";
                link = "/HelpDesk/Notify/Index?keyword=" + encodeURI(keyword);
                imageName = "btn_notice_more";
                break;
            case 3:
                typeName = "이벤트 공지";
                link = "/HelpDesk/Notify/Event?keyword=" + encodeURI(keyword);
                imageName = "btn_event_more";
                break;
            case 4:
                typeName = "PC방 이벤트";
                link = "/Promotion/Event/Index?isCurrent=Y";
                imageName = "btn_pcbang_event_more";
                break;
        }

        return target.append(typeName + "(").append($("<strong>").text(length + "건")).append(") ").append($("<a>").attr({ "href": link }).append($("<img>").attr({ "src": imageUrl + imageName + ".gif", "alt": typeName })));
    }

    var allTotalCount = 0;

    function bindLeftFaq(target, dataList, type) {
        var subTotalCount = 0;

        if (dataList.length > 0) {
            subTotalCount = dataList[0].TotalCount;
        }
        else {
            subTotalCount = 0;
        }
        allTotalCount += subTotalCount;

        $(".search_result p:eq(0) strong").text("총 " + allTotalCount + "건");
        var keyword = $("#txtSearchKeyword").val();

        if (dataList.length > 0) {
            $(target)
                .append($("<div id='type" + type + "'>")
                    .append($("<p>")
                        .html(function () { bindLeftFaqTitle($(this), subTotalCount, type) }))
                    );
        }

        $.each(dataList, function (idx, obj) {
            $("div#type" + type + " p", target)
                .append($("<ul>")
                    .append($("<li>")
                        .append($("<a>").attr({"href":obj.Url}).text(obj.Title))
                        .append($("<span>").text(obj.RegDt))
                    )
                );
        });
    }

    function searchLeftFaq() {
        var keyword = $("#txtSearchKeyword").val();
        var target = $(".search_result");

        $("> div, > ul", target).remove();

        if (keyword == "") {
            alert("검색어를 입력해주세요.");
            return false;
        }

        $(".search_result p:eq(0)").show();
        $(".search_result p:eq(1)").hide();
        allTotalCount = 0;

        for (var i = 1; i <= 4; i++) {
            $.ajax({
                url: "/Home/GetLeftFaq",
                type: "post",
                async: false,
                data: {
                    type: i
                    , keyword: keyword
                },
                dataType: "json",
                success: function (context) {
                    switch (context.result) {
                        case 0:
                            bindLeftFaq(target, context.dataList, context.type);
                            break;
                        default:
                            alert(context.message == undefined || context.message == "" ? "잠시 후 다시 시도해주세요." : context.message);
                            break;
                    }
                }
            });
        }
    }

    $(document).ready(function () {
        $("#txtSearchKeyword").val($(".breadcrumb strong").text());
        $(".search_result p:eq(0)").hide();
        $(".search_result p:eq(1)").show();

        var docH = $(document).height();
        $('.faq_wrap').css('height', docH - 100);
        $('.search_result_wrap').css('height', docH - 258);
        $('.search_result').css('height', docH - 258);

        searchLeftFAQInit();
    });
</script>
	</div>
</body>
</html>
