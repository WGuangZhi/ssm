<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal fade" id="show">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">用户信息</h4>
			</div>
			<div class="modal-body">
				<form>
					<div class="form-group">
						<label>权限名称</label> <span class="errorName"></span> 
						<div type="text" name="name" class="form-control inputName" id="" ></div>
					</div>
					<div class="form-group">
						<label>权限图标</label> <span class="errorDescription"></span> 
						<div type="text" name="icon" class="form-control inputIcon" id="" ></div>
					</div>
					<div class="form-group">
						<label>权限类型</label> 
						<div type="text" name="type" class="form-control inputType" id="" ></div>
					</div>
					<div class="form-group">
						<label>排序序号</label> 
						<div type="text" name="sort" class="form-control inputSort" id="" ></div>
					</div>
					<div class="form-group">
						<label>路径</label> 
						<div type="text" name="url" class="form-control inputUrl" id="" ></div>
					</div>
					<div class="form-group">
						<label>父级ID</label> 
						<div type="text" name="parentId" class="form-control inputParent" id="" ></div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>