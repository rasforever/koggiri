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

<!-- Main content -->
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

<div class="container_wrap" style="background-color: #ffffff;">
<div id="container">

<div id="sub_menu_title">
<h1><img src="/resources/img/s_menu04.png"/></h1>
<div class="sub_top">   
    <span><a href="/main">홈</a>  <span> &gt; </span> <a href="/task/list">전자 문서</a> <span> &gt; </span> <a href="/approval/lists">전자결재</a>  &gt;  <strong>상세 보기</strong></span>
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

<div class='popup back' style="display: none;"></div>
<div id="popup_front" class='popup front' style="display: none;">
	<img id="popup_img">
</div>

<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">READ BOARD</h3>
				</div>
				<!-- /.box-header -->
				
				<form role="form" action="modifyPage" method="post">

					<input type='hidden' name='app_id' value="${approvalVO.app_id}">
					<input type='hidden' name='page' value="${search.page}"> <input
						type='hidden' name='perPageNum' value="${search.perPageNum}">
					<input type='hidden' name='searchType' value="${search.searchType}">

				</form>

				<div class="box-body">
					<tr>
						<th>문서번호</th>
						<td width="700px">${approvalVO.app_id }</td>
						<th>문서타입</th>
						<td>${approvalVO.app_type_nm }</td>
					</tr>
					<tr>
						<th>부서명</th>
						<td>${approvalVO.dept_nm }</td>
						<th>진행상태</th>
						<td>${approvalVO.app_pro_nm }</td>
					</tr>
					<tr>
						<th>기안자</th>
						<td>${approvalVO.draft_emp_nm }</td>
						<th>결재자</th>
						<td>${approvalVO.app_emp_nm }</td>
					</tr>
					<tr>
						<th>기안일</th>
						<td>${approvalVO.draft_dt }</td>
						<th>결재일</th>
						<td>${approvalVO.app_dt }</td>
					</tr>
					
 					<c:if test="${search.searchType == 'r' }">
		 				<c:if test="${approvalVO.app_pro_cd.equals('0') }">
		 					<c:if test="${approvalVO.app_emp_id == mem_id }">					
							<button type="submit" class="btn btn-warning" id="recBtn">승인</button>
							<button type="submit" class="btn btn-danger" id="votBtn">부결</button>
							</c:if>
						 </c:if>
					</c:if>
					
					<tr>
						<th>제목</th>
						<td colspan="3">${approvalVO.app_title }</td>
					</tr>
					<tr>
						<td colspan="4"><hr>내용 : ${approvalVO.app_context }
							<hr></td>
					</tr>

				</div>
				<!-- /.box-body -->

				<div class="box-footer">

					<div>
						<hr>
					</div>

					<ul class="mailbox-attachments clearfix uploadedList">
					</ul>
					
 					<c:if test="${search.searchType == 's' }">
		 				<c:if test="${approvalVO.app_pro_cd.equals('0') }">
		 					<c:if test="${approvalVO.draft_emp_id == mem_id }">
								<button type="submit" class="btn btn-warning" id="modifyBtn">Modify</button>
								<button type="submit" class="btn btn-danger" id="removeBtn">REMOVE</button>
							</c:if>
						 </c:if>
					 </c:if>
					<button type="submit" class="btn btn-primary" id="goListBtn">GO
						LIST</button>
				</div>

			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->


</section>
<!-- /.content -->



<script id="templateAttach" type="text/x-handlebars-template">
<li data-src='{{fullName}}'>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	</span>
  </div>
</li>                
</script>




<script type="text/javascript" >

$(document).ready(function(){
	
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$("#modifyBtn").on("click", function(){
		formObj.attr("action", "/approval/modifyPage");
		formObj.attr("method", "get");		
		formObj.submit();
	});
	var arr = [];
	
	$("#removeBtn").on("click", function(){		
		
		$(".uploadedList li").each(function(index){
			 arr.push($(this).attr("data-src"));
		});
		
		if(arr.length > 0){
			$.post("/deleteAllFiles",{files:arr}, function(){
				
			});
		}
		
		formObj.attr("action", "/approval/removePage");
		formObj.submit();
	});	
	
	$("#recBtn").on("click", function(){		
			
		formObj.attr("action", "/approval/updatePage");
		formObj.append("<input type='hidden' name='app_pro_cd' value='1'>");
		formObj.submit();
	});	
	
	$("#votBtn").on("click", function(){		
				
		formObj.attr("action", "/approval/updatePage");
		formObj.append("<input type='hidden' name='app_pro_cd' value='2'>");
		formObj.submit();
	});	
		
	$("#goListBtn ").on("click", function(){
		formObj.attr("method", "get");
		formObj.attr("action", "/approval/list");
		formObj.submit();
	});
	
	var app_id = ${approvalVO.app_id};
	var template = Handlebars.compile($("#templateAttach").html());
	
	$.getJSON("/approval/getAttach/"+app_id,function(list){
		$(list).each(function(){
			
			var fileInfo = getFileInfo(this);
			
			var html = template(fileInfo);
			
			 $(".uploadedList").append(html);
			
		});
	});
	


	$(".uploadedList").on("click", ".mailbox-attachment-info a", function(event){
		
		var fileLink = $(this).attr("href");
		
		if(checkImageType(fileLink)){
			
			event.preventDefault();
					
			var imgTag = $("#popup_img");
			imgTag.attr("src", fileLink);
			
			console.log(imgTag.attr("src"));
					
			$(".popup").show('slow');
			imgTag.addClass("show");		
		}	
	});
	
	$("#popup_img").on("click", function(){
		
		$(".popup").hide('slow');
		
	});	
	
});
</script>

<div class="footer_wrap" >
<div id="footer" style="height: 150px">
<%@ include file="../include/footer.jsp"%>










