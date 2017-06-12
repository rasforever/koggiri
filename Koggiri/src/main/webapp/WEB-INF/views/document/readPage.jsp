<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>

<!-- Bootstrap 3.3.4 -->
    <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />




<%@ include file="../include/header.jsp"%>


<link rel="stylesheet" href="/resources/Content/themes/real/ui_sub.css" />
<link href="/resources/Content/themes/base/jquery-ui.min.css" rel="stylesheet" type="text/css" /> 




<style type="text/css">
.popup {
	position: absolute;
}

.back {
	background-color: gray;
	opacity: 0.5;
	width: 970px;
	height: 670px;
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
	max-width: 800px;
	max-height: 540px;
	overflow: auto;
}
</style>




<div class="container_wrap" style="background-color: #ffffff;">
<div id="container">

<div id="sub_menu_title">
<h1><img src="/resources/img/s_menu05.png"/></h1>
<div class="sub_top">   
     <span><a href="/main">홈</a>  <span> &gt; </span> <a href="/task/list">전자 문서</a>  &gt;  <strong>문서함</strong></span>
</div>
</div>


<div id="lnb">
   <div class="lnb01">
      <strong class="menu02"><span>전자결재</span></strong>
      <ul>
                <li class="menu01">
                    <a href="/task/list">업무보고</a>
                    <ul> </ul>
                </li>
                <li class="menu02 ">
                    <a href="/approval/lists">전자결재</a>
                    <ul>
                      <li class="sub01 "><a href="/approval/lists">보낸 결재</a></li>
                      <li class="sub02 "><a href="/approval/listr">받은 결재</a></li>
                      <li class="sub03 "><a href="/approval/register">결재 입력</a></li>
                    </ul>
                </li>
                 <li class="menu03 ">
                    <a href="/document/list">문서함</a>
  					<ul></ul>
                </li>
           </ul>
   </div>
</div>



<div id="sub_content" align="center">
<!--  -->
<div id="popup_front" class='popup front' style="display: none;" >
	<img id="popup_img">
</div>
<div class='popup back' style="display: none;" align="center"></div>

<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title" align="left" style="font-size: 16px"><strong>문서게시판</strong></h3><br><br><br>
				</div>
				<!-- /.box-header -->

				<form role="form" action="modifyPage" method="post">

					<input type='hidden' name='f_id' value="${doc_BoardVO.f_id}">
					<input type='hidden' name='page' value="${cri.page}"> <input
						type='hidden' name='perPageNum' value="${cri.perPageNum}">
					<input type='hidden' name='searchType' value="${cri.searchType}">
					<input type='hidden' name='keyword' value="${cri.keyword}">
				</form>

				<div class="box-body">
					<div class="form-group" align="left" style="font-size: 14px">
						<label for="exampleInputEmail1">제목</label><br><br>
						<input type="text"
							name='f_title' class="form-control"
							value="${doc_BoardVO.f_title}" readonly="readonly" style="font-weight:bolder;  ">
					</div>
					
					<div class="form-group" align="left" style="font-size: 14px">
						<label for="exampleInputPassword1" >내용</label><br><br>

						<div class="form-control"
							style="width: auto; height:auto; overflow-y: auto;"
							readonly="readonly">${doc_BoardVO.f_content}</div>
					</div>
					
					<div class="form-group" align="left" style="font-size: 14px">
						<label for="exampleInputEmail1">작성자</label><br><br> 
						<input type="text"
							name="f_emp_nm" class="form-control"
							value="${doc_BoardVO.f_emp_nm}" readonly="readonly">
					</div>

				</div>
				
				
				<ul class="mailbox-attachments clearfix uploadedList"></ul>
				
				<!-- /.box-body -->

				<div class="box-footer" align="left" style="font-size: 14px">
		
		 			<c:if test="${doc_BoardVO.f_emp_id == mem_id or mem_id=='master'}">
							<button type="submit" class="btn btn-warning">수정하기</button>
							<button type="submit" class="btn btn-danger">삭제하기</button>	
					</c:if>
					<button type="submit" class="btn btn-primary">목록</button>
				</div>

			</div>
			<!-- /.box -->

		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
	</div>





</div>
</div>


<!-- 본문 끝 -->

<div class="footer_wrap" >
<div id="footer" style="height: 150px">
<%@ include file="../include/footer.jsp"%>



<!-- Main content -->
<section class="content">
	

</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<script id="templateAttach" type="text/x-handlebars-template">
<li data-src='{{fullName}}'>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-ttachment-name">{{fileName}}</a>
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
					formObj.attr("action", "/document/modifyPage");
					formObj.attr("method", "get");
					formObj.submit();
				});

				$(".btn-danger").on("click", function() {
					formObj.attr("action", "/document/removePage");
					formObj.submit();
				});

				$(".btn-primary").on("click", function() {
					formObj.attr("method", "get");
					formObj.attr("action", "/document/list");
					formObj.submit();
				});

				var f_id = ${doc_BoardVO.f_id};
				var template = Handlebars.compile($("#templateAttach").html());

				$.getJSON("/document/getAttach/" + f_id, function(list) {
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

					formObj.attr("action", "/document/removePage");
					formObj.submit();
				});

				$(".uploadedList").on("click", ".mailbox-attachment-info a",
						function(event) {

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








