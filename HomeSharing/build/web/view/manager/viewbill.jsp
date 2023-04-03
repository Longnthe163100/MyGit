<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
            />
        <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
            integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
            crossorigin="anonymous"
            />
        <script
            src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"
        ></script>
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"
        ></script>
        <script
            src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
            integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
            crossorigin="anonymous"
        ></script>
        <link href="http://localhost:9999/HomeSharing/css/bill/viewbill.css" rel="stylesheet" type="text/css" />
        <title>Xem danh sách hoá đơn</title>
    </head>
    <body>
        <form action="viewbill" method="GET">
            <table class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Hoá đơn tháng</th>
                    </tr>
                </thead>
                <tbody>
                    <c:if test="${sessionScope.billList ne null}">
                        <c:forEach items="${sessionScope.billList}" var="bill">
                            <tr>
                                <td>${bill.billID}</td>
                                <td>${bill.serviceDate}</td>
                                <td>
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#viewBillModal"
                                            data-billID ="${bill.billID}"
                                            data-serviceDate="${bill.serviceDate}"
                                            data-tenantID="${bill.tenantID}"
                                            data-managerID="${bill.managerID}"
                                            data-roomNumber="${bill.roomNumber}"
                                            data-houseID="${bill.houseID}"
                                            data-rentMoney="${bill.rentMoney}"
                                            data-electricMoney="${bill.electricMoney}"
                                            data-waterMoney="${bill.waterMoney}"
                                            data-extraMoney="${bill.extraMoney}"
                                            data-totalMoney="${bill.totalMoney}"
                                            data-title="${bill.title}"
                                            data-createdDate="${bill.createdDate}"
                                            data-status="${bill.status}"
                                            >
                                        Xem
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:if>
                </tbody>
            </table>
        </form> 
        <%@include file="viewbillmodal.jspf" %>
    </body>

</html>

