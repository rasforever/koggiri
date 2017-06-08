<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
<%@include file="../main/header.jsp"%>
    <!-- Main content -->
    <section class="content">
      <div class="row">
      <!-- left column -->
      <div class="col-md-12">
        <!-- general form elements -->
        <div class="box box-primary">
        <div class="box-header">
          <h3 class="box-title">업무 상세보기</h3>
        </div><!-- /.box-header -->

 <form role="form" action="modifyPage" method="post">
    
    <input type='hidden' name='ta_seq' value ="${taskVO.ta_seq}">
    <input type='hidden' name='page' value ="${cri.page}">
    <input type='hidden' name='perPageNum' value ="${cri.perPageNum}">
    
 </form>   
 
  
  <div class="box-body">
     <div class="form-group">
		<label for="emp_id">작성자</label> <br>
	<input type="text" name='emp_id' class="form-control" value="${taskVO.emp_nm}"
			size="23" readonly="readonly">
	</div>
	
   <div class="form-group">
		<label for="ta_date">업무일자</label> <br>
	<input type="text" name='ta_date' class="form-control" value="${taskVO.ta_date}"
			size="23" readonly="readonly">
	</div>

	<div class="form-group">
		<label for="ta_weekresult">금주업무실적</label><br>
		<textarea class="form-control" name="ta_weekresult" rows="3" cols="40"
			readonly="readonly">${taskVO.ta_weekresult}</textarea>

	</div> 
	<div class="form-group">
		<label for="ta_weekresult">차주업무계획</label><br>
		<textarea class="form-control" name="ta_nextresult" rows="3" cols="40"
			readonly="readonly">${taskVO.ta_nextresult}</textarea>
		<br> <br>
	</div>
  </div><!-- /.box-body -->

  <div class="box-footer">
    <button type="submit" class="btn btn-warning">Modify</button>
    <button type="submit" class="btn btn-danger">REMOVE</button>
    <button type="submit" class="btn btn-primary">GO LIST </button>
  </div>


<script>
$(document).ready(function(){
	
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$(".btn-warning").on("click", function(){
		formObj.attr("action", "/task/modifyPage");
		formObj.attr("method", "get");		
		formObj.submit();
	});
	
	$(".btn-danger").on("click", function(){
		formObj.attr("method", "post");	
		formObj.attr("action", "/task/removePage");
		formObj.submit();
	});
	
	$(".btn-primary").on("click", function(){
		formObj.attr("method", "get");
		formObj.attr("action", "/task/list");
		formObj.submit();
	});
	
});
</script>


  
  
        </div><!-- /.box -->
      </div><!--/.col (left) -->
 
      </div>   <!-- /.row -->
    </section><!-- /.content -->
    <%@include file="../main/footer.jsp"%>
  