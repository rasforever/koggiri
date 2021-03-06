<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
<script type="text/javascript" src="/resources/js/approval.js"></script>
<!-- <script src="http://code.jquery.com/jquery-1.10.2.js"></script> -->
<!-- <script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script> -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<link rel="stylesheet"
	href="../resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<%@ include file="../include/header.jsp"%>


<link rel="stylesheet" href="/resources/Content/themes/real/ui_sub.css" />
<link href="/resources/Content/themes/base/jquery-ui.min.css"
	rel="stylesheet" type="text/css" />

<div class="container_wrap" style="background-color: #ffffff;">
	<div id="container">

		<div id="sub_menu_title">
			<h1>
				<img src="/resources/img/s_menu04.png" />
			</h1>
			<div class="sub_top">
				<span><a href="/main">홈</a> <span> &gt; </span> <a
					href="/task/list">전자 문서</a> <span> &gt; </span> <a
					href="/approval/lists">전자결재</a> &gt; <strong>받은 결재</strong></span>
			</div>
		</div>


		<div id="lnb">
			<div class="lnb01">
				<strong class="menu02"><span>전자결재</span></strong>
				<ul>
					<li class="menu01"><a href="/task/list">업무보고</a>
						<ul>
						</ul></li>
					<li class="menu02 "><a href="/approval/lists">전자결재</a>
						<ul>
							<li class="sub01 "><a href="/approval/lists">보낸 결재</a></li>
							<li class="sub02 "><a href="/approval/listr">받은 결재</a></li>
							<li class="sub03 "><a href="/approval/register">결재 입력</a></li>
						</ul></li>
					<li class="menu03 "><a href="/document/list">문서함</a>
						<ul></ul></li>
				</ul>
			</div>
		</div>

		<div id="sub_content" align="center">


			<!--  본문 -->

			<div class="row">
				<!-- left column -->
				<div class="col-md-12">
					<!-- general form elements -->
					<div class='box'>
						<div class='box-body' align="left">
						<div style="height: 40px;">
				<button id='AllsearchBtn'>전체</button>
										<button id='a_searchBtn'>기안중</button>
										<button id='c_searchBtn'>완료</button>
										<button id='n_searchBtn'>부결</button>
										</tr>
									<input type='hidden' name='app_pro_cd' id='app_pro_cd'
										value="${search.app_pro_cd}">
									<input type='hidden' name='app_emp_id' id='app_emp_id'
										value="${search.app_emp_id}">
				</div>
							
							<table class="app_sel_table">
								
									<tr ><td style="text-align: left; width: 120px"><input type="checkbox" name="area" value="app_id" onclick="dis_chg(this)">결재문서번호</input></td>
									<td style="text-align: left;"><input type="text" name="search_app_id" id="search_app_id" size="30" disabled></input></td></tr>
									
									<tr ><td style="text-align: left;"><input type="checkbox" name="area" value="app_type_cd" onclick="dis_chg(this)">결재구분</input></td>
									<td style="text-align: left;"><select id="app_type" name="app_type" disabled >
										<option value=" ">--전체--
											<c:forEach var="apptypeVO" items="${applist}">
												<option value="${apptypeVO.app_type_cd}">${apptypeVO.app_type_nm}
												</option>
											</c:forEach>
									</select>
									</td></tr>
									
									<tr><td style="text-align: left;"><input type="checkbox" name="area" value="dept_cd" onclick="dis_chg(this)">관리부서</input></td>
									<td style="text-align: left;"><select id="dept_cd" name="dept_cd" disabled>
											<option value=" ">--전체--
												<c:forEach var="deptVO" items="${deptlist}">
													<option value="${deptVO.dept_id}">${deptVO.dept_nm}</option>
												</c:forEach>
									</select></td></tr>
				
									<tr><td style="text-align: left;"><input type="checkbox" name="area" value="draft_emp_id" onclick="dis_chg(this)">기안자 </input></td>
									<td style="text-align: left;"><input type="text" name="draft_emp_id" id="draft_emp_id" size="30" disabled></input></td></tr>
									
									<tr><td style="text-align: left;"><input type="checkbox" name="area" value="draft_dt"
										onclick="dis_chg(this)">제안일</input></td>
										<td style="text-align: left;"><input type="text"
										name="draft_s_dt" id="draft_s_dt" class="datepicker" disabled
										size="14"> ~ <input type="text" name="draft_e_dt"
										id="draft_e_dt" class="datepicker" disabled size="14"></td></tr>

									<tr><td colspan="2" style="text-align: right; background-color: #f4f4f4; font-size: 17px; font-weight: bold;"><button id='searchBtn'>Search &nbsp;&nbsp;</button></td></tr>
								
							</table>
						</div>
					</div>


					<div class="box">
						<div class="box-body">
							<table class="table table-bordered" >
								<tr>
									<th  style="text-align: center;">결재문서번호</th>
									<th  style="text-align: center;">제안일</th>
									<th  style="text-align: center;">결재구분</th>
									<th  style="text-align: center;">관리부서</th>
									<th  style="text-align: center;">기안자</th>
									<th  style="text-align: center;">결재자</th>
									<th  style="text-align: center;">진행상태</th>
								</tr>

								<c:forEach items="${list}" var="approvalVO">

									<tr>
										<td><a
											href='/approval/readPage${pageMaker.makeSearch(pageMaker.search.page) }&app_id=${approvalVO.app_id}'>
												${approvalVO.app_id} </a></td>
										<td><a
											href='/approval/readPage${pageMaker.makeSearch(pageMaker.search.page) }&app_id=${approvalVO.app_id}'>${approvalVO.draft_dt.substring(0,10)}</a></td>
										<td><a
											href='/approval/readPage${pageMaker.makeSearch(pageMaker.search.page) }&app_id=${approvalVO.app_id}'>${approvalVO.app_type_nm}</a></td>
										<td><a
											href='/approval/readPage${pageMaker.makeSearch(pageMaker.search.page) }&app_id=${approvalVO.app_id}'>${approvalVO.dept_nm}</a></td>
										<td><a
											href='/approval/readPage${pageMaker.makeSearch(pageMaker.search.page) }&app_id=${approvalVO.app_id}'>${approvalVO.draft_emp_nm}</a></td>
										<td><a
											href='/approval/readPage${pageMaker.makeSearch(pageMaker.search.page) }&app_id=${approvalVO.app_id}'>${approvalVO.app_emp_nm}</a></td>
										<td><a
											href='/approval/readPage${pageMaker.makeSearch(pageMaker.search.page) }&app_id=${approvalVO.app_id}'>${approvalVO.app_pro_nm}</a></td>


									</tr>

								</c:forEach>

							</table>
						</div>
						<!-- /.box-body -->


						<div class="box-footer">

							<div class="text-center">
								<ul class="pagination">

									<c:if test="${pageMaker.prev}">
										<li><a
											href="listr${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
									</c:if>

									<c:forEach begin="${pageMaker.startPage }"
										end="${pageMaker.endPage }" var="idx">
										<li
											<c:out value="${pageMaker.search.page == idx?'class =active':''}"/>>
											<a href="listr${pageMaker.makeSearch(idx)}">${idx}</a>
										</li>
									</c:forEach>

									<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
										<li><a
											href="listr${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
									</c:if>

								</ul>
							</div>

						</div>
						<!-- /.box-footer-->
					</div>
				</div>
				<!--/.col (left) -->

			</div>

		</div>


	</div>
</div>


<!-- 본문 끝 -->

<div class="footer_wrap">
	<div id="footer" style="height: 150px">
		<%@ include file="../include/footer.jsp"%>


		<script>
			var result = '${msg}';
		
			if (result == 'SUCCESS') {
				alert("처리가 완료되었습니다.");
				location.replace(self.location);
			}
		</script>

		<script>

	$(document).ready(
		function() {
			$('#searchBtn').on(
				"click",
				function(event) {
					var ck_app_type_cd;
					var s_dt;
					var e_dt;
					var s_app_id;
					var s_draft_emp_id;
					if ($('#draft_s_dt').val() == "") {
						s_dt = "0001/01/01";
					} else {
						s_dt = $('#draft_s_dt').val();
					}
					if ($('#draft_e_dt').val() == "") {
						e_dt = "9999/12/31";
					} else {
						e_dt = $('#draft_e_dt').val();
					}
					if ($('#search_app_id').val() == "") {
						s_app_id = " ";
					} else {
						s_app_id = $('#search_app_id').val();
					}
					if ($('#draft_emp_id').val() == "") {
						s_draft_emp_id = " ";
					} else {
						s_draft_emp_id = $('#draft_emp_id').val();
					}
					if ($('#app_pro_cd').val() == "") {
						ck_app_type_cd = "%20";
					} else {
						ck_app_type_cd = $('#app_pro_cd').val();
					}

					self.location = "listr"
						+ '${pageMaker.makeQuery(1)}'
						+ "&searchType=r"
						+ "&app_pro_cd=" + ck_app_type_cd
						+ "&search_app_id=" + s_app_id
						+ "&app_type=" + $('#app_type').val()
						+ "&dept_cd=" + $('#dept_cd').val()
						+ "&draft_emp_id=" + s_draft_emp_id
						+ "&app_emp_id=" + $('#app_emp_id').val()
						+ "&draft_s_dt=" + s_dt
						+ "&draft_e_dt=" + e_dt;

				});
			$('#AllsearchBtn').on(
				"click",
				function(event) {
					ck_app_type_cd = "%20";
					var s_dt;
					var e_dt;
					var s_app_id;
					var s_draft_emp_id;
					if ($('#draft_s_dt').val() == "") {
						s_dt = "0001/01/01";
					} else {
						s_dt = $('#draft_s_dt').val();
					}
					if ($('#draft_e_dt').val() == "") {
						e_dt = "9999/12/31";
					} else {
						e_dt = $('#draft_e_dt').val();
					}
					if ($('#search_app_id').val() == "") {
						s_app_id = " ";
					} else {
						s_app_id = $('#search_app_id').val();
					}
					if ($('#draft_emp_id').val() == "") {
						s_draft_emp_id = " ";
					} else {
						s_draft_emp_id = $('#draft_emp_id').val();
					}


					self.location = "listr"
						+ '${pageMaker.makeQuery(1)}'
						+ "&searchType=r"
						+ "&app_pro_cd=" + ck_app_type_cd
						+ "&search_app_id=" + s_app_id
						+ "&app_type=" + $('#app_type').val()
						+ "&dept_cd=" + $('#dept_cd').val()
						+ "&draft_emp_id=" + s_draft_emp_id
						+ "&app_emp_id=" + $('#app_emp_id').val()
						+ "&draft_s_dt=" + s_dt
						+ "&draft_e_dt=" + e_dt;

				});
			$('#a_searchBtn').on(
				"click",
				function(event) {
					ck_app_type_cd = "0";
					var s_dt;
					var e_dt;
					var s_app_id;
					var s_draft_emp_id;
					if ($('#draft_s_dt').val() == "") {
						s_dt = "0001/01/01";
					} else {
						s_dt = $('#draft_s_dt').val();
					}
					if ($('#draft_e_dt').val() == "") {
						e_dt = "9999/12/31";
					} else {
						e_dt = $('#draft_e_dt').val();
					}
					if ($('#search_app_id').val() == "") {
						s_app_id = " ";
					} else {
						s_app_id = $('#search_app_id').val();
					}
					if ($('#draft_emp_id').val() == "") {
						s_draft_emp_id = " ";
					} else {
						s_draft_emp_id = $('#draft_emp_id').val();
					}


					self.location = "listr"
						+ '${pageMaker.makeQuery(1)}'
						+ "&searchType=r"
						+ "&app_pro_cd=" + ck_app_type_cd
						+ "&search_app_id=" + s_app_id
						+ "&app_type=" + $('#app_type').val()
						+ "&dept_cd=" + $('#dept_cd').val()
						+ "&draft_emp_id=" + s_draft_emp_id
						+ "&app_emp_id=" + $('#app_emp_id').val()
						+ "&draft_s_dt=" + s_dt
						+ "&draft_e_dt=" + e_dt;

				});
			$('#c_searchBtn').on(
				"click",
				function(event) {
					ck_app_type_cd = "1";
					var s_dt;
					var e_dt;
					var s_app_id;
					var s_draft_emp_id;
					if ($('#draft_s_dt').val() == "") {
						s_dt = "0001/01/01";
					} else {
						s_dt = $('#draft_s_dt').val();
					}
					if ($('#draft_e_dt').val() == "") {
						e_dt = "9999/12/31";
					} else {
						e_dt = $('#draft_e_dt').val();
					}
					if ($('#search_app_id').val() == "") {
						s_app_id = " ";
					} else {
						s_app_id = $('#search_app_id').val();
					}
					if ($('#draft_emp_id').val() == "") {
						s_draft_emp_id = " ";
					} else {
						s_draft_emp_id = $('#draft_emp_id').val();
					}


					self.location = "listr"
						+ '${pageMaker.makeQuery(1)}'
						+ "&searchType=r"
						+ "&app_pro_cd=" + ck_app_type_cd
						+ "&search_app_id=" + s_app_id
						+ "&app_type=" + $('#app_type').val()
						+ "&dept_cd=" + $('#dept_cd').val()
						+ "&draft_emp_id=" + s_draft_emp_id
						+ "&app_emp_id=" + $('#app_emp_id').val()
						+ "&draft_s_dt=" + s_dt
						+ "&draft_e_dt=" + e_dt;

				});
			$('#n_searchBtn').on(
				"click",
				function(event) {
					ck_app_type_cd = "2";
					var s_dt;
					var e_dt;
					var s_app_id;
					var s_draft_emp_id;
					if ($('#draft_s_dt').val() == "") {
						s_dt = "0001/01/01";
					} else {
						s_dt = $('#draft_s_dt').val();
					}
					if ($('#draft_e_dt').val() == "") {
						e_dt = "9999/12/31";
					} else {
						e_dt = $('#draft_e_dt').val();
					}
					if ($('#search_app_id').val() == "") {
						s_app_id = " ";
					} else {
						s_app_id = $('#search_app_id').val();
					}
					if ($('#draft_emp_id').val() == "") {
						s_draft_emp_id = " ";
					} else {
						s_draft_emp_id = $('#draft_emp_id').val();
					}


					self.location = "listr"
						+ '${pageMaker.makeQuery(1)}'
						+ "&searchType=r"
						+ "&app_pro_cd=" + ck_app_type_cd
						+ "&search_app_id=" + s_app_id
						+ "&app_type=" + $('#app_type').val()
						+ "&dept_cd=" + $('#dept_cd').val()
						+ "&draft_emp_id=" + s_draft_emp_id
						+ "&app_emp_id=" + $('#app_emp_id').val()
						+ "&draft_s_dt=" + s_dt
						+ "&draft_e_dt=" + e_dt;

				});
			$('#draft_emp_id').on(
					"click",
					function(event) {
						window.open('../admin_emp/emp', 'EMP', "width=400px height=500px");
					});
		});

	function dis_chg(obj) {
		if (obj.checked == true) {
			if ($(obj).val() == "app_id") {
				$('#search_app_id').attr("disabled", false);
			} else if ($(obj).val() == "app_type_cd") {
				$('#app_type').attr("disabled", false);
			} else if ($(obj).val() == "dept_cd") {
				$('#dept_cd').attr("disabled", false);
			} else if ($(obj).val() == "draft_emp_id") {
				$('#draft_emp_id').attr("disabled", false);
			} else if ($(obj).val() == "draft_dt") {
				$('#draft_s_dt').attr("disabled", false);
				$('#draft_e_dt').attr("disabled", false);
			}

		} else if (obj.checked == false) {
			if ($(obj).val() == "app_id") {
				$('#search_app_id').attr("disabled", true);
			} else if ($(obj).val() == "app_type_cd") {
				$('#app_type').attr("disabled", true);
			} else if ($(obj).val() == "dept_cd") {
				$('#dept_cd').attr("disabled", true);
			} else if ($(obj).val() == "draft_emp_id") {
				$('#draft_emp_id').attr("disabled", true);
			} else if ($(obj).val() == "draft_dt") {
				$('#draft_s_dt').attr("disabled", true);
				$('#draft_e_dt').attr("disabled", true);
			}
		}
	}
</script>