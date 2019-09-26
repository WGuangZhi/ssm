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
					<input type="hidden" name="currentPage" value="${pageInfo.pageNum}">
					<input type="hidden" name="pageNum" value="${pageInfo.pageSize}">
					<div class="form-group">
						<label for="userName" style="text-align: right;" class="col-sm-2 control-label">权限名称</label>
						<div class="col-sm-7">
							<input type="text" class="form-control inputName" name="name" placeholder="请输入权限名称">
						</div>
						<span style="color: red;" class="col-sm-3 errorName"></span>
					</div>
					<div class="form-group">
						<label for="userName" style="text-align: right;" class="col-sm-2 control-label">权限图标</label>
						<div class="col-sm-7">
							<input type="text" class="form-control inputIcon" name="icon" placeholder="请输入权限图标">
						</div>
						<span style="color: red;" class="col-sm-3 errorIcon"></span>
					</div>
					<div class="form-group">
						<label for="userName" style="text-align: right;" class="col-sm-2 control-label">权限类型</label>
						<div class="col-sm-7">
							<input type="text" class="form-control inputType" name="type" placeholder="请输入权限类型">
						</div>
						<span style="color: red;" class="col-sm-3 errorType"></span>
					</div>
					<div class="form-group">
						<label for="userName" style="text-align: right;" class="col-sm-2 control-label">排序序号</label>
						<div class="col-sm-7">
							<input type="text" class="form-control inputSort" name="sort" placeholder="请输入权限排序序号">
						</div>
						<span style="color: red;" class="col-sm-3 errorSort"></span>
					</div>
					<div class="form-group">
						<label for="userName" style="text-align: right;" class="col-sm-2 control-label">路径</label>
						<div class="col-sm-7">
							<input type="text" class="form-control inputUrl" name="url" placeholder="请输入权限路径">
						</div>
						<span style="color: red;" class="col-sm-3 errorUrl"></span>
					</div>
					<div class="form-group">
						<label for="role" style="text-align: right;" class="col-sm-2 col-xs-2 control-label">选择父级</label>
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