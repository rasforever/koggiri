<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>



<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->

			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">LIST ALL PAGE</h3>
				</div>
				<div class="box-body">
				
<table class="table table-bordered" border="1">
	<tr>
		<th style="width: 10px">글번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th style="width: 40px">조회수</th>
	</tr>


<c:forEach items="${list}" var="boardVO">

	<tr>
		<td>${boardVO.f_id}</td>
		<td><a href='/document/read?f_id=${boardVO.f_id}'>${boardVO.f_title}</a></td>
		<td>${boardVO.f_emp_id}</td>
		<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
				value="${boardVO.f_date}" /></td>
		<td><span class="badge bg-red">${boardVO.f_hit }</span></td>
	</tr>

</c:forEach>

</table>

				</div>
				<!-- /.box-body -->
				<div class="box-footer">Footer</div>
				<!-- /.box-footer-->
			</div>
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<script>
    
    var result = '${msg}';
    
    if(result == 'success'){
    	alert("처리가 완료되었습니다.");
    }
    
    </script>