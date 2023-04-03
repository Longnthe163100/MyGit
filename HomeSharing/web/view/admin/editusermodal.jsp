<!-- Modal -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>-->

<div class="modal fade" id="editUserModal" tabindex="-1" aria-labelledby="editUserModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editUserModalLabel" style="color: black">Chỉnh sửa thông tin người dùng</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- Form chỉnh sửa thông tin người dùng -->
                <form>
                    <div class="form-group">
                        <label for="account_id">ID:</label>
                        <input type="text" class="form-control" id="account_id" name="account_id" readonly>
                    </div>
                    <div class="form-group">
                        <label for="username">Tên đăng nhập:</label>
                        <input type="text" class="form-control" id="username" name="username">
                    </div>
                    <div class="form-group">
                        <label for="password">Mật khẩu:</label>
                        <input type="password" class="form-control" id="password" name="password">
                    </div>
                    <div class="form-group">
                        <label for="fullname">Họ và tên:</label>
                        <input type="text" class="form-control" id="fullname" name="fullname">
                    </div>
                    <div class="form-group">
                        <label for="role">Vai trò:</label>
                        <select class="form-control" id="role" name="role">
                            <c:if test="${accountview.role == 1}">
                                <option value="1">Admin</option>
                            </c:if>
                            <option value="2">Manager</option>
                            <option value="3">Tenant</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" class="form-control" id="email" name="email">
                    </div>
                    <div class="form-group">
                        <label for="phone">Số điện thoại:</label>
                        <input type="tel" class="form-control" id="phone" name="phone">
                    </div>
                    <div class="form-group">
                        <label for="address">Địa chỉ:</label>
                        <input type="text" class="form-control" id="address" name="address">
                    </div>
                    <div class="form-group">
                        <label for="status">Trạng thái:</label>
                        <select class="form-control" id="status" name="status">
                            <option value="1">Hoạt động</option>
                            <option value="0">Không hoạt động</option>
                        </select>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                <button type="button" class="btn btn-primary" onclick="saveUser()">Lưu</button>
            </div>
        </div>
    </div>
</div>

<script>
    $('#editUserModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget);
        var accountId = button.data('account_id');
        var username = button.data('username');
        var password = button.data('password');
        var fullname = button.data('fullname');
        var role = button.data('role');
        var email = button.data('email');
        var phone = button.data('phone');
        var address = button.data('address');
        var status = button.data('status');

        var modal = $(this);
        modal.find('#account_id').val(accountId);
        modal.find('#username').val(username);
        modal.find('#password').val(password);
        modal.find('#fullname').val(fullname);
        modal.find('#role').val(role);
        modal.find('#email').val(email);
        modal.find('#phone').val(phone);
        modal.find('#address').val(address);
        modal.find('#status').val(status);
    });


    function saveUser() {
        var accountId = $('#account_id').val();
        var username = $('#username').val();
        var password = $('#password').val();
        var fullname = $('#fullname').val();
        var role = $('#role').val();
        var email = $('#email').val();
        var phone = $('#phone').val();
        var address = $('#address').val();
        var status = $('#status').val();
        var currentUrl = window.location.href;
        // Make an Ajax request to the server to update the user's information
        $.ajax({
            type: "POST",
            url: "updateuser",
            data: {
                account_id: accountId,
                username: username,
                password: password,
                fullname: fullname,
                role: role,
                email: email,
                phone: phone,
                address: address,
                status: status
            },
            success: function (response) {
            // Update the accountViews session with the updated account information
                $.ajax({
                    type: "POST",
                    url: "homeadmin",
                    success: function (response) {
                        var accountViews = response;
                        if (accountViews) {
            // Set the updated accountViews to sessionStorage
                            sessionStorage.setItem('accountViews', JSON.stringify(accountViews));
            // Reload the current page to display the updated account information
                            location.reload();
                        }
                    }
                });
            // Close the modal dialog
                $('#editUserModal').modal('hide');
            },
            error: function (xhr, status, error) {
                console.error(xhr.responseText);
            }
        });
    }
</script>