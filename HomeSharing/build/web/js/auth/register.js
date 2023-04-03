function checkform() {
    var username = document.getElementById('username').value;
    var password = document.getElementById("password").value;
    var repassword = document.getElementById("repassword").value;
    var phone = document.getElementById('phone').value;
    var registersuccess = sessionStorage.getItem("registersuccess");
    const patternUsername = /^[a-zA-Z][a-zA-Z0-9_@!;#$%^&*()\-+=~`|\\{}[\]:<>,.?\/]{1,}$/;
    var isValid = true;

    //Check username have first character is alphabet
    if (patternUsername.test(username) !== true) {
        document.getElementById("checkusername").innerHTML = "Ký tự đầu tiên là chữ cái";
        isValid = false;
    } else {
        document.getElementById("checkusername").innerHTML = "";
    }

    //Check password and repassword same
    if (password !== repassword) {
        document.getElementById("checkpassword").innerHTML = "Mật khẩu và nhập lại mật khẩu phải giống nhau";
        isValid = false;
    } else {
        document.getElementById("checkpassword").innerHTML = "";
    }

    //Check phone number
    const patternPhone = /[^0-9]/;
    if (phone.length !== 10 || patternPhone.test(phone) === true) {
        document.getElementById('checkphone').innerHTML = "Số điện thoại cần có 10 chữ số, không có ký tự nào khác";
        isValid = false;
    } else {
        document.getElementById('checkphone').innerHTML = "";
    }
    return isValid;

}
