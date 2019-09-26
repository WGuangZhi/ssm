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
							class="col-sm-2 control-label">角色名称</label>
						<div class="col-sm-7">
							<input type="text" class="form-control inputName" name="name"
								placeholder="请输入角色名称">
						</div>
						<span style="color: red;" class="col-sm-3 errorName"></span>
					</div>
					<div class="form-group">
						<label for="userName" style="text-align: right;"
							class="col-sm-2 control-label">角色描述</label>
						<div class="col-sm-7">
							<input type="text" class="form-control inputDescription" name="description"
								placeholder="请输入角色描述">
						</div>
						<span style="color: red;" class="col-sm-3 errorName"></span>
					</div>
					<div class="form-group">
						<label for="role" style="text-align: right;"
							class="col-sm-2 col-xs-2 control-label">分配权限</label>
						<div class=" col-sm-10">
							<div class="checkbox">
								<label class="pers"> </label>
							</div>
						</div>
						<span style="color: red; margin-left: 56px;" class="errorRole"></span>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							style="float: left;">关闭</button>
						<button type="button" class="btn addFrom btn-primary">添加</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>