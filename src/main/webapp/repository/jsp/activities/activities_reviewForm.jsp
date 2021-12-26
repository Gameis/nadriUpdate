<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%-- <div name="review-header" id="review-header" class="review-header">	
	<div name="reviewContainer" id="reviewContainer" class="reviewContainer">
		<div class="reviewHeaderContainer">
			<div class="review-box">
				<div>
					<div class="review-title">리뷰 작성하기</div>
					<div class="reivew-tip">
						<span name="tip-text" class="tip-text">
							
						</span>
					</div>
				</div>
			</div><!-- review-box -->
		</div><!-- reviewHeaderContainer -->
		
		<div class="review-writeContainer">
			<ul class="review-write-list">
				<div class="review-write-form">
					<li class="review-write-detail">
					
						<div class="review-write-user">
							<a style="color: rgb(15, 41, 77); text-decoration: none;">
								<img class="review-write-userImg" alt="user_icon" width="50" height="50" src="https://cdn.pixabay.com/photo/2021/10/15/21/11/squid-game-6713440_1280.jpg">
							</a>
							<div class="review-write-userInfo">
								<div class="reivew-write-userName">
									user_name
								</div><!-- reivew-write-userName -->
							</div><!-- review-write-userInfo -->
						</div><!-- review-write-user -->
						
						<div class="review-write-content">
							<form id="pop_review_writeForm">
								<input type="hidden" id="main_seq" name="main_seq" value="99">
								<input type="hidden" id="content_seq" name="content_seq" value="3"/>
								<input type="hidden" id="pop_seq" name="pop_seq" value="${param.pop_seq }"/>
								<!-- 평점 -->
								<div class="review-write-wrap">
								    <div class="review-write-selectScore">
								    	<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
											<input type="radio" class="btn-check" name="pop_review_score" id="btnRadio5" value=5 checked>
											<label class="score btn btn-outline-primary" for="btnRadio5">5점</label>
											
											<input type="radio" class="btn-check" name="pop_review_score" id="btnRadio4" value=4 >
											<label class="score btn btn-outline-primary" for="btnRadio4">4점</label>
												
											<input type="radio" class="btn-check" name="pop_review_score" id="btnRadio3" value=3 >
											<label class="score btn btn-outline-primary" for="btnRadio3">3점</label>
											  
											<input type="radio" class="btn-check" name="pop_review_score" id="btnRadio2" value=2 >
											<label class="score btn btn-outline-primary" for="btnRadio2">2점</label>
											  
											<input type="radio" class="btn-check" name="pop_review_score" id="btnRadio1" value=1 >
											<label class="score btn btn-outline-primary" for="btnRadio1">1점</label>
										</div>
									</div><!-- review-write-selectScore -->
								</div>
								
								<!-- 내용 -->
								<div class="review-write-wrap">
									<div class="input-group">
									  <span class="input-group-text">내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</span>
									  <textarea class="form-control" name="pop_review_content" aria-label="With textarea" style="resize: none;"></textarea>
									</div>
								</div>
								
								<!-- 파일업로드 -->
								
								<button id="pop_review_writeBtn" type="button" class="btn btn-primary">등록</button>
								<button type="reset" class="btn btn-primary">다시작성</button>
								
							</form>
						</div><!-- review-write-content -->
						
					</li><!-- review-write-detail -->
				</div><!-- review-write-form -->
			</ul><!-- review-write-list -->
		</div><!-- review-writeContainer -->
	</div><!-- reviewContainer -->
</div><!-- review --> --%>
	
<!-- <div id="detailComment" class="productdetail-comment-inner-width">
	<div class="commentContainer border-container">
		<div id="test" class="commentlist-contaier">
			<section class="productdetail-commentlist-container"><h2 class="title">리뷰<em class="commentCount">(1)</em></h2>
				<div><span class="list-score"><em class="list-good-comment">3.3</em>/5</span> <span class="list-label"></span></div>
				<p><span id="ibu_dtlopg_comment_filter_all_1" class="filter-all">전체</span></p>
				<div class="comment-list-box">
					<div class="title-ffsd">리뷰</div>
					<div class="comment-list">
						<div class="comment-list-item">
							<div>
								<div class="user-image-position"><img src="https://ak-d.tripcdn.com/images/Z80o180000013ulur1D76.jpg" data-src="https://ak-d.tripcdn.com/images/Z80o180000013ulur1D76.jpg"></div>
								<div class="user-commentinfo-position"><div><p class="user-comment-name">_NV4*****0697</p></div><div><span class="commentScore"><em class="good-comment">5.0</em>/5</span> <span class="commentDate">2021년 10월 4일</span></div></div>
							</div>
							<div class="userinfo-position-left comment-container">
								<div class="text-img"><div class="commentListText">편리하고 빠른 예약으로 즐길수 있어서 최고입니다</div><div class="show-hide-comment dn"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAOCAYAAAA1+Nx+AAAAAXNSR0IArs4c6QAAAYBJREFUOBG1UltKw1AQnUk+rIruSFGkL61VF+EGTOkiqvXfH7egQqWmrQgK4iq6COvzIxnPCb0StekLvDDcyZ3zuDO5Iv+8dFr9YsNKkciZqqipHPZqGk7DncqgcGJlM7lALFAUJp+Ig05N25NMJhrw5rHKJcUh+kxB5Ks08Uz2w7rejDMZa5BvWMFEriCQQwzEl0IiFkkH+wriAwJ73brye+TyRp7iEGPJp8U9X0q9QJ8YzAEZIHLEEJulM9Ig37St2IY3V3nBLcudQB+dCHOeCWo0IZYcV0/vf0ZUbNpmFMu1mCxizq+4bTk80oc0yeXFU1uLI2njnyzD7N33ZCcM9M7Vuf/ooHRsGyC0nDgMtrPESWaNGF6EHHKpwZpb3waY4zreeQszXUJbb75IBc/w3gGzdmKIJYdcalDL4ZMRpVslEGOp/G7VEbL2rNEmHaC1czdHPMXqrOI0JUc92eW/oBY1eZ4YoLUu8j4B3UBvWZhnkYtxVcHtDzXnkZmN8wVS06dlIL2zIQAAAABJRU5ErkJggg=="data-src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAOCAYAAAA1+Nx+AAAAAXNSR0IArs4c6QAAAYBJREFUOBG1UltKw1AQnUk+rIruSFGkL61VF+EGTOkiqvXfH7egQqWmrQgK4iq6COvzIxnPCb0StekLvDDcyZ3zuDO5Iv+8dFr9YsNKkciZqqipHPZqGk7DncqgcGJlM7lALFAUJp+Ig05N25NMJhrw5rHKJcUh+kxB5Ks08Uz2w7rejDMZa5BvWMFEriCQQwzEl0IiFkkH+wriAwJ73brye+TyRp7iEGPJp8U9X0q9QJ8YzAEZIHLEEJulM9Ig37St2IY3V3nBLcudQB+dCHOeCWo0IZYcV0/vf0ZUbNpmFMu1mCxizq+4bTk80oc0yeXFU1uLI2njnyzD7N33ZCcM9M7Vuf/ooHRsGyC0nDgMtrPESWaNGF6EHHKpwZpb3waY4zreeQszXUJbb75IBc/w3gGzdmKIJYdcalDL4ZMRpVslEGOp/G7VEbL2rNEmHaC1czdHPMXqrOI0JUc92eW/oBY1eZ4YoLUu8j4B3UBvWZhnkYtxVcHtDzXnkZmN8wVS06dlIL2zIQAAAABJRU5ErkJggg=="></div></div>
							</div>
						</div>
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
			</section>
		</div>
	</div>
</div> -->


<div class="review-writeContainer">
	<ul class="review-write-list">
		<div class="review-write-form">
			<h2 class="title">리뷰작성</h2>
			
			<li class="review-write-detail">
			
				<div class="review-write-user">
					<a style="color: rgb(15, 41, 77); text-decoration: none;">
						<img class="review-write-userImg" alt="user_icon" width="50" height="50" src="/nadri/repository/img/member/defaultImg.png">
					</a>
					<div class="review-write-userInfo">
						<div class="reivew-write-userName">
							로그인해주세요<!-- nickName -->
						</div><!-- reivew-write-userName -->
					</div><!-- review-write-userInfo -->
				</div><!-- review-write-user -->
				
				<div class="review-write-content">
					<form id="pop_review_writeForm">
						<input type="hidden" id="main_seq" name="main_seq" value="99">
						<input type="hidden" id="content_seq" name="content_seq" value="5"/>
						<input type="hidden" id="activity_seq" name="activity_seq" value="${param.activity_seq }"/>
						<input type="hidden" id="member_seq" name="member_seq" value="${member_seq }"/>
						<!-- 평점 -->
						<div class="review-write-wrap">
						    <div class="review-write-selectScore">
						    	<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
									<input type="radio" class="btn-check" name="activity_review_score" id="btnRadio5" value=5 checked>
									<label class="score btn btn-outline-primary" for="btnRadio5">5점</label>
									
									<input type="radio" class="btn-check" name="activity_review_score" id="btnRadio4" value=4 >
									<label class="score btn btn-outline-primary" for="btnRadio4">4점</label>
										
									<input type="radio" class="btn-check" name="activity_review_score" id="btnRadio3" value=3 >
									<label class="score btn btn-outline-primary" for="btnRadio3">3점</label>
									  
									<input type="radio" class="btn-check" name="activity_review_score" id="btnRadio2" value=2 >
									<label class="score btn btn-outline-primary" for="btnRadio2">2점</label>
									  
									<input type="radio" class="btn-check" name="activity_review_score" id="btnRadio1" value=1 >
									<label class="score btn btn-outline-primary" for="btnRadio1">1점</label>
								</div>
							</div><!-- review-write-selectScore -->
						</div>
						
						<!-- 내용 -->
						<div class="review-write-wrap">
							<div class="input-group">
							  <span class="input-group-text">내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</span>
							  <textarea class="form-control" name="activity_review_content" aria-label="With textarea" style="resize: none;"></textarea>
							</div>
						</div>
						
						<!-- 등록버튼 -->
						
						<button id="act_review_writeBtn" type="button" class="btn btn-primary">등록</button>
						<button type="reset" class="btn btn-primary">다시작성</button>
						
					</form>
				</div><!-- review-write-content -->
				
			</li><!-- review-write-detail -->
		</div><!-- review-write-form -->
	</ul><!-- review-write-list -->
</div><!-- review-writeContainer -->

<div id="detailComment" class="productdetail-comment-inner-width">
	<div class="commentContainer border-container">
		<div id="test" class="commentlist-contaier">
			<section class="productdetail-commentlist-container">
				<h2 class="title">리뷰
					<em class="commentCount">
						(total_cnt_act_review)
					</em>
				</h2>
				<div>
					<span class="list-score">
						<em class="list-good-comment">
							3<!-- total_avg_act_review -->
						</em>
							/5
					</span>
					<span class="list-label"></span>
				</div>
				<p>
					<span id="ibu_dtlopg_comment_filter_all_1" class="filter-all">
						전체
					</span>
				</p>
				<div class="comment-list-box">
					<div class="title-ffsd">
						리뷰
					</div>
					<div id="append-startingPoint" class="append-startingPoint">
<!-- 추가되는항목시점 -->
						<div class="comment-list">	
							<div class="comment-list-item">
								<div>
									<div class="user-image-position">
										<img src="https://ak-d.tripcdn.com/images/Z80o180000013ulur1D76.jpg" >
									</div>
									<div class="user-commentinfo-position">
										<div>
											<p class="user-comment-name">
												nickName
											</p>
										</div>
										<div>
											<span class="commentScore">
												<em class="good-comment">
													3<!-- score_act_review -->
												</em>
												/5
											</span>
											<span class="commentDate">
												act_review_date
											</span>
										</div>
									</div>
								</div>
								<div class="userinfo-position-left comment-container">
									<div class="text-img">
										<div class="commentListText">
											편리하고 빠른 예약으로 즐길수 있어서 최고입니다
										</div>
										<div class="show-hide-comment dn">
											<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAOCAYAAAA1+Nx+AAAAAXNSR0IArs4c6QAAAYBJREFUOBG1UltKw1AQnUk+rIruSFGkL61VF+EGTOkiqvXfH7egQqWmrQgK4iq6COvzIxnPCb0StekLvDDcyZ3zuDO5Iv+8dFr9YsNKkciZqqipHPZqGk7DncqgcGJlM7lALFAUJp+Ig05N25NMJhrw5rHKJcUh+kxB5Ks08Uz2w7rejDMZa5BvWMFEriCQQwzEl0IiFkkH+wriAwJ73brye+TyRp7iEGPJp8U9X0q9QJ8YzAEZIHLEEJulM9Ig37St2IY3V3nBLcudQB+dCHOeCWo0IZYcV0/vf0ZUbNpmFMu1mCxizq+4bTk80oc0yeXFU1uLI2njnyzD7N33ZCcM9M7Vuf/ooHRsGyC0nDgMtrPESWaNGF6EHHKpwZpb3waY4zreeQszXUJbb75IBc/w3gGzdmKIJYdcalDL4ZMRpVslEGOp/G7VEbL2rNEmHaC1czdHPMXqrOI0JUc92eW/oBY1eZ4YoLUu8j4B3UBvWZhnkYtxVcHtDzXnkZmN8wVS06dlIL2zIQAAAABJRU5ErkJggg=="data-src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAOCAYAAAA1+Nx+AAAAAXNSR0IArs4c6QAAAYBJREFUOBG1UltKw1AQnUk+rIruSFGkL61VF+EGTOkiqvXfH7egQqWmrQgK4iq6COvzIxnPCb0StekLvDDcyZ3zuDO5Iv+8dFr9YsNKkciZqqipHPZqGk7DncqgcGJlM7lALFAUJp+Ig05N25NMJhrw5rHKJcUh+kxB5Ks08Uz2w7rejDMZa5BvWMFEriCQQwzEl0IiFkkH+wriAwJ73brye+TyRp7iEGPJp8U9X0q9QJ8YzAEZIHLEEJulM9Ig37St2IY3V3nBLcudQB+dCHOeCWo0IZYcV0/vf0ZUbNpmFMu1mCxizq+4bTk80oc0yeXFU1uLI2njnyzD7N33ZCcM9M7Vuf/ooHRsGyC0nDgMtrPESWaNGF6EHHKpwZpb3waY4zreeQszXUJbb75IBc/w3gGzdmKIJYdcalDL4ZMRpVslEGOp/G7VEbL2rNEmHaC1czdHPMXqrOI0JUc92eW/oBY1eZ4YoLUu8j4B3UBvWZhnkYtxVcHtDzXnkZmN8wVS06dlIL2zIQAAAABJRU5ErkJggg==">
										</div>
									</div>
								</div>
							</div>
						</div>
<!-- 추가되는항목종점 -->
					</div>
					<!-- 페이징처리 -->
	    			<div id="page-selection"></div>
				</div>
			</section>
		</div>
	</div>
</div>