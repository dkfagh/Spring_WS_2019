<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<%@include file="/WEB-INF/views/includes/header.jsp" %>

<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
    <div class="container">
        <nav class="navbar navbar-expand-lg fixed-top sticky-top">
            <!-- Brand -->
            <a class="navbar-brand" href="#myPage"><img src="resources/img/logo_cap.png" alt="logo"></a>
            
            <!-- Toggler/collapsibe Button -->
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            
            <!-- Navbar links -->
            <div class="collapse navbar-collapse" id="collapsibleNavbar">
                <ul class="nav navbar-nav ml-auto">
                <li class="nav-item"  data-toggle="collapse" data-target=".navbar-collapse">
                    <a class="nav-link" href="#box1">전체모델</a>
                </li>
                <li class="nav-item"  data-toggle="collapse" data-target=".navbar-collapse">
                    <a class="nav-link" href="#box2">전시장</a>
                </li>
                <li class="nav-item"  data-toggle="collapse" data-target=".navbar-collapse">
                    <a class="nav-link" href="#board">개인정보취급방침</a>
                </li>
                </ul>
            </div>
        </nav>
    </div>
    <!---------------------- Carousel --------------------------->
    <div class="container">
        <div class="row">
            <div id="demo" class="carousel slide" data-ride="carousel">

                <!-- Indicators -->
                <ul class="carousel-indicators">
                <li data-target="#demo" data-slide-to="0" class="active"></li>
                <li data-target="#demo" data-slide-to="1"></li>
                <li data-target="#demo" data-slide-to="2"></li>
                <li data-target="#demo" data-slide-to="3"></li>
                <li data-target="#demo" data-slide-to="4"></li>
                </ul>
            
                <!-- The slideshow -->
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <a href="https://www.lincoln-korea.com/vehicles/aviator/" target="_blank"><img class="s-img-1" src="resources/img/img01.png" alt="aviator"></a>
                        <a href="https://www.lincoln-korea.com/vehicles/aviator/" target="_blank"><img class="s-img-2" src="resources/img/mimg01.png" alt="aviator"></a>
                    </div>
                    <div class="carousel-item">
                        <img class="s-img-1" src="resources/img/nb_img02.png" alt="nautilus" usemap="#nautilus">
                        <!-- <map name="nautilus">
                            <area target="_blank" alt="링컨 NAUTILUS" title="링컨 NAUTILUS" href="https://www.lincoln-korea.com/vehicles/nautilus/" coords="619,251,821,295" shape="rect">
                        </map> -->
                        <img class="s-img-2" src="resources/img/nb_mimg02.png" alt="nautilus">
                        <div class="carousel-caption" id="caption2">
                            <a href="https://www.lincoln-korea.com/vehicles/nautilus/" target="_blank" class="btn btn-outline-light">자세히 보기 ></a>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="s-img-1" src="resources/img/nb_img03.png" alt="mkc" usemap="#mkc">
                        <img class="s-img-2" src="resources/img/nb_mimg03.png" alt="mkc">
                        <div class="carousel-caption" id="caption3">
                            <h1>NEW LINCOLN MKC</h1>
                            <h6>URBAN SUV, 시선을 사로잡다!</h6>
                            <a href="https://www.lincoln-korea.com/vehicles/mkc.html/" target="_blank" class="btn btn-outline-light">자세히 보기 ></a>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="s-img-1" src="resources/img/nb_img04.png" alt="continental">
                        <img class="s-img-2" src="resources/img/nb_mimg04.png" alt="continental">
                        <div class="carousel-caption" id="caption4">
                            <a href="https://www.lincoln-korea.com/vehicles/continental/" target="_blank" class="btn btn-outline-light">자세히 보기 ></a>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="s-img-1" src="resources/img/nb_img05.png" alt="mkz">
                        <img class="s-img-2" src="resources/img/nb_mimg05.png" alt="mkz">
                        <div class="carousel-caption" id="caption5" style="color:black;">
                            <h1>LINCOLN MKZ</h1>
                            <h6>압도적인 첫인상, 당신처럼</h6>
                            <a href="https://www.lincoln-korea.com/vehicles/mkz/" target="_blank" class="btn btn-outline-dark">자세히 보기 ></a>
                        </div>
                    </div>
                </div>
            
                <!-- Left and right controls -->
                <a class="carousel-control-prev" href="#demo" data-slide="prev">
                <span class="carousel-control-prev-icon"></span>
                </a>
                <a class="carousel-control-next" href="#demo" data-slide="next">
                <span class="carousel-control-next-icon"></span>
                </a>
            
            </div>
        </div>
    </div>
    <!------- Carousel END ---------->

    <!-- 박스 -->
    <div class="container">
        <div class="row" id="box1">
            <div class="col-md-6 col-12" id="box-left">
                <img class="s-img-1" src="resources/img/img06.png" alt="전체모델이미지" width="100%">
                <img class="s-img-2" src="resources/img/mimg06.png" alt="전체모델이미지" width="100%">
                <div class="caption">
                    <h4>See All Lincoln</h4>
                    <p>당신만을 위한 링컨의 모델을 확인해보세요</p>
                    <a href="#" class="btn btn-outline-light text-white">전체 모델 보기 ></a> 
                </div> 
            </div>
            <div class="col-md-6 col-12">
                <div class="row" id="box-right">
                    <div class="col-md-6 col-12" id="box-right1">
                        <img class="s-img-1" src="resources/img/img07.png" alt="인텔리전트" width="100%">
                        <img class="s-img-2" src="resources/img/mimg07.png" alt="인텔리전트" width="100%">
                        <div class="caption">
                            <h4>Technology</h4>
                            <p>링컨 인텔리전트 AWD</p>
                            <a href="#" class="btn btn-outline-light text-white">자세히 보기 ></a>
                        </div>
                    </div>
                    <div class="col-md-6 col-12" id="box-right2">
                        <img class="s-img-1" src="resources/img/img08.png" alt="프리미엄서비스" width="100%">
                        <img class="s-img-2" src="resources/img/mimg08.png" alt="프리미엄서비스" width="100%">
                        <div class="caption">
                            <h4>Pick up & Delivery</h4>
                            <p>직접 찾아가는 프리미엄서비스</p>
                            <a href="#" class="btn btn-outline-light text-white">자세히 보기 ></a>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 col-12" id="box-bottom">
                        <img class="s-img-1" src="resources/img/img09.png" alt="세일즈프로모션" width="100%">
                        <img class="s-img-2" src="resources/img/mimg09.png" alt="세일즈프로모션" width="100%">
                        <div class="caption">
                            <h4>Sales Promotion</h4>
                            <p>진행 중인 세일즈 프로모션</p>
                            <a href="#" class="btn btn-outline-light text-white">자세히 보기 ></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>  
    <!--박스끝 -->

    <!----------------------------- Third Row ----------------------------->
    <div class="container">
        <div class="row" id="box2">
            <div class="col-sm-4">
                <img src="resources/img/img10.png" alt="서비스센터" width="100%" class="image">
                <div class="caption">
                    <h4>전시장 및 서비스센터 찾기</h4>
                    <a href="#" class="btn btn-outline-light text-white" data-toggle="modal" data-target="#myModal">바로 가기 ></a>
                    <!-------------- The Modal --------------->
                    <div class="modal" id="myModal">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <!---- Modal Header ---->
                                <div class="modal-header">
                                <h4 class="modal-title" style="color:black;">전시장 위치</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <!---- Modal body ---->
                                <div class="modal-body">
                                    <div id="kakaomap" style="width: 100%;height: 500px;"></div>
                                    <script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=00291b6743bb5f372557da7b5c5afa29"></script>
                                        <script> 
                                            $("#myModal").on("shown.bs.modal", function (){
                                                var mapContainer = document.getElementById('kakaomap'), // 지도를 표시할 div 
                                                mapOption = { 
                                                            center: new daum.maps.LatLng(37.525015, 126.907642), // 지도의 중심좌표
                                                            level: 3 // 지도의 확대 레벨
                                                        };
                                                var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
                                                // 마커가 표시될 위치입니다 
                                                var markerPosition  = new daum.maps.LatLng(37.525015, 126.907642);
                                                // 마커를 생성합니다
                                                var marker = new daum.maps.Marker({
                                                    position: markerPosition
                                                    });
                                                // 마커가 지도 위에 표시되도록 설정합니다
                                                marker.setMap(map);
                                            });
                                        </script>
                                        <!-- 카카오맵.끝.-->
                                </div>
                                <!---- Modal footer ---->
                                <div class="modal-footer">
                                <button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--------- The Modal END --------->
                </div>
            </div>
            <div class="col-sm-4">
                <img src="resources/img/img11.png" alt="브로셔" width="100%" class="image">
                <div class="caption">
                    <h4>브로셔 보기</h4>
                    <a href="#" class="btn btn-outline-light text-white" data-toggle="modal" data-target="#myModal2">바로 가기 ></a>
                    <!-------------- The Modal --------------->
                    <div class="modal" id="myModal2">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <!---- Modal Header ---->
                                <div class="modal-header" style="padding:0;margin:0;">
                                    <img src="resources/img/modal_title.png" alt="title">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <!---- Modal body ---->
                                <div class="modal-body">
                                    <h3 style="color:black;">브로셔 보기</h3>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <a href="https://www.lincoln-korea.com/content/dam/lincoln/sk/nameplate/brochure/19MY-Continental.pdf" target="_blank">
                                            <img src="resources/img/continental.png" alt="continental"></a>
                                        </div>
                                        <div class="col-sm-3">
                                            <a href="https://www.lincoln-korea.com/content/dam/lincoln/sk/nameplate/brochure/19MY%20MKZ%20.pdf" target="_blank">
                                            <img src="resources/img/mkz.png" alt="mkz"></a>
                                        </div>
                                        <div class="col-sm-3">
                                            <a href="https://www.lincoln-korea.com/content/dam/lincoln/sk/nameplate/brochure/19MKC-Final-Brochure-2018.pdf" target="_blank">
                                            <img src="resources/img/mkc.png" alt="mkc"></a>    
                                        </div>
                                        <div class="col-sm-3">
                                            <a href="https://www.lincoln-korea.com/content/dam/lincoln/sk/nameplate/brochure/19MY-Nautilus.pdf" target="_blank">  
                                            <img src="resources/img/nautilus.png" alt="nautilus"></a>
                                        </div>
                                    </div>
                                </div>
                                <!---- Modal footer ---->
                                <div class="modal-footer">
                                    <img src="resources/img/modal_logo.png" alt="logo">
                                <!-- <button type="button" class="btn btn-dark" data-dismiss="modal">Close</button> -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--------- The Modal END --------->
                </div>
            </div>
            <div class="col-sm-4">
                <img src="resources/img/img12.png" alt="시승신청" width="100%" class="image">
                <div class="caption">
                    <h4>시승 신청</h4>
                    <a href="#" class="btn btn-outline-light text-white" data-toggle="modal" data-target="#myModal3">바로 가기 ></a>
                    <!-------------- The Modal --------------->
                    <div class="modal" id="myModal3">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <!---- Modal Header ---->
                                    <div class="modal-header" style="padding:0;margin:0;">
                                        <img src="resources/img/img12_2.png" alt="title">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>
                                    <!---- Modal body ---->
                                    <div class="modal-body">
                                        <h3 style="color:black;">시승 신청</h3>
                                        <div class="row">
                                            <form action="booking.jsp" method="post" class="form-inline" style="width:100%;color:black;font-size: 15px;">
                                                <div class="col-sm-6">
                                                    <label for="car">어떤 자동차에 관심이 있나요? ＊</label>
                                                    <select name="car" class="form-control form-group">
                                                        <option value="CONTINENTAL">링컨 CONTINENTAL</option>
                                                        <option value="MKZ">링컨 MKZ</option>
                                                        <option value="NAUTILUS">링컨 NAUTILUS</option>
                                                        <option value="MKC">링컨 MKC</option>
                                                    </select>
                                                    <br>
                                                    <label for="name">이름 ＊</label>
                                                    <input type="text" name="name" class="form-control form-group">
                                                    <br>
                                                    <label for="email">이메일 ＊</label>
                                                    <input type="email" name="email" class="form-control form-group">
                                                </div>
                                                <div class="col-sm-6">
                                                    <label for="plan">신차를 언제 구입할 계획이십니까? ＊</label>
                                                    <select name="plan" class="form-control form-group">
                                                        <option value="">선택하세요</option>
                                                        <option value="1m">0-30일</option>
                                                        <option value="3m">1-3개월</option>
                                                        <option value="6m">4-6개월</option>
                                                        <option value="a6m">6개월 이후</option>
                                                        <option value="none">정해진 계획 없음</option>
                                                    </select>
                                                    <br>
                                                    <label for="add">추가요청사항</label>
                                                    <input type="text" name="add" class="form-control form-group">
                                                    <br>
                                                    <label for="place">전시장을 선택해주세요. ＊</label>
                                                    <select name="place" class="form-control form-group">
                                                        <option value="">선택하세요</option>
                                                        <option value="kangseo">강서 전시장(선인자동차)</option>
                                                        <option value="dongdaemun">동대문 전시장(선인자동차)</option>
                                                        <option value="mapo">마포 전시장(더파크모터스)</option>
                                                        <option value="mia">미아 전시장(더파크모터스)</option>
                                                        <option value="songpa">송파 전시장(프리미어모터스)</option>
                                                        <option value="yeongdeungpo">영등포 전시장(프리미어모터스)</option>
                                                    </select>
                                                </div>
                                                <input type="submit" value="신청하기" class="btn" style="color:white;background:rgb(196, 95, 0);margin:auto;margin-top:15px;">
                                            </form>
                                        </div>
                                    </div>
                                    <!---- Modal footer ---->
                                    <div class="modal-footer">
                                    <!-- <button type="button" class="btn btn-dark" data-dismiss="modal">Close</button> -->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--------- The Modal END --------->
                </div>
            </div>
        </div>
    </div>
    <!------------ Third Row END -------------->
    <!---------------- Board ------------------>
    <div class="container" id="board">
        <h3 class="text-center">개인정보취급방침</h3>
        <iframe id="iframe1" src="http://dkfagh.dothome.co.kr/board/bbs/board.php?bo_table=board01" width="100%" onload="autoResize(this)" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>
    </div>
    <!----- Board END ----->

    <!--------------------------- DISCLOSURES --------------------------------->
    <div class="container">
        <button a href="#disclosures" class="btn btn-outline-light btn-block" data-toggle="collapse" style="padding:15px 0;margin-top:20px;color:#C55F07">DISCLOSURES</a>
        <div id="disclosures" class="collapse" style="padding-bottom:10px;">
            <p style="font-size: 13.4px;color:black;padding-top:20px;">※ 본 사이트의 차량 이미지, 사양 등에 대한 정보는 고객의 이해를 돕기 위한 참고용 자료로 실제 판매 모델과 다를 수 있습니다. 정확한 정보는 가까운 전시장의 영업직원에게 문의 바랍니다.</p>
        </div>
    </div>
    <!-------------- DISCLOSURES END ----------------->

    <!--------------- Bottom Menu ----------------->
    <div class="container">
        <div class="row" id=bottom-menu>
            <div class="col-sm-3">
                <ul>
                    <h5>Vehicles</h5>
                    <li><a href="#">CONTINENTAL</a></li>
                    <li><a href="#">MKZ</a></li>
                    <li><a href="#">AVIATOR</a></li>
                    <li><a href="#">NAUTILUS</a></li>
                    <li><a href="#">MKC</a></li>
                </ul>
            </div>
            <div class="col-sm-3">
                <ul>
                    <h5>Technology</h5>
                    <li><a href="#">링컨 인텔리전트 AWD</a></li>
                </ul>
            </div>
            <div class="col-sm-3">
                <ul>
                    <h5>Shopping</h5>
                    <li><a href="#">전시장 및 서비스센터 찾기</a></li>
                    <li><a href="#">브로셔 다운로드</a></li>
                    <li><a href="#">MyLincoln 매거진</a></li>
                    <li><a href="#">세일즈 프로모션</a></li>
                    <li><a href="#">링컨 파이낸셜 서비스</a></li>
                    <li><a href="#">시승 신청</a></li>
                </ul>
            </div>
            <div class="col-sm-3">
                <ul>
                    <h5>Owners</h5>
                    <li><a href="#">공인 서비스</a></li>
                    <li><a href="#">블랙 레이블 멤버십 서비스</a></li>
                    <li><a href="#">픽업&딜리버리</a></li>
                    <li><a href="#">소모성 부품 무상교환 서비스</a></li>
                    <li><a href="#">24시간 긴급출동 서비스</a></li>
                    <li><a href="#">보증 및 서비스</a></li>
                    <li><a href="#">리콜 안내</a></li>
                    <li><a href="#">싱크 3 업데이트</a></li>
                    <li><a href="#">순정 부품</a></li>
                    <li><a href="#">차량 관리</a></li>
                    <li><a href="#">정비 일정</a></li>
                    <li><a href="#">서비스 프로모션</a></li>
                    <li><a href="#">고객 센터</a></li>
                    <li><a href="#">전시장 및 서비스센터 찾기</a></li>
                </ul>
            </div>
        </div>
    </div>

    <!---- Bottom Menu END ---->

    <div class="container">
        <button class="accordion">Vehicles</button>
        <div class="panel">
            <p>
                <ul>
                    <li><a href="#">CONTINENTAL</a></li>
                    <li><a href="#">MKZ</a></li>
                    <li><a href="#">AVIATOR</a></li>
                    <li><a href="#">NAUTILUS</a></li>
                    <li><a href="#">MKC</a></li>
                </ul>
            </p>
        </div>
        <button class="accordion">Technology</button>
        <div class="panel">
            <ul>
                <li><a href="#">링컨 인텔리전트 AWD</a></li>
            </ul>
        </div>
        <button class="accordion">Shopping</button>
        <div class="panel">
            <ul>
                <li><a href="#">전시장 및 서비스센터 찾기</a></li>
                <li><a href="#">브로셔 다운로드</a></li>
                <li><a href="#">MyLincoln 매거진</a></li>
                <li><a href="#">세일즈 프로모션</a></li>
                <li><a href="#">링컨 파이낸셜 서비스</a></li>
                <li><a href="#">시승 신청</a></li>
            </ul>
        </div>
        <button class="accordion">Owners</button>
        <div class="panel">
            <ul>
                <li><a href="#">공인 서비스</a></li>
                <li><a href="#">블랙 레이블 멤버십 서비스</a></li>
                <li><a href="#">픽업&딜리버리</a></li>
                <li><a href="#">소모성 부품 무상교환 서비스</a></li>
                <li><a href="#">24시간 긴급출동 서비스</a></li>
                <li><a href="#">보증 및 서비스</a></li>
                <li><a href="#">리콜 안내</a></li>
                <li><a href="#">싱크 3 업데이트</a></li>
                <li><a href="#">순정 부품</a></li>
                <li><a href="#">차량 관리</a></li>
                <li><a href="#">정비 일정</a></li>
                <li><a href="#">서비스 프로모션</a></li>
                <li><a href="#">고객 센터</a></li>
                <li><a href="#">전시장 및 서비스센터 찾기</a></li>
            </ul>
        </div>
    </div>
    
    
<%@ include file="/WEB-INF/views/includes/footer.jsp" %>