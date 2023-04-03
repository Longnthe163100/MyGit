/* global session */

//sessionStorage.setItem("verifycode", "<%= session.getAttribute("verifycode") %>");
//        var verifyCode = sessionStorage.getItem("verifycode");
//if (verifyCode === "codefail") {
//    document.getElementById("message").style.display = "block";
//    document.getElementById("message").innerHTML = "Email không chính xác, vui lòng nhập lại";
//} else {
//    document.getElementById("message").style.display = "none";
//}

// Lấy đối tượng phần tử HTML có id="message"
sessionStorage.setItem("verifycode", "<%= session.getAttribute(\"verifycode\") %>");
var messageDiv = document.getElementById("message");

// Lấy giá trị của session "verifycode" từ sessionStorage
var verifyCode = sessionStorage.getItem("verifycode");

// Kiểm tra giá trị của session
if (verifyCode === "codefail") {
    // Nếu giá trị là "codefail", hiển thị phần tử có id="message"
    document.getElementById("message").style.display = "block";
} else {
    // Ngược lại, ẩn phần tử này đi
    document.getElementById("message").style.display = "none";
}
