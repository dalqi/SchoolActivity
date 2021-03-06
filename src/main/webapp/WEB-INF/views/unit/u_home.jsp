<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="u_header.jsp"%>

<script type="text/javascript">
	$(function() {
		startTime();//时间初识化
		//模态的进入界面自动加载
		$("#DetailsModal").modal({
			backdrop : false,//是否显示遮障层，就是背景
			keyboard : false,//
			show : false
		});
	});

	function details(id) {
		var base = "${pageContext.request.contextPath}";
		$.ajax({
			url : base + "/student/activity/xdata",
			type : "GET",
			datatype : "text",
			data : "id=" + id,
			error : function(XMLHttpRequest, textStatus, errorThrown) {

			},
			success : function(data) {
				var propas = (data.a_propas).split("");
				for (var i = 0; i < propas.length; i++) {
					if (propas[i] == "1")
						$("#xcwp").append("喷绘,  ");
					if (propas[i] == "2")
						$("#xcwp").append("海报,  ");
					if (propas[i] == "3")
						$("#xcwp").append("展板,  ");
					if (propas[i] == "4")
						$("#xcwp").append("条幅,  ");
					if (propas[i] == "5")
						$("#xcwp").append("拱门,  ");
					if (propas[i] == "6")
						$("#is").append("活动涉及售卖物品 ,  ");
					if (propas[i] == "7")
						$("#is").append("活动用电 ,  ");
					if (propas[i] == "8")
						$("#is").append("活动有校外单位参与,  ");
				}

				$("#student").append("");
				$("#student").append(data.student);
				$("#unit").append("");
				$("#unit").append(data.unit);
				$("#a_content").append("");
				$("#a_content").append(data.a_content);
				$("#a_place").append("");
				$("#a_place").append(data.a_place);
				$("#a_person").append("");
				$("#a_person").append(data.a_person);
				$("#a_phone").append("");
				$("#a_phone").append(data.a_phone);
				
				$("#date").append("");
				$("#date").append(data.date);
				$("#time_start").append("");
				$("#time_start").append(data.time_start);
				$("#time_end").append("");
				$("#time_end").append(data.time_end);
				
				$("#a_person_number").append("");
				$("#a_person_number").append(data.a_person_number);
				$("#a_word").append("");
				$("#a_word").append(data.a_word);
				$("#a_create_time").append("");
				$("#a_create_time").append(data.a_create_time);

				if (data.a_state == 1) {
					$("#a_state").append("");
					$("#a_state").append("未审查");
				}
				if (data.a_state == 2) {
					$("#a_state").append("");
					$("#a_state").append("已审查");
				}
				if (data.a_state == 3) {
					$("#a_state").append("");
					$("#a_state").append("未通过");
				}
				if (data.a_state == 4) {
					$("#a_state").append("");
					$("#a_state").append("已批准");
				}
				if (data.a_state == 5) {
					$("#a_state").append("");
					$("#a_state").append("未批准");
				}
				if (data.a_state == 6) {
					$("#a_state").append("");
					$("#a_state").append("已取消申请");
				}

				$("#w_t1_1").append("");
				$("#w_t1_1").append(data.w_t1);

				$("#w_t2_1").append("");
				$("#w_t2_1").append(data.w_t2);

				$("#w_t3_1").append("");
				$("#w_t3_1").append(data.w_t3);

				$("#w_t4_1").append("");
				$("#w_t4_1").append(data.w_t4);

				$("#w_t5_1").append("");
				$("#w_t5_1").append(data.w_t5);

			}
		})

	}

	function detailsClose() {
		window.location.href = "${pageContext.request.contextPath}/unit/activity/a.list";
	}

	function pageOut() {
		var r = confirm("您真的要退出系统吗？");
		if (r == true) {
			alert("OK");
		} else {
			alert("Cancel");
		}
	}

	function startTime() {
		var today = new Date();
		var year = today.getFullYear();
		var month = today.getMonth();
		var date = today.getDate();
		//获取的只是0-6的数字，需要处理输出
		var day = today.getDay();
		var h = today.getHours();
		var m = today.getMinutes();
		var s = today.getSeconds();
		var m1 = checkTime(m);
		var s1 = checkTime(s);
		//星期处理方法
		day = checkDay(day);
		document.getElementById("time_year").innerHTML = year + ":"
				+ (month + 1) + ":" + date + "   " + day;
		document.getElementById("time_day").innerHTML = h + ":" + m1 + ":" + s1;
		t = setTimeout('startTime()', 1500);
	}

	//星期处理方法
	function checkDay(j) {
		if (j == 1) {
			j = "星期一";
		} else if (j == 2) {
			j = "星期二";
		} else if (j == 3) {
			j = "星期三";
		} else if (j == 4) {
			j = "星期四";
		} else if (j == 5) {
			j = "星期五";
		} else if (j == 6) {
			j = "星期六";
		} else if (j == 0) {
			j = "星期日";
		}
		return j;
	}

	//空位补0
	function checkTime(i) {
		if (i < 10) {
			i = "0" + i;
		}
		return i;
	}
</script>

<body onload="startTime()">
	<div class="col-md-12">
		<%@ include file="u_navbar.jsp"%>
		<div class="col-md-12">
			<div class="col-md-6 ">
				<p>
					<strong>组织基本信息：</strong>
				</p>
				<table class="table table-bordered table-hover" border="2">
					<tr>
						<td class="table-thead-bg-font">单位名</td>
						<td>${user.username}</td>
					</tr>
					<tr>
						<td class="table-thead-bg-font">类型</td>
						<td><c:if test="${user.user_type=='1'}">学生组织</c:if> <c:if
								test="${user.user_type=='2'}">主管单位</c:if> <c:if
								test="${user.user_type=='3'}">校团委</c:if></td>
					</tr>
					<tr>
						<td class="table-thead-bg-font">校团委</td>
						<td>${users.username}</td>
					</tr>
				</table>
			</div>

			<!-- 时间div  -->
			<div class="col-md-6">
				<p>
					<strong>当前时间：</strong>
				</p>
				<div class="div_time">
					<div>
						<p id="time_year">0000:00:00 星期日</p>
						<span id="time_day">00:00:00</span>
					</div>
				</div>
			</div>

		</div>

		<div class="col-md-12">
			<div style="margin-top: 20px;">
				<p><strong>活动申请进度：</strong></p>
			</div>
			<table class="table table-bordered table-hover" id="t_activity"
				border="2" cellpadding="0" cellspacing="0">
				<thead>
					<tr class="table-thead-bg-font">
						<td>id</td>
						<td>内容</td>
						<td>地点</td>
						<td>日期</td>
						<td>开始时间</td>
						<td>结束时间</td>
						<td>人数</td>
						<td>负责人</td>
						<td>责任单位</td>
						<td>申请进度</td>
						<td>详情</td>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty alist}">
						<tr>
							<td  colspan="12">
								<div class="list_empty">无活动公告信息</div>
							</td>
						</tr>
					</c:if>
					<c:forEach items="${alist}" var="list" varStatus="vs">
						<tr>
							<td>${vs.index+1}</td>
							<td>${list.a_content}</td>
							<td>${list.a_place}</td>
							<td>${list.date}</td>
							<td>${list.time_start}</td>
							<td>${list.time_end}</td>

							<td>${list.a_person_number}</td>
							<td>${list.a_person}</td>
							<td>${list.unit}</td>
							<td>
								<c:if test="${list.a_state=='1'}">未审查</c:if> 
								<c:if test="${list.a_state=='2'}">已审查</c:if> 
								<c:if test="${list.a_state=='3'}">未通过</c:if> 
								<c:if test="${list.a_state=='4'}">已批准</c:if> 
								<c:if test="${list.a_state=='5'}">未批准</c:if> 
								<c:if test="${list.a_state=='6'}">已取消申请</c:if>
							</td>
							<td><a href="#"><font color="#0000FF"
									data-toggle="modal" data-target="#DetailsModal"
									onclick="details('${list.id}')">更多信息</font></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>


		<!-- 信息详情模态框Modal -->
		<div class="modal fade" id="DetailsModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close"></button>
						<h4 class="modal-title" id="myModalLabel">活动具体信息</h4>
					</div>
					<div class="modal-body">
						<div>
							<table class="table table-bordered table-hover" id="t_activity"
								border="2" cellpadding="0" cellspacing="0">
								<tr>
									<td class="table-thead-bg-font">学生组织</td>
									<td id="student"></td>
								</tr>
								<tr>
									<td class="table-thead-bg-font">主管单位</td>
									<td id="unit"></td>
								</tr>
								<tr>
									<td class="table-thead-bg-font">活动内容</td>
									<td id="a_content"></td>
								</tr>
								<tr>
									<td class="table-thead-bg-font">活动地点</td>
									<td id="a_place"></td>
								</tr>
								<tr>
									<td class="table-thead-bg-font">活动负责人</td>
									<td id="a_person"></td>
								</tr>
								<tr>
									<td class="table-thead-bg-font">负责人联系电话</td>
									<td id="a_phone"></td>
								</tr>
								<tr>
									<td class="table-thead-bg-font">活动开展日期</td>
									<td id="date"></td>
								</tr>
								<tr>
									<td class="table-thead-bg-font">活动开始时间</td>
									<td id="time_start"></td>
								</tr>
								<tr>
									<td class="table-thead-bg-font">活动结束时间</td>
									<td id="time_end"></td>
								</tr>
								<tr>
									<td class="table-thead-bg-font">活动宣传文字</td>
									<td id="a_word"></td>
								</tr>
								<tr>
									<td class="table-thead-bg-font">提交申请时间</td>
									<td id="a_create_time"></td>
								</tr>
								<tr>
									<td class="table-thead-bg-font">活动申请状态</td>
									<td id="a_state"></td>
								</tr>
								<tr>
									<td class="table-thead-bg-font">座椅</td>
									<td id="w_t1_1"></td>
								</tr>
								<tr>
									<td class="table-thead-bg-font">帐篷</td>
									<td id="w_t2_1"></td>
								</tr>
								<tr>
									<td class="table-thead-bg-font">投影仪</td>
									<td id="w_t3_1"></td>
								</tr>
								<tr>
									<td class="table-thead-bg-font">幕布</td>
									<td id="w_t4_1"></td>
								</tr>
								<tr>
									<td class="table-thead-bg-font">音响</td>
									<td id="w_t5_1"></td>
								</tr>
								<tr>
									<td class="table-thead-bg-font">活动宣传物品</td>
									<td id="xcwp"></td>
								</tr>
								<tr>
									<td class="table-thead-bg-font">活动附加</td>
									<td id="is"></td>
								</tr>
							</table>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							onclick="detailsClose()">关闭</button>
					</div>
				</div>
			</div>
		</div>

		<%@ include file="../common/address.jsp"%>
	</div>

</body>
</html>