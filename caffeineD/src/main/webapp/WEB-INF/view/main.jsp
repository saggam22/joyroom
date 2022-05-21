<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main.jsp</title>
</head>
<body>

	<section class="page-section clearfix">
            <div class="container">
                <div class="intro">
                    <img class="intro-img img-fluid mb-3 mb-lg-0 rounded" src="img/cafeimg/${adCafeFirst.img }" alt="${adCafeFirst.name }" />
                    <div class="intro-text left-0 text-center bg-faded p-5 rounded">
                        <h2 class="section-heading mb-4">
                            <span class="section-heading-upper">who we are</span>
                            <span class="section-heading-lower">${adCafeFirst.name }</span>
                        </h2>
                        <p class="mb-3">${adCafeFirst.info }</p>
                        <div class="intro-button mx-auto"><a class="btn btn-primary btn-xl" href="${pageContext.servletContext.contextPath }/cafeInfoSelect.do?no=${adCafeFirst.no }">Detail View</a></div>
                    </div>
                </div>
            </div>
        </section>
        <section class="page-section clearfix">
            <div class="container">
                <div class="intro2">
                    <img class="intro-img img-fluid mb-3 mb-lg-0 rounded" src="img/cafeimg/${adCafeSecond.img }" alt="${adCafeSecond.name }" />
                    <div class="intro-text left-0 text-center bg-faded p-5 rounded">
                        <h2 class="section-heading mb-4">
                            <span class="section-heading-upper">who we are</span>
                            <span class="section-heading-lower">${adCafeSecond.name }</span>
                        </h2>
                        <p class="mb-3">${adCafeSecond.info }</p>
                        <div class="intro-button mx-auto"><a class="btn btn-primary btn-xl" href="${pageContext.servletContext.contextPath }/cafeInfoSelect.do?no=${adCafeSecond.no }">Detail View</a></div>
                    </div>
                </div>
            </div>
        </section>
        <section class="page-section cta">
            <div class="container">
                <div class="row">
                    <div class="col-xl-9 mx-auto">
                        <div class="cta-inner bg-faded text-center rounded" style="background:white;">
                            <h2 class="section-heading mb-4">
                                <span class="section-heading-upper">ABOUT</span>
                                <span class="section-heading-lower">caffeine D</span>
                            </h2>
                            <p class="mb-0">밖으로 나서는 길이 설렘으로 가득하고 <br>
                            즐거운 이야기와 추억을 만들고 쌓아 가는 공간, <br>
                             마음까지 편안한 온전한 휴식, <br>
                            카페인디를 만나면 당신의 일상이 됩니다. <br>
                       
                        </div>
                    </div>
                </div>
            </div>
        </section>
</body>
</html>
