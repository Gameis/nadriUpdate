<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전 세계 인기 여행지 & 꼭 가봐야 할 명소 추천 | 트립닷컴</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="/nadri/repository/css/tripmoment/tripmoment.css">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" media="all">
<link rel="stylesheet" type="text/css"
	href="/nadri/repository/css/main/main_top.css">
<link href="/nadri/repository/img/main/trip.ico" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="/nadri/repository/css/tripmember/loginmodal.css">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
	integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
	integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
	crossorigin="anonymous"></script>
</head>
<body>
	<!-- header start -->
	<div class="trip_main_hd_top_nav">
		<div class="main_hd trip_main_hd main_hd_line">
			<div class="main_hd_inner main_hd_newline">
				<div class="main_hd_flex">
					<div class="trip_main_hd_logo">
						<a class="trip" href="#">trip.com</a>
					</div>

					<div class="main_hd_account main_hd_dropdown trip_main_hd_no_login">


						<c:if test="${memId == null}">
							<!-- Login Button trigger modal -->
							<div class="btn btn-primary" data-bs-toggle="modal"
								data-bs-target="#loginmodal" id="loginBtn">
								<span class="loginWrite">로그인&nbsp;&nbsp;/&nbsp;&nbsp;회원가입</span>
							</div>
						</c:if>

						<c:if test="${memId != null }">
							<div>
								<p>
									<a href="/nadri/tripmember/myPage">${sessionScope.memName}님
										환영합니다.</a>
								</p>

							</div>
							<div class="logout_wrap">
								<button id="logoutBtn" type="button">로그아웃</button>
							</div>
							<div class="clearfix"></div>
						</c:if>
					</div>

					<div class="trip_main_hd_nav"></div>
				</div>
			</div>
		</div>
	</div>

	<!-- Login Modal -->
	<div class="modal fade" id="loginmodal" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel"
						style="color: #8EC0E4;">trip.com</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body">
					<form class="loginForm">
						<svg id="ryan" viewBox="0 0 120 120"
							xmlns="http://www.w3.org/2000/svg">
            <path d="M0,150 C0,65 120,65 120,150" fill="#e0a243"
								stroke="#000" stroke-width="2.5" />
            <g class="ears">
                <path d="M46,32 L46,30 C46,16 26,16 26,30 L26,32"
								fill="#e0a243" stroke="#000" stroke-width="2.5"
								stroke-linecap="round" transform="rotate(-10,38,24)" />
                <path d="M74,32 L74,30 C74,16 94,16 94,30 L94,32"
								fill="#e0a243" stroke="#000" stroke-width="2.5"
								stroke-linecap="round" transform="rotate(10,82,24)" />
            </g>
            <circle cx="60" cy="60" r="40" fill="#e0a243" stroke="#000"
								stroke-width="2.5" />
            <g class="eyes">
                <!-- left eye and eyebrow-->
                <line x1="37" x2="50" y1="46" y2="46" stroke="#000"
								stroke-width="3" stroke-linecap="round" />
                <circle cx="44" cy="55" r="3" fill="#000" />
                <!-- right eye and eyebrow -->
                <line x1="70" x2="83" y1="46" y2="46" stroke="#000"
								stroke-width="3" stroke-linecap="round" />
                <circle cx="76" cy="55" r="3" fill="#000" />
            </g>
            <g class="muzzle">
                <path
								d="M60,66 C58.5,61 49,63 49,69 C49,75 58,77 60,71 M60,66 C61.5,61 71,63 71,69 C71,75 62,77 60,71"
								fill="#fff" />
                <path
								d="M60,66 C58.5,61 49,63 49,69 C49,75 58,77 60,71 M60,66 C61.5,61 71,63 71,69 C71,75 62,77 60,71"
								fill="#fff" stroke="#000" stroke-width="2.5"
								stroke-linejoin="round" stroke-linecap="round" />
                <polygon points="59,63.5,60,63.4,61,63.5,60,65"
								fill="#000" stroke="#000" stroke-width="5"
								stroke-linejoin="round" />
            </g>
            <path
								d="M40,105 C10,140 110,140 80,105 L80,105 L70,111 L60,105 L50,111 L40,105"
								fill="#fff" />
        </svg>

						<div class="form-floating">
							<input type="text" class="form-control" id="floatingInput"
								name="floatingInput" placeholder="Identification"> <label
								for="floatingInput">Identification</label>
							<div id="modalidDiv"></div>
						</div>

						<div class="form-floating">
							<input type="password" class="form-control" id="floatingPassword"
								name="floatingPassword" placeholder="Password"> <label
								for="floatingPassword">Password</label>
							<div id="modalpwdDiv"></div>
						</div>

						<div>
							<img onclick="kakaoLogin();"
								src="/nadri/repository/img/tripmember/kakao_login_large_wide.png"
								style="cursor: pointer;" width="270" height="45">
						</div>


						<div>
							<input type="button" id="modalLoginBtn" value="회원 계정 로그인">
						</div>
						<div id="loginResult"></div>
					</form>
				</div>


				아직 회원가입을 하지 않으셨나요?
				<div class="modal-footer">
					<button id="tripmemberBtn" class="btn btn-primary"
						data-bs-target="#agreementmodal" data-bs-toggle="modal">회원가입하기</button>
				</div>

			</div>
		</div>
	</div>

	<%-- 두번째 모달 약관신청--%>
	<div class="modal fade" id="agreementmodal" aria-hidden="true"
		data-bs-backdrop="static" aria-labelledby="exampleModalToggleLabel2"
		tabindex="-1">
		<div
			class="modal-dialog modal-xl modal-dialog-scrollable modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalToggleLabel2"
						style="color: #8EC0E4;">trip.com 약관신청</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<%--이용약관동의 --%>
				<div class="modal-body">
					<jsp:include page="../main/main_top_loginmodal/agreement.jsp" />
				</div>

				<div class="modal-footer">
					<div class="login">
						<button class="btn btn-primary" data-bs-target="#loginmodal"
							data-bs-toggle="modal">로그인화면으로</button>
					</div>
					<div class="membership">
						<button id="membershipmodalBtn" class="btn btn-primary"
							data-bs-target="#membershipmodal" data-bs-toggle="modal"
							onclick='return false;' disabled="disabled">회원가입으로</button>
					</div>
				</div>

			</div>
		</div>
	</div>

	<%-- 세번째 모달 회원가입  --%>
	<div class="modal fade" id="membershipmodal" aria-hidden="true"
		data-bs-backdrop="static" aria-labelledby="exampleModalToggleLabel3"
		tabindex="-1">
		<div
			class="modal-dialog modal-xl modal-dialog-scrollable modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalToggleLabel3"
						style="color: #8EC0E4;">trip.com 회원가입</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<%--회원가입신청 --%>
				<div class="modal-body">
					<jsp:include page="../main/main_top_loginmodal/writeForm.jsp">
						<jsp:param value="param2" name="param2" />
					</jsp:include>
				</div>

				<div class="login">
					<button class="btn btn-primary" data-bs-target="#agreementmodal"
						data-bs-toggle="modal">약관신청화면으로</button>
				</div>
			</div>
		</div>
	</div>
	<!-- header end -->

	<input type="hidden" id="moment_seq" value="${param.moment_seq}" />
	<input type="hidden" id="member_seq" value="${member_seq}" />
	<input type="hidden" id="memId" value="${memId }" />

	<div class="travel_guide_root_class">
		<div class="TravelDetailContainer">
			<div id="tripmoment">

				<div class="devider-t"></div>

				<!-- 경로 및 검색창 -->
				<div class="tripmoment_path">

					<div class="tripmomentSearch">
						<div class="tripmomentSearch_input">
							<input type="text" placeholder="여행지, 명소, 호텔 등으로 검색"
								onkeyup="searchEnterkey()" class="search">
						</div>
						<div class="tripmomentSearch_button">
							<div class="tripmomentSearch_icon"></div>
						</div>
					</div>
				</div>

				<!-- Tripmoment container -->
				<div style="margin-top: 8px; width: 100%;">
					<div class="PhotoStyle photo_style">
						<div class="imageGallery imagallery-noback">
							<div class="carouselWrap">
								<div class="carousel_list_imgs_list">
									<div class="image-gallery" aria-live="polite">
										<div class="image-gallery-content">
											<div class="image-gallery-slide-wrapper bottom">
												<div id="carouselExampleFade"
													class="carousel slide carousel-fade"
													data-bs-ride="carousel">
													<div id="carousel-inner" class="carousel-inner">
														<div class="carousel-item active">
															<img alt="" src="#" class="img-img" id="carousel_item0">
															<div class="img-grey"></div>
															<img id="carousel-item0" src="#" class="d-block w-100"
																alt="...">
														</div>
														<div class="carousel-item">
															<img alt="" src="#" class="img-img" id="carousel_item1">
															<div class="img-grey"></div>
															<img id="carousel-item1" src="#" class="d-block w-100"
																alt="...">
														</div>
														<div class="carousel-item">
															<img alt="" src="#" class="img-img" id="carousel_item2">
															<div class="img-grey"></div>
															<img id="carousel-item2" src="#" class="d-block w-100"
																alt="...">
														</div>
														<div class="carousel-item">
															<img alt="" src="#" class="img-img" id="carousel_item3">
															<div class="img-grey"></div>
															<img id="carousel-item3" src="#" class="d-block w-100"
																alt="...">
														</div>
													</div>
													<button class="carousel-control-prev" type="button"
														data-bs-target="#carouselExampleFade" data-bs-slide="prev">
														<span class="carousel-control-prev-icon"
															aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
													</button>
													<button class="carousel-control-next" type="button"
														data-bs-target="#carouselExampleFade" data-bs-slide="next">
														<span class="carousel-control-next-icon"
															aria-hidden="true"></span> <span class="visually-hidden">Next</span>
													</button>
												</div>

												<div id="container-pop" class="container">
													<div id="row-cols-4-pop" class="row row-cols-4">
														<img id="col-img0" class="col" src="#"></img> <img
															id="col-img1" class="col" src="#"></img> <img
															id="col-img2" class="col" src="#"></img> <img
															id="col-img3" class="col" src="#"></img>
													</div>
													<!-- row-cols-4 -->
												</div>
												<!-- container -->

											</div>
											<!-- image-gallery-slide-wrapper bottom -->

											<!-- thumbnails -->

										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- BoxRight -->
						<div class='BoxRight box-right'
							style="position: relative; z-index: 0">
							<div class="trip_User trip_moment_user userContainer">
								<div class="trip_container">
									<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"
										fill="currentColor" class="bi bi-person-circle"
										viewBox="0 0 16 16">
									<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
									<path fill-rule="evenodd"
											d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
									</svg>
								</div>
								<span class="nickname"></span>
							</div>

							<!-- scroll_content start -->
							<div class="scroll_content">
								<div class="article_title"></div>
								<div class="article_content"
									style="position: relative; overflow: hidden;">
									<div style="white-space: pre-line;" class="content_collapse"></div>

									<div
										style="background-color: rgb(245, 247, 250); width: 30px; height: 30px; position: absolute; bottom: 0px; right: 0px;">
									</div>
								</div>
								<div class="time"></div>
								<div style="background-color: #dadfe6; height: 1px"></div>
							</div>
							<!-- scroll content End -->

							<!-- 댓글 append 될 부분 -->
							<div id="comment_container"></div>

							<!-- 좋아요 & 댓글 달기 -->
							<div class="like input_view">
								<div class="like input_phaise_container">
									<div class="like">
										<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32"
											fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
										  <path
												d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
										</svg>
									</div>
								</div>
								<div class="like_btn textarea_container">
									<div class="like textarea_2" contenteditable="true"
										placeholder="댓글을 남겨주세요"></div>
								</div>
								<div class="like submit">확인</div>
							</div>
							<!-- 좋아요 & 댓글 달기 End -->
						</div>
						<!-- BoxRight End -->
					</div>
				</div>
				<!-- 관련 트립 모먼트 -->
				<div class="travel-photo-title">관련 트립모먼트</div>
				<div class="PhotoListStyle tripphoto" id="PhotoListStyle">
					<div style="position: relative; height: 1250px;"></div>
				</div>
			</div>
		</div>
	</div>

	<div id="wrap_foot">
		<footer>
			<jsp:include page="../main/main_footer.jsp">
				<jsp:param value="param1" name="param1" />
			</jsp:include>
		</footer>
	</div>
	<script type="text/javascript"
		src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript"
		src="/nadri/repository/js/tripmoment/tripmoment.js"></script>
	<script src="/nadri/repository/js/modal/modal.js"></script>
	<script type="text/javascript">



$('.btn-close').click(function(){
	location.href='/nadri/index.jsp';	
});
	
//로그인
$('#modalLoginBtn').click(function(){
	$('#modalidDiv').empty();
	$('#modalpwdDiv').empty();

	if($('#floatingInput').val()==''){
		$('#modalidDiv').html('아이디를 입력해주세요');
	}	
	else if($('#floatingPassword').val()==''){
		$('#modalpwdDiv').html('비밀번호를 입력해주세요');
	}	
	else{
		$.ajax({
			url:'/nadri/tripmember/login',
			type: 'post',
		//	data:$('#loginForm').serialize(),
			
			data: {'id':$('#floatingInput').val(),
				   'pwd':$('#floatingPassword').val()},//{'id':$('#id').val()}
				
			success: function(data){
				//console.log(JSON.stringify(data));
				
				if(data=='ok'){
					//	alert('로그인에 성공하셨습니다');	
					location.href='/nadri/tripmoment/tripmomentView?moment_seq=' + $('#moment_seq').val();
				}else if(data=='fail'){
					$('#loginResult').text('로그인에 실패하셨습니다');
					$('#loginResult').css('color', 'red');
					$('#loginResult').css('font-size', '15pt');
					$('#loginResult').css('font-weight', 'bold');
				}	
				
			},		//success
			
			error: function(err){
				console.log(err);
				
			}
			
		});		//ajax
	} 		//else			
});		//click	


//로그아웃				
$('#logoutBtn').click(function(){
	$.ajax({
			url:'/nadri/tripmember/logOut',
			type: 'post',
						
		success: function(){
			alert('로그아웃 하셨습니다');	
			location.href='/nadri/index.jsp';
		},	//success
			
		error: function(err){
			console.log(err);			
		}	
			
	});	// ajax

});		//logOutBtn click			

</script>
	<script type="text/javascript">
	
//검색
function searchEnterkey() {
    if (window.event.keyCode == 13) {
        if($('.search').val() != "") 
        $.ajax({
        	url: '/nadri/area/search',
        	type: 'get',
        	data: 'searchText=' + $('.search').val(),
        	success: function(data) {
        		if(data.content_seq == '2') location.href="/nadri/main/area?main_seq=" + data.seq;
        		else if(data.content_seq == '3') location.href="/nadri/area/popular?pop_seq=" + data.seq;
        		else if(data.content_seq == '5') location.href="/nadri/area/activity?activity_seq=" + data.seq;
        		else alert('검색어를 제대로 입력 해 주세요');
        	},
        	error: function(err) {
        		console.log(err);
        	}
        });
    }
}
</script>

	<script type="text/javascript">
	$(function() {
		$.ajax({
			url : '/nadri/tripmoment/getTripImg',
			type : 'get',
			data : 'moment_seq=' + $('#moment_seq').val(),
			success : function(data) {
				
				//이미지 데이터 넣기
				$('#carousel-item0').prop('src', '/nadri/repository/img/' + data[0].img_path + '/' + data[0].img_name);
				$('#carousel-item1').prop('src', '/nadri/repository/img/' + data[1].img_path + '/' + data[1].img_name);
				$('#carousel-item2').prop('src', '/nadri/repository/img/' + data[2].img_path + '/' + data[2].img_name);
				$('#carousel-item3').prop('src', '/nadri/repository/img/' + data[3].img_path + '/' + data[3].img_name);
				
				$('#carousel_item0').prop('src', '/nadri/repository/img/' + data[0].img_path + '/' + data[0].img_name);
				$('#carousel_item1').prop('src', '/nadri/repository/img/' + data[1].img_path + '/' + data[1].img_name);
				$('#carousel_item2').prop('src', '/nadri/repository/img/' + data[2].img_path + '/' + data[2].img_name);
				$('#carousel_item3').prop('src', '/nadri/repository/img/' + data[3].img_path + '/' + data[3].img_name);
				
				$('#col-img0').prop('src', '/nadri/repository/img/' + data[0].img_path + '/' + data[0].img_name);
				$('#col-img1').prop('src', '/nadri/repository/img/' + data[1].img_path + '/' + data[1].img_name);
				$('#col-img2').prop('src', '/nadri/repository/img/' + data[2].img_path + '/' + data[2].img_name);
				$('#col-img3').prop('src', '/nadri/repository/img/' + data[3].img_path + '/' + data[3].img_name);
				
				//이미지 클릭시 보여주기
				$('.row-cols-4').find('#col-img0').click(function() {
					$('.active img').prop('src', '/nadri/repository/img/' + data[0].img_path + '/' + data[0].img_name);
				});
				$('.row-cols-4').find('#col-img1').click(function() {
					$('.active img').prop('src', '/nadri/repository/img/' + data[1].img_path + '/' + data[1].img_name);
				});
				$('.row-cols-4').find('#col-img2').click(function() {
					$('.active img').prop('src', '/nadri/repository/img/' + data[2].img_path + '/' + data[2].img_name);
				});
				$('.row-cols-4').find('#col-img3').click(function() {
					$('.active img').prop('src', '/nadri/repository/img/' + data[3].img_path + '/' + data[3].img_name);
				});
			},
			
			error : function(err) {
			
			}
		});
		$.ajax({
			url : '/nadri/tripmoment/getTripView',
			type : 'get',
			data : 'moment_seq=' + $('#moment_seq').val(),
			success : function(data){
				
				$('.nickname').text(data.nickname);
				$('.article_title').text(data.moment_title);
				$('.article_content').text(data.moment_content);
				/* $('.time'). */
			},
			
			error : function(err) {
			}
		});
		
		$.ajax({
			url : '/nadri/tripmoment/onReTripmoment',
			type : 'get',
			data : 'moment_seq=' + $('#moment_seq').val(),
			success : function(data) {

				var left = 0; 
				var top = -430;
				$.each(data, function(index, items){
			
				if(index % 4 == 0) {
					left = 0; top = top + 430; 
				}
				else if(index % 4 == 1) left = 290;
				else if(index % 4 == 2) left = 580;
				else if(index % 4 == 3) left = 870;

				$('<div>', {
					class: 'item item-odd',
					style : 'position : absolute; left: '+ left +'px; top: '+ top +'px'
				}).append($('<div>', {
					class : 'content'	
				}).append($('<div>', {
					class : 'img-tripmoment'
				}).append($('<a>', {
					href : "",
					title : '서울, 추천 트립 모먼트'
				}).append($('<img>', {
					class : 'img',
					alt : '서울, 추천 트립모먼트',
					src : '/nadri/repository/img/' + items.img_path + '/' + items.img_name
				})))).append($('<div>', {
					class : 'text'	
				}).append($('<a>', {
					style : 'color : black;',
					class : 'item-title',
					title : '서울, 추천 트립 모먼트',
					text : items.moment_content
				})).append($('<div>', {
					class : 'user ellipsis'
				}).append($('<i>', {
					class : 'bi bi-person-circle'			
				})).append($('<span>', {
					class : 'nickname-t',
					text : items.nickname
				}))))).appendTo($('#PhotoListStyle > div'));
				
				})//each	
			},
			error : function(err) {
			}
		});
	});
</script>

	<script type="text/javascript">
$(function() {
	$('.submit').click(function(){
		
		if($('#memId').val() != "") {
			
		if($('.textarea_2').text() != "") 
			$.ajax({
				url : '/nadri/tripmoment/tripmomentCommentWrite',
				type : 'post',
				data : 'moment_seq=' + $('#moment_seq').val() + '&member_seq=' + $('#member_seq').val() + '&moment_comment=' + $('.textarea_2').text(),
				success : function(data) {
									
				},
				
				error : function(err) {
				}
			});
		}else $('#loginBtn').trigger("click");	
		
	});
	$.ajax({
		url : '/nadri/tripmoment/tripmomentCommentGetList',
		type : 'get',
		data : 'moment_seq=' + $('#moment_seq').val(),
		success : function(data) {
			
			$.each(data, function(index, items){
				
			$('<div>', {
				class : 'scroll_comment'
			}).append($('<div>', {
				class : 'user'
			}).append($('<i>', {
				class : 'bi bi-person-circle'
			})).append($('<div>', {
				class : 'user_nickname',
				text : items.nickname
			}))).append($('<div>', {
				class : 'content',
				text : items.moment_comment
			})).append($('<div>', {
				class : 'footer'
			}).append($('<div>', {
				class : 'post_time',
				text : items.moment_comment_logtime
			}))).append($('<div>', {
				style : 'height : 15px;'
			})).append($('<div>', {
				class : 'devider'
			})).appendTo($('#comment_container'));
			
		})//each	
			
		},
			error : function(err) {
		}
	});
});
</script>
</body>
</html>