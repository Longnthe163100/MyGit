<!-- Modal -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>-->
<div class="modal fade" id="editUserModal" tabindex="-1" aria-labelledby="editUserModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editUserModalLabel">Chỉnh sửa thông tin người dùng</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- Form chỉnh sửa thông tin người dùng -->
                <form>
                    <div class="form-group">
                        <label for="fullname">Họ và tên:</label>
                        <input type="text" class="form-control" id="fullname" name="fullname">
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
                        <label for="dob">Ngày sinh:</label>
                        <input type="tel" class="form-control" id="dob" name="dob">
                    </div>
                    <div class="form-group">
                        <label for="identity_card_number">CCCD/CMND:</label>
                        <input type="tel" class="form-control" id="identity_card_number" name="identity_card_number">
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
        var fullname = button.data('fullname');
        var email = button.data('email');
        var phone = button.data('phone');
        var address = button.data('address');
        var dob = button.data('dob');
        var identity_card_number = button.data('identity_card_number');

        var modal = $(this);
        modal.find('#fullname').val(fullname);
        modal.find('#email').val(email);
        modal.find('#phone').val(phone);
        modal.find('#address').val(address);
        modal.find('#dob').val(dob);
        modal.find('#identity_card_number').val(identity_card_number);
    });


    function saveUser() {
        var fullname = $('#fullname').val();
        var email = $('#email').val();
        var phone = $('#phone').val();
        var address = $('#address').val();
        var dob = $('#dob').val();
        var identity_card_number = $('#identity_card_number').val();
        var currentUrl = window.location.href;
        // Make an Ajax request to the server to update the user's information
        $.ajax({
            type: "POST",
            url: "admineditprofile",
            data: {
                fullname: fullname,
                email: email,
                phone: phone,
                address: address,
                dob: dob,
                identity_card_number: identity_card_number
            },
            success: function (response) {
                // Update the accountViews session with the updated account information
                $.ajax({
                    type: "POST",
                    url: "adminviewprofile",
                    success: function (response) {
                        var accountViewProfile = response;
                        if (accountViewProfile) {
                            // Set the updated accountViews to sessionStorage
                            sessionStorage.setItem('accountViewProfile', JSON.stringify(accountViewProfile));
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