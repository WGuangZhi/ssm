<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal fade" id="update">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">更改用户信息</h4>
				</div>
				<div class="modal-body">
					<form action="${pageContext.request.contextPath}/user?method=updateForm" id="updateForm" method="post">
						<input type="hidden" name="id" class="form-control inputId" id=""/>
						 <input type="hidden" name="currentPage" value="${page.currentPage}">
						 <input type="hidden" name="pageNum" value="${page.pageNum}">
						<div class="form-group">
							<label>角色名称</label>
							<span class="errorName"></span>
							<input type="text" name="name" class="form-control inputName" id=""/>
						</div>
						<div class="form-group">
							<label>角色描述</label>
							<span class="errorDescription"></span>
							<input type="text" name="description" class="form-control inputDescription" id=""/>
						</div>
						<div class="form-group">
							<label>当前权限列表</label>
							<div type="text" class="form-control inputMenu" id=""></div>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">修改权限</label>
							<span class="errorPers"></span>
							<ul class="pers">
							</ul>
						</div>
						<button type="button" class="btn updateForm btn-warning">修改</button>
					</form>
				</div>
			</div>
		</div>
</div>