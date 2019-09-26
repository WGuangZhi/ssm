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
						<input type="hidden" name="currentPage" value="${pageInfo.startRow}">
						<input type="hidden" name="pageNum" value="${pageInfo.pageSize}">
						<input type="hidden" name="id" class="form-control inputId" id=""/>
						<div class="form-group">
							<label>权限名称</label>
							<span class="errorName"></span>
							<input type="text" name="name" class="form-control inputName" id=""/>
						</div>
						<div class="form-group">
							<label>权限图标</label>
							<span class="errorDescription"></span>
							<input type="text" name="icon" class="form-control inputIcon" id=""/>
						</div>
						<div class="form-group">
							<label>权限类型</label>
							<input type="text" name="type" class="form-control inputType" id=""/>
						</div>
						<div class="form-group">
							<label>排序序号</label>
							<input type="text" name="sort" class="form-control inputSort" id=""/>
						</div>
						<div class="form-group">
							<label>路径</label>
							<input type="text" name="url" class="form-control inputUrl" id=""/>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">选择父级ID</label>
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