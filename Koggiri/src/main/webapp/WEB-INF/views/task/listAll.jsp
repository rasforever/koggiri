<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->

			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">LIST ALL PAGE</h3>
				</div>

				
<table class="table table-bordered" border="1">
	<tr>
		<th style="width: 10px">글번호</th>
		<th>업무일자</th>
		<th>금주업무실적</th>
		<th>차주업무계획</th>
		<th>작성일자</th>
		<th style="width: 40px">조회수</th>
	</tr>

<c:forEach items="${list}" var="TaskVO">


	<tr>
		<td>${TaskVO.ta_seq}</td>
		<td><a href='/task/read?ta_seq=${TaskVO.ta_seq}'>${TaskVO.ta_date}</a></td>
		<td>${TaskVO.ta_weekresult}</td>
		<td>${TaskVO.ta_nextresult}</td>
		<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
				value="${TaskVO.ta_regdate}" /></td>
		<td><span class="badge bg-red">${TaskVO.ta_hitcount }</span></td>
	</tr>

</c:forEach>

</table>

</div>
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->

<script>
    
    var result = '${msg}';
    
    if(result == 'SUCCESS'){
    	alert("처리가 완료되었습니다.");
    }
    
    </script>