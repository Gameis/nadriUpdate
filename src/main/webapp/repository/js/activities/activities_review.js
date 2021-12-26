//상단 리뷰개수 클릭시 하단으로 애니메이션 이동
$('.comment-sold .comment-count').click(function(){
    // 이동 버튼을 클릭시 pre 태그로 스크롤의 위치가 이동되도록 한다.
 
    // 1. pre태그의 위치를 가지고 있는 객체를 얻어온다. => offset 객체
    var target = $(".review-writeContainer").offset();

    // offset은 절대 위치를 가져온다. offset.top을 통해 상단의 좌표를 가져온다.
    // position은 부모를 기준으로한 상대위치를 가져온다.
    $("html").animate({scrollTop:target.top},400);
});

//리뷰작성버튼 클릭
$('#act_review_writeBtn').click(function(){

	if($.trim($('#member_seq').val() || "") == ""){
		alert('로그인 후 이용 가능합니다.');
		return
	}else if($('.form-control').val() == ""){
		alert('내용을 입력해주세요.');
		return
	}else{
	
		$.ajax({
			url: '/nadri/activities/actReviewWrite',
			type: 'get',
			data: $('#pop_review_writeForm').serialize(),
			success: function(data){
				getReviewList();
				getActReviewCnt();
			},
			error: function(err){
				console.log(err);
			}
			
		});
	}//if
});

function removeReviewList() {
//review list 전체 삭제
	
	var list = document.getElementById("append-startingPoint");
	while(list.hasChildNodes()){
		list.removeChild(list.firstChild);
	}
}

//페이징 처리
function pagination(){
	 // init bootpag
    $('#page-selection').bootpag({
	    total: 1,          // total pages
	    page: 1,            // default page
	    leaps: true         // next/prev leaps through maxVisible
	}).on("page", function(event, num){
	    $("#pageNum").val(num);
	    getReviewList();
	});
}

//리뷰수 및 유저정보 가져오기
function getActReviewCnt(){
	var activity_seq=$.trim($('#activity_seq').val() || 0);
	$.ajax({
		url: '/nadri/activities/getActReviewCnt',
		type: 'get',
		data: 'activity_seq='+activity_seq,
		success: function(data){
		
			
			const total_cnt_act_review = parseFloat($.trim(data.reviewCnt.total_cnt_act_review || 0));
			const total_avg_act_review = parseFloat($.trim(data.reviewCnt.total_avg_act_review || 0));
			
			if(data.userInfo != undefined){
				$('.review-write-userImg').prop("src", "/nadri/repository/img/tripmember/"+$.trim(data.userInfo.profileImg));
				$('.review-write-userInfo .reivew-write-userName').text($.trim(data.userInfo.nickName));
			}else{
				$('.review-write-userImg').prop("src", "/nadri/repository/img/tripmember/defaultImg.png");
				$('.review-write-userInfo .reivew-write-userName').text("로그인해주세요");
			}
			
			$('.comment-score .good-comment').text(total_avg_act_review);
			$('.comment-sold .comment-count').text("리뷰 "+total_cnt_act_review+"개");
			$('.productdetail-commentlist-container .title .commentCount').text(total_cnt_act_review);
			$('.list-score .list-good-comment').text(total_avg_act_review);
		}, error: function(err){
			console.log(err);
		}
	});
}

function getReviewList(){
	//모든 리뷰리스트 출력
    var pageNum = $.trim($('#pageNum').val() || 0);
    var activity_seq = $.trim($('#activity_seq').val() || 0);

    //리스트삭제
    removeReviewList();
    
    $.ajax({
        url: '/nadri/activities/getReviewList',
        type: 'get',
        data: 'pageNum='+pageNum+'&activity_seq='+activity_seq,
        success: function(data){
        	
			for(var i = 0; i < data.contentList.length; i++){
				($('<div/>',{
					class:"comment-list"
				}).append($('<div/>',{
					class:"comment-list-item"
				}).append($('<div/>',{

				}).append($('<div/>',{
					class:"user-image-position"
				}).append($('<img/>',{
					src:"/nadri/repository/img/tripmember/"+data.contentList[i].profileImg
				})))).append($('<div/>',{
					class:"user-commentinfo-position"
				}).append($('<div/>',{

				}).append($('<p/>',{
					text:data.contentList[i].nickName
				})))).append($('<div/>',{

				}).append($('<span/>',{
					class:"commentScore",
					text:"/5"
				}).prepend($('<em/>',{
					class:"good-comment",
					text:data.contentList[i].activity_review_score
				})))).append($('<span/>',{
					class:"commentDate"
				}))).append($('<div/>',{
					class:"userinfo-position-left comment-container"
				}).append($('<div/>',{
					class:"text-img"
				}).append($('<div/>',{
					class:"commentListText",
					text:data.contentList[i].activity_review_content
				}))).append($('<div/>',{
					class:"show-hide-comment dn"
				}).append($('<img/>',{
					src:"/nadri/repository/img/tripmember/"+data.contentList[i].profileImg
				}))))).appendTo($('#append-startingPoint'));
            
            
			}//for
            
            $('#page-selection').bootpag({
                	total: data.totalCnt,
                	page: pageNum,
                	maxVisible: Math.ceil(data.totalCnt / 5)
            });
		},error: function(err){
			console.log(err);
		}
		
	});
}

