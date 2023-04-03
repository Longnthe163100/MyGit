<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
            />
        <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
            />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <title>Tạo hoá đơn mới</title>
    </head>
    <body>
        <form action="createbill" method="POST">
            <div class="form-group">
                <div class="mb-3">
                    <label for="manager-id" class="form-label">Chủ hộ: </label>
                    <input
                        type="text"
                        class="form-control"
                        id="manager-id"
                        name="account-id"
                        value="${sessionScope.account.getAccount_id()}"
                        readonly
                        />
                </div>
                <div class="mb-3">
                    <label for="tenant" class="form-label">Người thuê: </label>
                    <select class="form-control" id="tenant" name="tenant">
                        <c:forEach items="${sessionScope.tenantList}" var="tenant">
                            <option>${tenant}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="title" class="form-label">Tiêu đề: </label>
                    <input
                        type="text"
                        class="form-control"
                        id="title"
                        name="title"
                        placeholder="Không bắt buộc"
                        />
                </div>
                <div class="mb-3">
                    <label for="due-date" class="form-label">Hạn nộp: </label>
                    <input
                        type="datetime-local"
                        class="form-control"
                        id="due-date"
                        name="due-date"
                        required
                        />
                </div>
                <div class="mb-3">
                    <label for="rent-money" class="form-label">Tiền thuê: </label>
                    <input
                        type="number"
                        class="form-control"
                        id="rent-money"
                        name="rent-money"
                        oninput="totalMoney()"
                        />
                </div>
                <div class="mb-3">
                    <label for="electric-money" class="form-label">Tiền điện: </label>
                    <input
                        type="number"
                        class="form-control"
                        id="electric-money"
                        name="electric-money"
                        oninput="totalMoney()"
                        />
                </div>
                <div class="mb-3">
                    <label for="water-money" class="form-label">Tiền nước: </label>
                    <input
                        type="number"
                        class="form-control"
                        id="water-money"
                        name="water-money"
                        oninput="totalMoney()"
                        />
                </div>
                <div class="mb-3">
                    <label for="extra-money" class="form-label">Phụ phí: </label>
                    <input
                        type="number"
                        class="form-control"
                        id="extra-money"
                        name="extra-money"
                        oninput="totalMoney()"
                        />
                </div>
                <div class="mb-3">
                    <label for="total-money" class="form-label">Tổng tiền: </label>
                    <input
                        type="number"
                        class="form-control"
                        id="total-money"
                        name="total-money"
                        />
                </div>
                <div class="mb-3">
                    <button type="submit" class="btn btn-primary">
                        Lưu
                    </button>
                </div>
            </div>
        </form>
        <script type="text/javascript">
            function totalMoney() {
                var rentMoney = document.getElementById("rent-money").value;
                var rentMoney = parseInt(rentMoney, 10);
                var electricMoney = document.getElementById("electric-money").value;
                var electricMoney = parseInt(electricMoney, 10);
                var waterMoney = document.getElementById("water-money").value;
                var waterMoney = parseInt(waterMoney, 10);
                var extraMoney = document.getElementById("extraMoney").value;
                var extraMoney = parseInt(extraMoney, 10);
                var total = rentMoney + electricMoney + waterMoney + extraMoney;
                document.getElementById("total-money").value = total;
            }
        </script>
    </body>

</html>
