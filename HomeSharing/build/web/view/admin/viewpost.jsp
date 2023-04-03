<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>HOME SHARING</title>

        <link rel="icon" type="image/x-icon" href="http://localhost:9999/HomeSharing/assets/img/icon/favicon.ico" />
        <!--<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            .search-column {
                position: sticky;
                top: 0;
            }
            .col-lg-4 {
                display: block !important;
            }
        </style>
        <!-- Đường dẫn tới các file JavaScript -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
    <body>
        <%@ include file="header.jsp" %>

        <!-- Page header with logo and tagline-->
        <header class="py-5 bg-light border-bottom mb-4">
            <div class="container">
                <div class="text-center my-5">
                    <h1 class="fw-bolder">CHÀO MỪNG BẠN ĐẾN VỚI BLOG HOME SHARING !</h1>
                    <p class="lead mb-0">Blog Home Sharing kết nối muôn nơi</p>
                </div>
            </div>
        </header>
        <!-- Page content-->
        <div class="container">
            <div class="row">
                <!-- Blog entries-->
                <div class="col-lg-8">
                    <div class="row" id="blog-entries">
                        <c:forEach items="${PostData}" var="x">
                            <div class="col-lg-6">
                                <div class="card mb-4">
                                    <a href="#!"><img class="card-img-top" src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..." /></a>
                                    <div class="card-body">                  
                                        <div class="small text-muted">${x.create_date}</div>
                                        <p class="card-text" style="color: ${x.status == 1 ? "blue": "red" }">${x.status == 1 ? "Hiển thị" : "Không hiển thị"}</p>
                                        <h2 class="card-title h4">${x.post_title}</h2>
                                        <p class="card-text">${x.post_text}</p>
                                        <a class="btn btn-primary" href="adminviewpostdetail?post_id=${x.post_id}">Chi tiết →</a>
                                    </div>
                                </div>  
                            </div>
                        </c:forEach>                        
                    </div>
                </div>
                <!-- Side widgets-->
                <div class="col-lg-4 search-column">
                    <!-- Search widget-->
                    <div class="card mb-4">
                        <div class="card-header">Tìm kiếm</div>
                        <div class="card-body">
                            <input id="search-input" class="form-control" type="text" placeholder="Tìm kiếm bài viết" aria-label="Enter search post..." aria-describedby="button-search" />
                            <button id="search-button" class="btn btn-primary" type="button">Tìm kiếm</button>
                        </div>
                    </div>
                    <c:if test="${account != null}">
                        <div class="card mb-4">
                            <div class="container">
                                <div class="row">
                                    <div class="form-group">
                                        <form action="admincreatepost" method="get">
                                            <!-- Thêm các input field và các nút cần thiết cho form -->
                                            <button type="submit" class="btn btn-primary">Tạo bài đăng</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
        <!-- Pagination-->
        <nav aria-label="Pagination">
            <hr class="my-0" />
            <ul class="pagination justify-content-center my-4">
                <li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">Trước</a></li>
                    <c:forEach begin="1" end="${num}" var= "i"> 
                    <li class="page-item"><a class="page-link" href="adminviewpost?page=${i}">${i}</a></li>
                    </c:forEach>
                <li class="page-item"><a class="page-link" href="#!">Sau</a></li>
            </ul>
        </nav>
    </div>

    <script>
        $(document).ready(function () {
            var dem = 0;
            // Đăng ký sự kiện click cho nút Tìm kiếm
            $('#search-button').click(function () {
                // Lấy giá trị nhập vào ô Tìm kiếm
                var searchText = $('#search-input').val().toLowerCase();

                // Lặp qua từng div chứa thông tin bài viết
                $('.card-body').each(function () {
                    // Lấy tiêu đề và nội dung của bài viết
                    var title = $(this).find('.card-title').text().toLowerCase();
                    var text = $(this).find('.card-text').text().toLowerCase();

                    // Nếu tiêu đề hoặc nội dung không chứa từ khóa tìm kiếm thì ẩn bài viết đó
                    if (!(title.includes(searchText) || text.includes(searchText))) {
                        $(this).parent().parent().hide();
                    }

                    // Ngược lại, hiển thị bài viết đó
                    else {
                        $(this).parent().parent().show();
                        dem++;
                    }
                });
                if (dem <= 3) {
                    document.querySelector("nav.pagination").style.display = "none";
                }
            });
        });
    </script>
</body>
</html>