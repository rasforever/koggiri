<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>




<link rel="stylesheet" href="/resources/Content/themes/real/ui_sub.css" />
<link href="/resources/Content/themes/base/jquery-ui.min.css"
	rel="stylesheet" type="text/css" />

<style type="text/css">
.popup {
	position: absolute;
}

.back {
	background-color: gray;
	opacity: 0.5;
	width: 100%;
	height: 300%;
	overflow: hidden;
	z-index: 1101;
}

.front {
	z-index: 1110;
	opacity: 1;
	boarder: 1px;
	margin: auto;
}

.show {
	position: relative;
	max-width: 1200px;
	max-height: 800px;
	overflow: auto;
}
</style>

<%@ include file="../include/header.jsp"%>

<div class="container_wrap" style="background-color: #ffffff;">
	<div id="container">

	<div id="sub_menu_title">
<h1><img src="/resources/img/s_menu01.png"/></h1>
<div class="sub_top">   
    <span><a href="/main">홈</a>  <span> &gt; </span> <a href="/noticeboard/listPage">공지</a>  &gt;  <strong>공지사항</strong></span>
</div>
</div>


<div id="lnb">
     <div class="lnb01">
      <strong class="menu01"><span>공지</span></strong>
      <ul>
                <li class="menu01 ">
                    <a href="/noticeboard/listPage">공지사항</a>
                    <ul>
                      <li class="sub01 "><a href="/noticeboard/listPage">공지사항 목록</a></li>
                  <c:if test="${Noti_BoardVO.n_EMP_ID == mem_id or mem_aut_cd == 'A'}"><!-- A등급이 아닐경우 안보임 -->
                      <li class="sub02 "><a href="/noticeboard/register">공지사항 작성</a></li>
                      </c:if>
                    </ul>
                </li>
                <li class="menu02 ">
                    <a href="/importantboard/listPage">알립니다</a>
                    <ul>
                      <li class="sub01 "><a href="/importantboard/listPage">알립니다 목록</a></li>
                      <c:if test="${Noti_BoardVO.n_EMP_ID == mem_id or mem_aut_cd == 'A'}"><!-- A등급이 아닐경우 안보임 -->
                      <li class="sub02 "><a href="/importantboard/register">알립니다 작성</a></li>
                      </c:if>
                    </ul>
                </li>
           </ul>
   </div>
</div>

		<div id="sub_content">

			<!-- 본문 내용 시작 -->
			<div class='popup back' style="display: none;"></div>
			<div id="popup_front" class='popup front' style="display: none;">
				<img id="popup_img">
			</div>

			<div class="row">
				<!-- left column -->
				<div class="col-md-12">
					<!-- general form elements -->
					<div class="box box-primary">
						<!-- <div class="box-header">
          <h3 class="box-title">READ BOARD</h3>
        </div> -->
						<!-- /.box-header -->

						<form role="form" action="modify" method="post">

							<input type='hidden' name='n_ID' value="${Noti_BoardVO.n_ID}">

							<input type='hidden' name='page' value="${cri.page}"> <input
								type='hidden' name='perPageNum' value="${cri.perPageNum}">
							<input type='hidden' name='searchType' value="${cri.searchType}">
							<input type='hidden' name='keyword' value="${cri.keyword}">
						</form>

						<div class="box-body">
							<div class="form-group">
								<label for="exampleInputEmail1">제목<br>
								<br></label> <input type="text" name='N_TITLE' class="form-control"
									value="${Noti_BoardVO.n_TITLE}" readonly="readonly">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">내용<br>
								<br></label>
								<textarea class="form-control" name="N_CONTENT" rows="3"
									readonly="readonly" style="HEIGHT: 300PX;">${Noti_BoardVO.n_CONTENT}</textarea>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">작성자<br>
								<br></label> <input type="text" name="N_EMP_ID"
									class="form-control" value="${Noti_BoardVO.n_EMP_ID}"
									readonly="readonly">
							</div>
							<div class='popup back' style="display: none;"></div>
							<div id="popup_front" class='popup front' style="display: none;">
								<img id="popup_img">
							</div>
						</div>
						<!-- /.box-body -->

						<div class="box-footer">
							<ul class="mailbox-attachments clearfix uploadedList"></ul>
							
							 <c:if test="${Noti_BoardVO.n_EMP_ID == mem_id or mem_aut_cd == 'A'}"><!-- A등급이 아닐경우 안보임 -->
							<button type="submit" class="btn btn-warning">수정하기</button>
							<button type="submit" class="btn btn-danger">삭제하기</button>
							</c:if>
							<button type="submit" class="btn btn-primary">목록</button>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>


<div class="footer_wrap">
	<div id="footer" style="height: 150px">
		<%@ include file="../include/footer.jsp"%>
		
		
		
		<script type="text/javascript" src="/resources/js/upload.js"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

		<script id="templateAttach" type="text/x-handlebars-template">
<li data-src='{{fullName}}'>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	</span>
  </div>
</li>                
</script>


		<script>
			$(document).ready(
					function() {

						var formObj = $("form[role='form']");

						console.log(formObj);

						$(".btn-warning").on("click", function() {
							formObj.attr("action", "/noticeboard/modify");
							formObj.attr("method", "get");
							formObj.submit();
						});

						$(".btn-danger").on("click", function() {
							formObj.attr("action", "/noticeboard/remove");
							formObj.submit();
						});

						$(".btn-primary").on("click", function() {
							formObj.attr("method", "get");
							formObj.attr("action", "/noticeboard/listPage");
							formObj.submit();
						});

						var n_ID = $
						{
							Noti_BoardVO.n_ID
						}
						;
						var template = Handlebars.compile($("#templateAttach")
								.html());

						$.getJSON("/noticeboard/getAttach/" + n_ID, function(
								list) {
							$(list).each(function() {

								var fileInfo = getFileInfo(this);

								var html = template(fileInfo);

								$(".uploadedList").append(html);

							});
						});

						$("#removeBtn").on("click", function() {

							var arr = [];
							$(".uploadedList li").each(function(index) {
								arr.push($(this).attr("data-src"));
							});

							if (arr.length > 0) {
								$.post("/deleteAllFiles", {
									files : arr
								}, function() {

								});
							}

							formObj.attr("action", "/noticeboard/remove");
							formObj.submit();
						});

						$(".uploadedList").on("click",
								".mailbox-attachment-info a", function(event) {

									var fileLink = $(this).attr("href");

									if (checkImageType(fileLink)) {

										event.preventDefault();//기본이벤트 해제.

										var imgTag = $("#popup_img"); // 현재 클릭한 이미지의 경로를 id속성값이 popup_img인 요소에 추가.
										imgTag.attr("src", fileLink);

										console.log(imgTag.attr("src"));

										$(".popup").show('slow'); // 추가된 뒤 화면에 보이도록 jQuery의 show호출.
										imgTag.addClass("show"); // 필요한 CSS추가.	
									}
								});

						$("#popup_img").on("click", function() {

							$(".popup").hide('slow'); //화면에 원본 이미지가 보여진 후 다시 한 번 클릭하면 이미지가 사라지는 효과

						});
					});
		</script>

		<br>
		<br>

		<!-- 본문 내용  끝-->