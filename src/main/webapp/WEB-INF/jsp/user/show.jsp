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
						<label>ID</label>
						<div class="form-control showId" id=""></div>
					</div>
					<div class="form-group">
						<label>用户名称</label>
						<div class="form-control showName" id=""></div>
					</div>
					<div class="form-group">
						<label>当前角色列表</label>
						<div class="form-control showMenu" id=""></div>
					</div>
					<div class="form-group">
						<label>电话号码</label>
						<div class="form-control showPhone" id=""></div>
					</div>
					<div class="form-group">
						<label>Email</label>
						<div class="form-control showEmail" id=""></div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>