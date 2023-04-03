<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="a" class="dao.PostDBContext" scope="request"></jsp:useBean>
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
        <link href="http://localhost:9999/HomeSharing/css/post/styles.css" rel="stylesheet" type="text/css"/>
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
                    <!-- Featured blog post-->
                    <div class="card mb-4">
                        <a href="#!"><img class="card-img-top" src="https://dummyimage.com/850x350/dee2e6/6c757d.jpg" alt="..." /></a>
                        <div class="card-body">
                            <div class="small text-muted">January 1, 2022</div>
                            <h2 class="card-title">Featured Post Title</h2>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque, nulla? Quos cum ex quis soluta, a laboriosam. Dicta expedita corporis animi vero voluptate voluptatibus possimus, veniam magni quis!</p>
                            <a class="btn btn-primary" href="#!">Read more →</a>
                        </div>
                    </div>
                    <div class="row">
                        <c:forEach items="${requestScope.lists}" var="x">
                            <div class="col-lg-6">
                                <div class="card mb-4">
                                    <a href="#!"><img class="card-img-top" src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..." /></a>
                                    <div class="card-body">                                   
                                        <div class="small text-muted">${x.create_date}</div>
                                        <h2 class="card-title h4">${x.post_title}</h2>
                                        <p class="card-text">${x.post_text}</p>
                                        <a class="btn btn-primary" href="#!">Read more →</a>
                                    </div>
                                </div>  
                            </div>
                        </c:forEach>                        
                    </div>
                </div>
                <!-- Side widgets-->
                <div class="col-lg-4">
                    <!-- Search widget-->
                    <div class="card mb-4">
                        <div class="card-header">Tìm kiếm</div>
                        <div class="card-body">
                            <div class="input-group">
                                <input class="form-control" type="text" placeholder="Enter search post..." aria-label="Enter search post..." aria-describedby="button-search" />
                                <button class="btn btn-primary" id="button-search" type="button">Go!</button>
                            </div>
                        </div>
                    </div>
                    <div class="card mb-4">
                        <div class="container">
                            <div class="row">
                                <div class="form-group">
                                    <button  type="submit" class="btn btn-primary"/>
                                    <a href="createpost">  Tạo bài đăng</a>
                                    </button> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Pagination-->
        <!--        <nav aria-label="Pagination">
                    <hr class="my-0" />
                    <ul class="pagination justify-content-center my-4">
                        <li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">Newer</a></li>
                        <c:forEach begin="1" end="${a.nuberPage}" var= "i"> 
                            <li class="page-item"><a class="page-link" href="paging?index=${i}">${i}</a></li>
                            </c:forEach>
                        <li class="page-item"><a class="page-link" href="#!">Older</a></li>
                    </ul>
                </nav>-->
        <nav aria-label="Pagination">
            <hr class="my-0" />
            <ul class="pagination justify-content-center my-4">
                <li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">Newer</a></li>
                <li class="page-item"><a class="page-link" href="">2</a></li>
                <li class="page-item"><a class="page-link" href="">2</a></li>
                <li class="page-item"><a class="page-link" href="#!">Older</a></li>
            </ul>
        </nav>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; HOMESHARING</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
