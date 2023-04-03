function checkform() {
    var password = document.getElementById('newpassword').value;
    var repassword = document.getElementById("renewpassword").value;
    var isValid = true;
    if (password !== repassword) {
        document.getElementById("checkpassword").innerHTML = "Mật khẩu mới và nhập lại mật khẩu mới chưa trùng khớp nhau. Vui lòng nhập lại";
        isValid = false;
    } else {
        return isValid;
    }
    return isValid;
}
