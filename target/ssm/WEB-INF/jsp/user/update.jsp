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
					<form id="updateForm" action="${pageContext.request.contextPath}/user?method=updateForm" method="post">
						<input type="hidden" name="id" class="form-control inputIdU" id=""/>
						 <input type="hidden" name="currentPage" value="${page.currentPage}">
						 <input type="hidden" name="pageNum" value="${page.pageNum}">
						<div class="form-group">
							<label>用户名称</label>
							<span style="color: red;" class="errorName"></span>
							<input class="form-control inputNameU" name="userName" id=""/>
						</div>
						<div class="form-group">
							<label>密码</label>
							<span style="color: red;" class="errorPassword"></span>
							<input class="form-control inputPasswordU" name="password" id=""/>
						</div>
						<div class="form-group">
							<label>电话号码</label>
							<span style="color: red;" class="errorPhone"></span>
							<input class="form-control inputPhoneU" name="phone" id=""/>
						</div>
						<div class="form-group">
							<label>Email</label>
							<span style="color: red;" class="errorEmail"></span>
							<input class="form-control inputEmailU" name="email" id=""/>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">修改角色</label>
							<span style="color: red; margin-left: 56px;" class="errorRole"></span>
							<ul class="roles">
							</ul>
						</div>
						<button type="button" class="btn updateForm btn-warning">修改</button>
					</form>
				</div>
			</div>
		</div>
</div>