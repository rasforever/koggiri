<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>


<%@ include file="../include/header.jsp"%>
<%-- <%@ include file="side.jsp"%> --%>

<link rel="stylesheet" href="/resources/Content/themes/real/ui_sub.css" />
<link href="/resources/Content/themes/base/jquery-ui.min.css" rel="stylesheet" type="text/css" /> 
<link href="/resources/plugins/fullcalendar/ssi-modal.min.css"
	rel="stylesheet" />
<link rel='stylesheet' href='/resources/plugins/fullcalendar/fullcalendar.css' />
<link type="text/css" rel="stylesheet" href="/resources/plugins/fullcalendar/jquery.qtip.min.css" />
<!-- <script src='/resources/plugins/fullcalendar/ko.js'></script> -->


<script src='/resources/plugins/fullcalendar/moment.min.js'></script>
<script src='/resources/plugins/fullcalendar/fullcalendar.js' charset="euc-kr"></script>
<script type="text/javascript" src="/resources/plugins/fullcalendar/jquery.qtip.min.js"></script>
<script src="/resources/plugins/fullcalendar/ssi-modal.min.js"></script>
<script src='/resources/plugins/fullcalendar/json2.js'></script>

<style type="text/css">
/* body {
	margin: 40px 10px;
	padding: 0;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	font-size: 14px;
} */

#calendar {
	max-width: 900px;
	margin: 0 auto;
}
</style>

<script type="text/javascript">
	$(document)
			.ready(
					function() {

						var tooltip = $('<div/>').qtip({
							id : 'calendar',
							prerender : true,
							content : {
								text : ' ',
								title : {
									button : true
								}
							},
							position : {
								my : 'bottom center',
								at : 'top center',
								target : 'mouse',
								viewport : $('#calendar'),
								adjust : {
									mouse : false,
									scroll : false
								}
							},
							show : false,
							hide : false,
							style : 'qtip-light'
						}).qtip('api');
						// page is now ready, initialize the calendar...
						var count;
						var selected = [];
						var update;
						var send;
						var del;
						$('#calendar')
								.fullCalendar(
										{
											header : {
												left : 'prev,next today',
												center : 'title'/* ,
																											right: 'month,agendaWeek,agendaDay' */
											},

											events : { // 데이터 받고 뿌려주기
												url : 'get',
												type : 'GET'

											},

											navLinks : false, // can click day/week names to navigate views
											selectable : true,
											selectHelper : true,
											select : function(start, end) {
												//일정 추가창
												ssi_modal
														.show(
																{
																	content : '<form>'
																			+ '<label for="title">title:</label><br/>'
																			+ '<input id="title" class="input" name="title" type="text"/><br/>'
																			+ '<label for="content">content:</label><br/>'
																			+ '<textarea id="content" class="input" name="content"></textarea><br/>'
																			+ '</form>',
																	sizeClass : 'small',
																	title : '일정 등록',
																	keepContent : false,
																	beforeClose : function(
																			modal) {
																		ssi_modal
																				.confirm(
																						{
																							position : 'top center',
																							content : '작성하시던 일정이 사라집니다.그래도 끄시겠습니까?',
																							okBtn : {
																								className : 'btn btn-primary'
																							},
																							cancelBtn : {
																								className : 'btn btn-danger'
																							}
																						},
																						function(
																								result) {
																							if (result === true) {
																								modal.options.keepContent = false;
																								modal.options.beforeClose = '';
																								modal
																										.close();
																								ssi_modal
																										.notify(
																												'error',
																												{
																													position : 'center top',
																													content : "The content removed!"
																												})
																							}
																						});
																		return false;
																	},
																	buttons : [ {
																		className : 'btn btn-success',
																		label : '등록',
																		closeAfter : false,
																		keepContent : true,
																		method : function(
																				e,
																				modal) {
																			var beforeCloseMethod = modal.options.beforeClose;
																			modal.options.beforeClose = '';
																			modal.options.keepContent = true;

																			var eventData = {
																				title : title.value,
																				start : start,
																				end : end,
																				content : content.value
																						.replace(
																								/\n/gi,
																								"<br>")

																			}

																			modal
																					.close();
																			modal.options.beforeClose = beforeCloseMethod;
																			ssi_modal
																					.notify(
																							'success',
																							{
																								position : 'center top',
																								content : "일정이 추가되었습니다."
																							})

																			$(
																					'#calendar')
																					.fullCalendar(
																							'renderEvent',
																							eventData,
																							true); // stick? = true

																			var cal = [];

																			cal = $(
																					'#calendar')
																					.fullCalendar(
																							'clientEvents');
																			console
																					.log(cal);

																			cal[cal.length - 1]._id = "_fc"
																					+ cal.length; // _id 1로 자꾸 지정되서 event개수만큼 으로 지정함.
																			send = JSONtoString(
																					cal[cal.length - 1])
																					.replace(
																							/\n/gi,
																							"\\n");
																			//엔터키-->개행문자 전환
																			console
																					.log("send::"
																							+ send);
																			$
																					.ajax({ // 일정 등록

																						type : "POST",
																						url : "/calendar/insert",
																						headers : {
																							"Content-Type" : "application/json",
																							"X-HTTP-Method-Override" : "POST"

																						},
																						dataType : 'text',
																						data : send

																					});
																			ssi_modal
																					.removeAll();
																		}
																	} ]
																}, '#modal4');

												$('#calendar').fullCalendar(
														'unselect');

											},

											editable : true,

											eventDrop : function(event, delta,
													revertFunc) {

												selected = event._id;

												var cal = [];
												cal = $('#calendar')
														.fullCalendar(
																'clientEvents');
												for (var i = 0; i < cal.length; i++) {
													if (cal[i]._id == selected) {
														update = JSONtoString(cal[i]);
													}
												}
												$
														.ajax({
															type : "POST",
															url : "/calendar/update",
															headers : {
																"Content-Type" : "application/json",
																"X-HTTP-Method-Override" : "POST"

															},
															dataType : 'text',
															data : update
														});

											},
											eventLimit : true, // allow "more" link when too many events
											eventClick : function(event,
													element) {

												//일정수정창
												ssi_modal
														.show(
																{
																	content : '<form>'
																			+ '<label for="title">title:</label><br/>'
																			+ '<input id="title" class="input" name="title" type="text" value="'+event.title+'"/><br/>'
																			+ '<label for="content">content:</label><br/>'
																			+ '<textarea id="content" class="input" name="content" >'
																			+ event.content
																					.replace(
																							/<br>/gi,
																							"\n")
																			+ '</textarea><br/>'
																			+ '</form>',
																	sizeClass : 'small',
																	title : '일정 수정',
																	keepContent : false,
																	beforeClose : function(
																			modal) {
																		ssi_modal
																				.confirm(
																						{
																							position : 'top center',
																							content : '작성하시던 일정이 사라집니다.그래도 끄시겠습니까?',
																							okBtn : {
																								className : 'btn btn-primary'
																							},
																							cancelBtn : {
																								className : 'btn btn-danger'
																							}
																						},
																						function(
																								result) {
																							if (result === true) {
																								modal.options.keepContent = false;
																								modal.options.beforeClose = '';
																								modal
																										.close();

																							}
																						});
																		return false;
																	},
																	buttons : [
																			{
																				className : 'btn btn-remove',
																				label : '삭제',
																				closeAfter : false,
																				keepContent : false,
																				method : function(
																						e,
																						modal) {
																					var beforeCloseMethod = modal.options.beforeClose;
																					modal.options.beforeClose = '';
																					modal.options.keepContent = true;

																					modal
																							.close();
																					selected = event._id;
																					/* alert(event._id); */

																					var cal = [];
																					cal = $(
																							'#calendar')
																							.fullCalendar(
																									'clientEvents');

																					for (var i = 0; i < cal.length; i++) {
																						if (cal[i]._id == selected) {

																							del = JSONtoString(cal[i]);

																							$(
																									'#calendar')
																									.fullCalendar(
																											'removeEvents',
																											event._id);

																							$
																									.ajax({
																										type : "POST",
																										url : "/calendar/delete",
																										headers : {
																											"Content-Type" : "application/json",
																											"X-HTTP-Method-Override" : "POST"

																										},
																										data : del

																									});
																						}
																					}

																					ssi_modal
																							.removeAll();
																				}

																			},
																			{
																				className : 'btn btn-success',
																				label : '수정',
																				closeAfter : false,
																				keepContent : true,
																				method : function(
																						e,
																						modal) {
																					var beforeCloseMethod = modal.options.beforeClose;
																					modal.options.beforeClose = '';
																					modal.options.keepContent = true;

																					modal
																							.close();
																					modal.options.beforeClose = beforeCloseMethod;
																					ssi_modal
																							.notify(
																									'success',
																									{
																										position : 'center top',
																										content : "일정이 수정되었습니다."
																									})

																					event.title = title.value;
																					event.content = content.value;

																					selected = event._id;

																					$(
																							'#calendar')
																							.fullCalendar(
																									'updateEvent',
																									event);

																					var cal = [];
																					cal = $(
																							'#calendar')
																							.fullCalendar(
																									'clientEvents');
																					for (var i = 0; i < cal.length; i++) {
																						if (cal[i]._id == selected) {
																							update = JSONtoString(cal[i]);

																						}
																					}

																					$
																							.ajax({
																								type : "POST",
																								url : "/calendar/update",
																								headers : {
																									"Content-Type" : "application/json",
																									"X-HTTP-Method-Override" : "POST"

																								},
																								dataType : 'text',
																								data : update

																							});

																					ssi_modal
																							.removeAll();
																				}
																			} ]
																}, '#modal4');

											},
											//event의 사이즈를 줄였다 늘였다 할 수 있는 기능
											eventResizeStart : function(event) {
												startDateOnStart = event.start;
												endDateOnStart = event.end;
												selected = event._id;

											},
											eventResizeStop : function(event) {
												// I added 1 sec delay because in my experience the event object needs some time to update.
												setTimeout(
														function() {
															startDateOnStop = event.start;
															endDateOnStop = event.end;
															selected = event._id;

														}, 1000);

											},

											eventResize : function(event,
													delta, revertFunc) { // 이벤트 크기 변경

												var cal = [];
												cal = $('#calendar')
														.fullCalendar(
																'clientEvents');
												for (var i = 0; i < cal.length; i++) {
													if (cal[i]._id == selected) {

														update = JSONtoString(cal[i]);
													}
												}
												$
														.ajax({
															type : "POST",
															url : "/calendar/update",
															headers : {
																"Content-Type" : "application/json",
																"X-HTTP-Method-Override" : "POST"

															},
															dataType : 'text',
															data : update
														});

											},
											eventMouseout : function(data,
													event, view) {
												$(this).css('z-index', 8);

												$('.tooltiptopicevent')
														.remove();
											},
											eventMouseover : function(data,
													event, view) {

												/*   var content = '<h3>'+data.content+'</h3>';
												tooltip.set({
												'content.text': content
												}).reposition(event).show(event);  */

												//마우스 오버할때 이벤트의 content가 보여짐
												tooltip = '<div class="tooltiptopicevent" style="width:100px;height:100px;background:#ccc;position:absolute;z-index:10001;">'
														+ '<h3>'
														+ data.title
														+ '</h3>'
														+ '<p><b>Content:</b> '
														+ data.content
														+ '</div>';

												$("body").append(tooltip);
												$(this)
														.mouseover(
																function(e) {
																	$(this)
																			.css(
																					'z-index',
																					10000);
																	$(
																			'.tooltiptopicevent')
																			.fadeIn(
																					'500');
																	$(
																			'.tooltiptopicevent')
																			.fadeTo(
																					'10',
																					1.9);
																})
														.mousemove(
																function(e) {
																	$(
																			'.tooltiptopicevent')
																			.css(
																					'top',
																					e.pageY + 10);
																	$(
																			'.tooltiptopicevent')
																			.css(
																					'left',
																					e.pageX + 20);
																});

											}

										});

					});

	//json을 string으로 변환하는 함수
	function JSONtoString(object) {
		var results = [];
		for ( var property in object) {
			var value = object[property];
			if (property.toString() != "start" && property.toString() != "end") {
				results.push('"' + property.toString() + '"' + ': ' + '"'
						+ value + '"');
			} else if (property.toString() == "start"
					|| property.toString() == "end") { // 속성이 start,end일때 13자리 값을 날짜로 변환
				results.push('"' + property.toString() + '"' + ': ' + '"'
						+ new moment(value).format("YYYY-MM-DD") + '"');
			}
		}

		return '{' + results.join(', ') + '}';
	}
</script>


<div class="container_wrap" style="background-color: #ffffff;">
<div id="container">

<div id="sub_menu_title">
<h1><img src="/resources/img/s_menu10.png"/></h1>
<div class="breadcrumb">   
    <span><a href="/main">홈</a>  <span> &gt; </span> <a href="#">회사정보</a>  &gt;  <strong>조직도</strong></span>
</div>
</div>


<div id="lnb">
   <div class="lnb01">
      <strong class="menu05"><span>회사 정보</span></strong>
      <ul>
                <li class="menu01 ">
                    <a href="#">Koggiri란?</a>
                    <ul> </ul>
                </li>
                <li class="menu02 ">
                    <a href="/chart/listAll">조직도</a>
                    <ul>
                      <li class="sub01 "><a href="/chart/list?dept_id=MM">경영팀</a></li>
                      <li class="sub02 "><a href="/chart/list?dept_id=PL">인사팀</a></li>
                      <li class="sub03 "><a href="/chart/list?dept_id=MT">관리팀</a></li>
                      <li class="sub01 "><a href="/chart/list?dept_id=SN">솔루션팀</a></li>
                      <li class="sub02 "><a href="/chart/list?dept_id=BS">영업팀</a></li>
                      <li class="sub03 "><a href="/chart/list?dept_id=MG">마게팅팀</a></li>
                    </ul>
                </li>
           </ul>
   </div>
</div>

<div id="content">

	<div id="calendar"></div>
       
</div>




<!-- 본문 끝 -->

<div class="footer_wrap" style="background-color: #ffffff;">
<%@ include file="../include/footer.jsp"%>













