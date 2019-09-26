<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal fade" id="add">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">新增用户信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="addForm">
					<input type="hidden" class="currentPage" name="currentPage"
						value="${page.currentPage}"> <input type="hidden"
						name="pageNum" value="${page.pageNum}">
					<div class="form-group">
						<label for="userName" style="text-align: right;"
							class="col-sm-2 control-label">用户名</label>
						<div class="col-sm-7">
							<input type="text" class="form-control inputName" name="userName"
								placeholder="请输入用户名">
						</div>
						<span style="color: red;" class="col-sm-3 errorName"></span>
					</div>
					<div class="form-group">
						<label for="inputPassword3" style="text-align: right;"
							class="col-sm-2 control-label">密码</label>
						<div class="col-sm-7">
							<input type="password" class="form-control inputPassword"
								name="password" placeholder="请输入密码">
						</div>
						<span style="color: red;" class="col-sm-3 errorPassword"></span>
					</div>
					<div class="form-group">
						<label for="phone" class="col-sm-2 col-xs-2 control-label">电话号码</label>
						<div class="col-sm-7">
							<input type="email" class="form-control inputPhone" name="phone"
								placeholder="请输电话号码">
						</div>
						<span style="color: red;" class="col-sm-3 errorPhone"></span>
					</div>
					<div class="form-group">
						<label for="Email" class="col-sm-2 col-xs-2 control-label">Email</label>
						<div class="col-sm-7">
							<input type="email" class="form-control inputEmail" name="email"
								placeholder="请输入邮箱">
						</div>
						<span style="color: red;" class="col-sm-3 errorEmail"></span>
					</div>
					<div class="form-group">
						<label for="role" style="text-align: right;"
							class="col-sm-2 col-xs-2 control-label">角色</label>
						<div class=" col-sm-10">
							<div class="checkbox">
								<label class="roles"> </label>
							</div>
						</div>
						<span style="color: red; margin-left: 56px;" class="errorRole"></span>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							style="float: left;">关闭</button>
						<button type="button" class="btn addSubmit btn-primary">添加</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>