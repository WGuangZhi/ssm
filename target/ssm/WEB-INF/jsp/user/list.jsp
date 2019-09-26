<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="row">
	<div class="col-md-12">
		<div class="box">
			<div class="box-header with-border">
				<h3 class="box-title">用户列表</h3>
				<div class="box-tools">
					<button type="button"
						class="addbtn btn btn-block btn-success btn-flat"
						data-toggle="modal" data-target="#add">
						<i class="fa fa-plus"></i>
					</button>
				</div>
			</div>
			<div class="box-body">
				<table class="table table-bordered">
					<tr>
						<th>序号</th>
						<th>用户名称</th>
						<th>邮箱</th>
						<th>电话号码</th>
						<th>用户头像</th>
						<th>状态</th>
						<th style="width: 200px">操作</th>
					</tr>

					<c:forEach items="${page.datas }" var="user" varStatus="status">
						<tr>
							<td>${status.index+1}</td>
							<td>${user.userName }</td>
							<td>${user.email }</td>
							<td>${user.phone }</td>
							<td>${user.userInfo.imageurl }</td>
							<td>${user.status }</td>
							<td>
								<div class="btn-group" style="margin-left: 9px">
									<a type="button" class="btn btn-info look"
										style="margin-right: 3px" data-toggle="modal"
										data-target="#show"> <input type="hidden"
										value="${user.id }">查看
									</a>
									<button type="button" class="btn btn-warning update"
										style="margin-right: 3px" data-toggle="modal"
										data-target="#update">
										<input type="hidden" value="${user.id }">修改
									</button>
									<button type="button" value="${user.id }" class="delete btn btn-danger">删除</button>
								</div>
							</td>
						</tr>
					</c:forEach>
					<input type="hidden" class="currentPage" name="currentPage" value="${page.currentPage}">
					<input type="hidden" class="pageNum" name="currentPage" value="${page.pageNum}">
				</table>
			</div>
			<!-- 显示页数开始(pointer-events: none;一个不能点的链接，，cursor:not-allowed;鼠标禁用) -->
			<div class="box-footer clearfix">
				<ul class="pagination pagination-sm no-margin pull-right">
					<li><a
						style="<c:if test="${page.currentPage eq 1 }">pointer-events: none;border:1px solid #e6e6e6;background-color:#FBFBFB;color:#C9C9C9;cursor:not-allowed;opacity:1</c:if>"
						href="${pageContext.request.contextPath}/user/index?currentPage=${page.currentPage-1 }">&laquo;</a>
					</li>
					<li><c:forEach begin="1" step="1" end="${page.totalPage }"
							var="pages">
							<c:choose>
								<c:when test="${pages eq page.currentPage }">
									<a style="color: red; pointer-events: none"
										href="${pageContext.request.contextPath}/user/index?currentPage=${pages }">${pages }</a>
								</c:when>
								<c:otherwise>
									<a
										href="${pageContext.request.contextPath}/user/index?currentPage=${pages }">${pages }</a>
								</c:otherwise>
							</c:choose>
						</c:forEach></li>
					<li><a
						style="padding-left: 15px; <c:if test="${page.currentPage eq page.totalPage }">pointer-events: none;border:1px solid #e6e6e6;background-color:#FBFBFB;color:#C9C9C9;cursor:not-allowed;opacity:1</c:if>; text-decoration: none;"
						href="${pageContext.request.contextPath}/user/index?currentPage=${page.currentPage+1 }">&raquo;</a>
					</li>
					<li><span style="margin-left: 10px;">共 ${page.totalNum }
							条</span></li>
				</ul>
			</div>
			<!--   显示页数结束 -->
		</div>
	</div>
</div>