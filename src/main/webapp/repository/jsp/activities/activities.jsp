<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" />
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<title>전 세계 인기 여행지 & 꼭 가봐야 할 명소 추천 | 트립닷컴</title>
<link href="/nadri/repository/img/main/trip.ico" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="/nadri/repository/css/activities/activities.css">
<link rel="stylesheet" type="text/css" href="/nadri/repository/css/activities/activities_review.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link href="/nadri/repository/img/main/trip.ico" rel="shortcut icon" type="image/x-icon">
</head>
<body>

	<%-- <div class="trip_common_head_con">
		<jsp:include page="/repository/jsp/main/main_top.jsp">
			<jsp:param value="param1" name="param1" />
		</jsp:include> 

	</div> --%>
	<!-- 몸통 -->
	<input type="hidden" id="activity_seq" value="${param.activity_seq}"/>
	<input type="hidden" id="member_seq" value="${member_seq }"/>
	<input type="hidden" id="pageNum" value="1"/>
	<div class="productdetail-container">
		<input type="hidden" id="page_id" value="10650010429">
		<!-- 눈썹 -->
		<div class="product-detail-breadcrumbs">
			<div class="crumbs-wrap ">
				<div class="crumbs-item">
					<a href="#">홈</a> <span class="crumbs-separator">&gt;</span>
				</div>
				<div class="crumbs-item">
					<a href="#">서울 액티비티</a> <span class="#">&gt;</span>
				</div>
				<div class="crumbs-item">
					<a href="#">검색 결과</a> <span class="crumbs-separator">&gt;</span>
				</div>
				<div class="crumbs-item">
					<span>title</span>
				</div>
			</div>
		</div>

		<div style="display: none;"></div>

		<!-- 얼굴 -->
		<header class="detail-header-container productdetail-common-inner-width">
			<section class="flex title fjc-sb">
				<h1 class="productName ffps" id="activity_name">title</h1>
				<p class="ffpr c6 fs2">상품번호: 36756741</p>
			</section>

			<div class="comment-height">
				<div class="comment-sold">
					<section>
						<span class="comment-score"> <em class="good-comment">total_avg_act_review</em> /5
						</span><span class="comment-count">리뷰 total_cnt_act_review개</span>
					</section>
				</div>
				<div class="collection default-collection">
					<div class="collection-img"></div>
					<div class="collection-tips">즐겨찾기</div>
				</div>
			</div>

			<section id="imageContainer" class="flex imageContainer">
				<div class="imgBox productdetail-common-width svg-default-img">
					<a title="서울 N서울타워 전망대 입장권" href=""> <img id="main_img" alt="서울 N서울타워 전망대 입장권" class="imgClass" src="">
					</a>
				</div>

				<section class="bookLayer-container flex fd-c">
					<div class="bookLayer-inner bookLayer-inner-fixed fixedT100 transition-show" style>
						<div class="m_footer">
							<div class="m_footer_box">
								<div class="m_footer_layer_header"></div>
								<div class="m_footer_layer_body">
									<div class="m_footer_info">최저가</div>
									<div class="m_footer_flex">
										<div class="u_price">
											<span class="u_price_content"> <span class="u_price_number" id="activity_salePrice">8,800</span> <span class="u_price_currency">원</span>
											</span>
										</div>

										<div class="u_price">
											<span class="u_price_content u_price_content_lineThrough"> <span class="u_price_number" id="activity_price">11,800</span> <span class="u_price_currency">원</span>
											</span>
										</div>
									</div>
								</div>
							</div>
							
							<!-- <form method="post" action="/nadri/KakaoPay">
    							<div class="m_footer_bottom ">
									<button class="m_footer_bottom_btn ">예약하기</button>
								</div>
							</form> 카카오페이 api -->
							
    							<div class="m_footer_bottom ">
									<button class="m_footer_bottom_btn" id="check_module" type="button">예약하기</button>
								</div> <!-- i'amport api -->
							
						</div>
					</div>
				</section>
			</section>

			<section class="tagsContainer productdetail-common-width flex">
				<div class="tagItemContainer flex">
					<img class="img" src="https://pic.tripcdn.com/picaresenglish/activity/ottd-pic-service/icon/ic_Available_Top@2x.ca73e56f.png" width="18px" height="18px" data-src="https://pic.tripcdn.com/picaresenglish/activity/ottd-pic-service/icon/ic_Available_Top@2x.ca73e56f.png"> <span class="tagName ffpr fs3 c9 specialColor">오늘부터 바로사용</span>
				</div>
				<div class="tagItemContainer flex">
					<img class="img" src="https://webresource.tripcdn.com/ares2/activity/ottd-pic-service/1.0.35/default/detail_icon/ic_refundable.png" width="18px" height="18px" data-src="https://webresource.tripcdn.com/ares2/activity/ottd-pic-service/1.0.35/default/detail_icon/ic_refundable.png"> <span class="tagName ffpr fs3 c9 ">취소 불가</span>
				</div>
				<div class="tagItemContainer flex">
					<img class="img" src="https://webresource.tripcdn.com/ares2/activity/ottd-pic-service/1.0.35/default/detail_icon/ic_Show%20ID.png" width="18px" height="18px" data-src="https://webresource.tripcdn.com/ares2/activity/ottd-pic-service/1.0.35/default/detail_icon/ic_Show%20ID.png"> <span class="tagName ffpr fs3 c9">전자 바우처 제시</span>
				</div>
				<div class="tagItemContainer flex">
					<img class="img" src="https://webresource.tripcdn.com/ares2/activity/ottd-pic-service/1.0.35/default/trip_detail/ic_calendar@2x.webp" width="18px" height="18px" data-src="https://webresource.tripcdn.com/ares2/activity/ottd-pic-service/1.0.35/default/trip_detail/ic_calendar@2x.webp"> <span class="tagName ffpr fs3 c9">유효기간 내 사용</span>
				</div>
			</section>

			<div class="productdetail-common-width">
				<div class="confirmInfoBox">
					<img class="confirminfo-img" src="https://pic.tripcdn.com/picaresenglish/activity/ottd-pic-service/icon/ic_indent@2x.8552b9b5.png" data-src="https://pic.tripcdn.com/picaresenglish/activity/ottd-pic-service/icon/ic_indent@2x.8552b9b5.png">
					<div class="confirminfo-name">
						예약 확정 <span class="confirminfo-des">평균 예약 확정 시간 1분, 100% 확정</span>
					</div>
					<div class="confirminfo-tips" src="https://pages.trip.com/hwwl/Trip_icon/details_hp/in_click%20collection%20.png">
						<i class="confirminfo-tips-img"></i>
						<div class="refund-layer center-layer">
							<ul class="mt10">
								<li>결제 완료 후 공급처 측에서 예약 확정 안내 드릴 예정입니다. 공급처 예약 확정 후 트립닷컴 예약 확정 이메일을 발송해드립니다.</li>
								<li>예약 확정 시간 및 성공률은 지난 예약건에 기반한 수치 (단순 참고용)</li>
								<li>정확한 예약 확정 시간은 예약 확정 메일 또는 예약 상세 페이지에서 확인해주세요.</li>
							</ul>
						</div>
					</div>
				</div>
			</div>

			<section id="productFeatures" class="wordTextContainer productdetail-common-width c9">
				<h2 class="title ffps">액티비티 핵심 포인트</h2>
				<ul class="textList">
					<li class="dotBefore">서울 최고의 경치 명소, N서울타워 전망대에서 멋진 시내의 도심 뷰를 감상하세요.</li>
					<li class="dotBefore">해가 지면 반짝거리는 도심의 불빛에 감성에 젖어보세요.</li>
					<li class="dotBefore">미디어아트 전시 공간인 인사이드 서울을 높치지 마세요.</li>
				</ul>
			</section>
		</header>

		<div id="optionsAndPrice">
			<div class="m_sku m_sku_trip">
				<div class="m_sku_wrap">
					<div class="m_sku_inner">
						<div class="m_sku_header">
							<div class="m_sku_header_ol">
								<h2 class="m_sku_header_ol_left">옵션 및 요금</h2>
								<div class="m_sku_header_ol_right" id="ibuact-10650010429-date-reselect">다시 선택</div>
							</div>
						</div>
						<div class="m_sku_content ">
							<div class="sku_wrapper">
								<div class="m_calendar_extra_info m_calendar_extra_info_no_calendar ">
									<div class="m_calendar_extra_valid">
										<i class=" u_icon_ttd undefined u_icon_info2"></i>
										<div class="m_textcollapse">
											<div class="m_textcollapse_content">
												<div class="m_textcollapse_txt_wrapper" style="height: auto; overflow: hidden;">
													<div>
														<div>2021년 11월 9일 - 2022년 6월 30일 유효(현지 시간)</div>
														<div class="m_t"></div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="m_optionsparts ">
									<div class="m_options_parts">
										<div class="m_options_parts_item">
											<div class="m_options_parts_hit">옵션 선택</div>
											<div class="m_options_parts_container">
												<div>
													<div class="options_btn null null">성인 입장권(만 19세 이상)</div>
												</div>
												<div>
													<div class="options_btn null null">청소년 입장권(만 14세이상 만 18세 이하)</div>
												</div>
												<div>
													<div class="options_btn null null">어린이 입장권(만 13세 이하)</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="m_select_quantity ">
									<div class="m_select_header">
										<div class="m_select_header_title">예약 인원 선택</div>
									</div>
									<div class="m_select_quantity_container  ">
										<div class="m_select_quantity_content">
											<div class="m_select_quantity_source">
												<div>
													<div class="source_content">
														<span class="source_title  ">수량</span> <span class="source_desc "></span>
													</div>
												</div>
											</div>
											<div class="choice_options_wrapper">
												<div class="choice_options">
													<div class="m_choice_options">
														<div class="SelectQuantity_minus_0">
															<i class="u_icon_ttd undefined u_icon_subtract" style="color: rgb(40, 125, 250); font-size: 24px;"></i>
														</div>
														<span class="m_choice_options_content">
															<div class="m_input">
																<div class="m_input_content_wrap">
																	<div class="m_input_content">
																		<input defaultval="1" type="tel" class="input_val" allowclear="false" value="1">
																	</div>
																</div>
															</div>
														</span>
														<div id="SelectQuantity_plus_0">
															<i class="u_icon_ttd undefined u_icon_add" style="color: rgb(40, 125, 250); font-size: 24px;"></i>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<article class="detail-footer-container">
			<div class="message-inner productdetail-common-inner-width">
				<div class="wordtextOutContainer">
					<section id="productDesc" class="wordTextContainer productdetail-common-width c9">
						<h2 class="title ffps">상품 소개</h2>
						<div id="_productDesc" class="mainText ffpr fs3">
							<p>
								<strong> <img id="sub_img" src="">
								</strong>
							</p>

						</div>
					</section>
					<div id="buyNotice">
						<section id="valid" class="wordTextContainer productdetail-common-width c9">
							<h2 class="title ffps">유효 기간</h2>
							<div id="_valid" class="mainText ffpr fs3">
								<p>2021년 11월 9일부터 2022년 6월 30일까지 유효 (현지 시간), 1회 사용 가능</p>
							</div>
						</section>
						<section id="feeInclude" class="wordTextContainer productdetail-common-width c9">
							<h2 class="title ffps">포함 사항</h2>
							<ul class="textList">
								<li class="feeInclude">옵션에 따른 N서울타워 전망대 입장권</li>
							</ul>
						</section>
						<section id="feeExclude" class="wordTextContainer productdetail-common-width c9">
							<h2 class="title ffps">불포함 사항</h2>
							<ul class="textList">
								<li class="feeExclude">개인 비용 및 기타 포함되지 않은 모든 사항</li>
							</ul>
						</section>
						<section id="refundRule" class="wordTextContainer productdetail-common-width c9">
							<h2 class="title ffps">취소 및 환불 규정</h2>
							<ul class="textList">
								<li class="dotBefore">해당 상품은 예약이 완료되면 변경 및 취소가 불가합니다.</li>
							</ul>
						</section>
						<section id="howToUse" class="wordTextContainer productdetail-common-width c9">
							<h2 class="title ffps">사용방법</h2>
							<ul class="textList">
								<li class="dotBefore">예약페이지 내 바우처 코드(16자리)를 무인발권기에 입력 후 입장권으로 교환해주세요.</li>
								<li class="dotBefore">주소: 서울특별시 용산구 남산공원길 105 서울타워 본관 (Plaza) 5층</li>
								<li class="dotBefore">운영시간: 평일 12:00 - 21:00, 주말/공휴일 11:00 - 21:00</li>
								<li class="dotBefore">입장권 교환 시간: ~20:30</li>
								<li class="dotBefore">입장권 교환 장소: N서울타워 N Plaza 5층 키오스크</li>
							</ul>
						</section>
						<section id="attention" class="wordTextContainer productdetail-common-width c9">
							<h2 class="title ffps">주의 사항</h2>
							<div id="_attention" class="mainText ffpr fs3">
								<ul>
									<li>36개월 미만 유아 무료 입장(보호자 1명당 1명에 한함)</li>
								</ul>
							</div>
						</section>
					</div>

					<!-- 리뷰폼 들어가는곳 -->
					<jsp:include page="./activities_reviewForm.jsp">
						<jsp:param value="param1" name="param1" />
					</jsp:include>
					
					<div class="detail-imageShow-container dn">
						<button class="quitImageShow">
							<img width="24px" height="24px"
								src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEgAAABICAYAAABV7bNHAAAAAXNSR0IArs4c6QAAA0ZJREFUeAHtnE1u20AMhe0uu+gVdJIWzj4HyJ1yCJ0i62Ydr3WD3iBpt+57sgawAkmZH5LDEUyAkT3SkHwfqJ8Y9hwOk10ulw7ewwf4O/wMf4b/CMfsbUttk0ZqpWZq7+HdTCsGnuAf8CX7g8Ffswk7eENNcGpbMrJ4GmXiRQdfg4Ndo/3F39MOuATNJ+ihpi0jk+6AP/3WUTf7GPChdUjUAP8KTpDdE9AQ3kVsGbjZTmLt8Fg4xDEQEC9OKcYEzXUSa4anwCGTdwLiFTzVmuokiEvtnMDj/A3XlNeM68p3zHlBFPedNNX4gnpZc6q9soP4LLB2u8OuTXPdSag8t3Momkyuz4B4wWeC1PMTU0ZzCQmVlcChpp+zdhMIeJoFrPhGTYtaYENY6hrUEyjCMqvdLJEgLPOaBRKaPQKg1pyHQEwbLf8mg+mldwJ1SKixDpzQ/Z4hVYfjGZIbOB4huYPjCZJbOB4guYdTE1IzcG4gld5eox8BBOBE5wr6RLYWhVvkEIGxFkRTgGbsNT0q4xpCNGKqiI8NKilIMlZs/SbHSQiTiGEiNjeJgMCSj37r3K1SYRVCwvRkI9Q24ASYLBie2w0phNqDYwipXTgGkNqHowhpP3AUIO0PjiAkczj88sLdPBAQvO2bd5E6P0E44floP5AU4OwHkiKc9iEZwGkXkiGc9iAVwuHFl55j/i/cUFXyH/woUCKG+m05J4GkMMlYOVrE52gI0ogpLjwmoKYQzdgx2oqPsRBgkaMYxFIAy8Itcy1pTR6rUXCNnMlgOKFmoTVzR8HyUKCHGhZheSrMUy0jLHcFVT7VZx3kEU4osHpt1QsIJDa21WqslngDxtou81rNE64pTxg3q9ksUYL42EPVa1dPEKu04Dg1DWqBC8TmThXXgoClP+p19+UlAUjXBV0QqPRn4e7ghM4rhHT9WTiCcI2gHPP/ITlIQVjJ5+TPDJC7NIXbzgkdFLYFkM4EdF/cBBBWbFzcZFjZuTTcxGkVOufzFoJST7eB3w96+xxo5f0/jD8ej8ffK/vdD0+1P6JQaomxN55iHTxmia5mrjlfKY/spOsSXQyGCfdF3gDhxgjnushboI2BDt7DeU26LxM4gfkPrLKZl+UkenkAAAAASUVORK5CYII=" data-src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEgAAABICAYAAABV7bNHAAAAAXNSR0IArs4c6QAAA0ZJREFUeAHtnE1u20AMhe0uu+gVdJIWzj4HyJ1yCJ0i62Ydr3WD3iBpt+57sgawAkmZH5LDEUyAkT3SkHwfqJ8Y9hwOk10ulw7ewwf4O/wMf4b/CMfsbUttk0ZqpWZq7+HdTCsGnuAf8CX7g8Ffswk7eENNcGpbMrJ4GmXiRQdfg4Ndo/3F39MOuATNJ+ihpi0jk+6AP/3WUTf7GPChdUjUAP8KTpDdE9AQ3kVsGbjZTmLt8Fg4xDEQEC9OKcYEzXUSa4anwCGTdwLiFTzVmuokiEvtnMDj/A3XlNeM68p3zHlBFPedNNX4gnpZc6q9soP4LLB2u8OuTXPdSag8t3Momkyuz4B4wWeC1PMTU0ZzCQmVlcChpp+zdhMIeJoFrPhGTYtaYENY6hrUEyjCMqvdLJEgLPOaBRKaPQKg1pyHQEwbLf8mg+mldwJ1SKixDpzQ/Z4hVYfjGZIbOB4huYPjCZJbOB4guYdTE1IzcG4gld5eox8BBOBE5wr6RLYWhVvkEIGxFkRTgGbsNT0q4xpCNGKqiI8NKilIMlZs/SbHSQiTiGEiNjeJgMCSj37r3K1SYRVCwvRkI9Q24ASYLBie2w0phNqDYwipXTgGkNqHowhpP3AUIO0PjiAkczj88sLdPBAQvO2bd5E6P0E44floP5AU4OwHkiKc9iEZwGkXkiGc9iAVwuHFl55j/i/cUFXyH/woUCKG+m05J4GkMMlYOVrE52gI0ogpLjwmoKYQzdgx2oqPsRBgkaMYxFIAy8Itcy1pTR6rUXCNnMlgOKFmoTVzR8HyUKCHGhZheSrMUy0jLHcFVT7VZx3kEU4osHpt1QsIJDa21WqslngDxtou81rNE64pTxg3q9ksUYL42EPVa1dPEKu04Dg1DWqBC8TmThXXgoClP+p19+UlAUjXBV0QqPRn4e7ghM4rhHT9WTiCcI2gHPP/ITlIQVjJ5+TPDJC7NIXbzgkdFLYFkM4EdF/cBBBWbFzcZFjZuTTcxGkVOufzFoJST7eB3w96+xxo5f0/jD8ej8ffK/vdD0+1P6JQaomxN55iHTxmia5mrjlfKY/spOsSXQyGCfdF3gDhxgjnushboI2BDt7DeU26LxM4gfkPrLKZl+UkenkAAAAASUVORK5CYII=">
						</button>
						<div style="height: 15.5%;"></div>
						<div class="imageListContainer">
							<div class="imageInner"></div>
						</div>
						<div style="height: 4.1%;"></div>
						<div class="imageIndexContainer">
							<p class="ffpm tc c7">1/0</p>
							<div style="height: 1.6%;"></div>
							<div class="indexImageContainer tc"></div>
						</div>
					</div>

				</div>
			</div>
		</article>


		<div class="toastcomponent"></div>
	
		


	</div>

	

	<div id="wrap_foot">
		<footer>
			<jsp:include page="/repository/jsp/main/main_footer.jsp">
				<jsp:param value="param1" name="param1" />
			</jsp:include>
		</footer>
	</div>



	<!-- <div id="__next-error"></div>
	<script type="text/javascript" crossorigin="anonymous" src="//webresource.tripcdn.com/res/concat?f=/resaresenglish/ibu/onlinecommon/lib/cquery_110421.352b5c2d.js,cquery_pro.6d0231d2.js"></script>
	<script src="//webresource.tripcdn.com/ares2/ibu/onlinecommon/*/default/assets/ibu_gagtag2_online_bundle.js" crossorigin="anonymous" async=""></script>
	<script crossorigin="anonymous" src="//webresource.tripcdn.com/ares/infosec/captcha/~2.5.0/default/js/captcha.min.js?expires=1d"></script>
	<script crossorigin="anonymous" type="text/javascript" src="https://ak-s.tripcdn.com/locale/v2/100015469/ko-KR.js?etagc=15569907e1022e40db061fec6d8b6969"></script>
	<script crossorigin="anonymous" type="text/javascript" id="i18naccountpcsdk" secretkey="C03A346B910769EC" src="https://webresource.tripcdn.com/ares2/basebiz/i18naccountpcsdk/*/default/assets/i18n_account_pcsdk_bundle.js"></script>
	<script crossorigin="anonymous" type="text/javascript" src="https://ak-s.tripcdn.com/locale/v2/6002/ko-KR.js?etagc=fa15544aedd1c400a8b82d69c3185d3f"></script>
	<script crossorigin="anonymous" type="text/javascript" src="https://ak-s.tripcdn.com/locale/v2/6001/ko-KR.js?etagc=df43e5b6507ff0de9df67ce2e809ac7a"></script>
	<script crossorigin="anonymous" type="text/javascript" src="https://ak-s.tripcdn.com/locale/v2/100009239/ko-KR.js?etagc=a798631ea01dacff708e040f1165822f"></script>
	<script crossorigin="anonymous" src="https://webresource.tripcdn.com/ares2/ibu/onlinecommon/*/default/assets/ibu_l10n_online_bundle.js"></script>
	<script crossorigin="anonymous" type="text/javascript" id="i18nguestverifypcsdk" secretkey="67986D7FCD5D2C5C" src="https://webresource.tripcdn.com/ares2/basebiz/i18naccountpcsdk/*/default/assets/guestVerify.js"></script>
	<script crossorigin="anonymous" type="text/javascript" src="https://ak-s.tripcdn.com/locale/v2/330153/ko-KR.js?etagc=f5158fe4177dccce3ca0172317439256"></script>
	<script crossorigin="anonymous" type="text/javascript" src="https://ak-s.tripcdn.com/locale/v2/330151/ko-KR.js?etagc=6a40afadabb933fac51a38441f7edf8e"></script>
	<script type="text/javascript" src="https://ak-s.tripcdn.com/modules/basebiz/i18naccountcomponentssdk/i18naccountcomponentssdk.6e306b320450e87c28afdecb4d66d8cf.js"></script>
	 -->
	 <script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
	 <script type="text/javascript" src="/nadri/repository/js/activities/activities_review.js"></script>
	 <script type="text/javascript" src="/nadri/repository/js/activities/activities.js"></script>
	 <!-- <script src="https://code.jquery.com/jquery-latest.min.js"></script> -->
	 <script type="text/javascript" src="/nadri/repository/js/activities/jquery.bootpag.min.js"></script>
	 <script type="text/javascript">
		$(function(){
			//액티비티 정보 불러오기
			onActivities();
			
			//리뷰수 및 유저정보 불러오기
			getActReviewCnt();
			
			//리뷰리스트 불러오기
			getReviewList();
			
			//페이징 처리
			pagination();
		});
	</script>
	
	<script>
$("#check_module").click(function () {
var IMP = window.IMP; // 생략가능
IMP.init('imp37746914');
// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
IMP.request_pay({
pg: 'inicis', // version 1.1.0부터 지원.
/*
'kakao':카카오페이,
html5_inicis':이니시스(웹표준결제)
'nice':나이스페이
'jtnet':제이티넷
'uplus':LG유플러스
'danal':다날
'payco':페이코
'syrup':시럽페이
'paypal':페이팔
*/
pay_method: 'card',
/*
'samsung':삼성페이,
'card':신용카드,
'trans':실시간계좌이체,
'vbank':가상계좌,
'phone':휴대폰소액결제
*/
merchant_uid: 'merchant_' + new Date().getTime(),
/*
merchant_uid에 경우
https://docs.iamport.kr/implementation/payment
위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
참고하세요.
나중에 포스팅 해볼게요.
*/
name: '주문명:결제테스트',
//결제창에서 보여질 이름
amount: 1000,
//가격
buyer_email: 'iamport@siot.do',
buyer_name: '구매자이름',
buyer_tel: '010-1234-5678',
buyer_addr: '서울특별시 강남구 삼성동',
buyer_postcode: '123-456',
m_redirect_url: 'https://www.yourdomain.com/payments/complete'
/*
모바일 결제시,
결제가 끝나고 랜딩되는 URL을 지정
(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
*/
}, function (rsp) {
console.log(rsp);
if (rsp.success) {
var msg = '결제가 완료되었습니다.';
msg += '고유ID : ' + rsp.imp_uid;
msg += '상점 거래ID : ' + rsp.merchant_uid;
msg += '결제 금액 : ' + rsp.paid_amount;
msg += '카드 승인번호 : ' + rsp.apply_num;
} else {
var msg = '결제에 실패하였습니다.';
msg += '에러내용 : ' + rsp.error_msg;
}
alert(msg);
});
});
</script>
</body>
</html>




















