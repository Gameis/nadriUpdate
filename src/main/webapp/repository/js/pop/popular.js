//리뷰태그 클릭시 이동
$('.pop-review-reviewIcon #goReview').click(function(){
    // 이동 버튼을 클릭시 pre 태그로 스크롤의 위치가 이동되도록 한다.
 
    // 1. pre태그의 위치를 가지고 있는 객체를 얻어온다. => offset 객체
    var target = $("#reviewContainer").offset();

    // offset은 절대 위치를 가져온다. offset.top을 통해 상단의 좌표를 가져온다.
    // position은 부모를 기준으로한 상대위치를 가져온다.
    $("html").animate({scrollTop:target.top},400);
});

//like 버튼 클릭
$('.favorite-wrap').click(function(){
	$('.fa-heart').toggleClass('checked');
});

function resetValue(){
	$('#pageNum').val('');
    $('#searchType').val('');
    $('#isDesc').val('');
}

function getLocation(){
	var member_seq = $('#member_seq').val();
	
	//member_seq가 있을때
		//지도API
		$.ajax({
			url: '/nadri/popular/getLocation',
			type: 'get',
			data: 'pop_seq='+$('#pop_seq').val(),
			success: function(data){
				
				$('#popularLocation_name h1').text(data.pop_name);
				$('.pop-businesstime .one-line .field').text(data.pop_businesstime);
				$('.pop-tourismtime .one-line .field').text(data.pop_tourismtime);
				$('.pop-address-map .one-line .field').text(data.address_name);
				$('.pop-call .one-line .field').text(data.pop_call);
				$('title').text(data.pop_name+'정보 및 후기 | 트립닷컴');
				$('.detailInfo-content').text(data.detailInfo);
				$('.areaPathItem:eq(3) a').text(data.main_name);
				$('.areaPathItem:eq(4) a').text(data.pop_name);
				

				//카카오맵 API
				let location1 = data.pop_name;
				let map_x = data.map_y;
				let map_y = data.map_x;
				
				$('.more-btn a').prop('href', 'https://map.kakao.com/link/map/'+location1+','+map_x+','+map_y);

				let mapContainer = document.getElementById('kakaoMap'), // 지도를 표시할 div 
		          mapOption = {
		              center: new kakao.maps.LatLng(map_x, map_y), // 지도의 중심좌표
		              level: 3, // 지도의 확대 레벨
		              mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
		          }; 

		      // 지도를 생성한다 
		      let map = new kakao.maps.Map(mapContainer, mapOption);

				//마커가 표시될 위치입니다 
				let markerPosition  = new kakao.maps.LatLng(map_x, map_y); 

				//마커를 생성합니다
				let marker = new kakao.maps.Marker({
				position: markerPosition
				});

				//마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);
				let iwContent = '<div style="padding:5px;">'+location1+' <br><a href="https://map.kakao.com/link/map/'+location1+','+map_x+','+map_y+'" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/'+location1+','+map_x+','+map_y+'" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
				iwPosition = new kakao.maps.LatLng(map_x, map_y); //인포윈도우 표시 위치입니다
				iwRemoveable = true;


				//인포윈도우를 생성합니다
				let infowindow = new kakao.maps.InfoWindow({
				position : iwPosition, 
				content : iwContent,
				removable : iwRemoveable
				});

				// 마커에 클릭이벤트를 등록합니다
				kakao.maps.event.addListener(marker, 'click', function() {
				      // 마커 위에 인포윈도우를 표시합니다
				      infowindow.open(map, marker);  
				});
				
			},error: function(err){
				console.log(err);
			}
		});
	}
	
	function removeReviewList() {
	//review list 전체 삭제
		
		var list = document.getElementById("review-comment-detail");
		while(list.hasChildNodes()){
			list.removeChild(list.firstChild);
		}
	}

	function getCountView(){
		//평점,평점내용,긍정,부정,리뷰수 출력
		$.ajax({
			url: '/nadri/popular/getCountView',
			type: 'get',
			data: 'pop_seq=' + $('#pop_seq').val(),
			success: function(data){
				
				var avg_score_content = null;
				const avg_score = parseFloat($.trim(data.avg_score));
				const total_negativeReview = parseFloat($.trim(data.total_negativeReview));
				const total_review = parseFloat($.trim(data.total_review));
				const total_positiveReview = parseFloat($.trim(data.total_positiveReview));
				const total_photo = parseFloat($.trim(data.total_photo));

				if(avg_score<=1){
					avg_score_content = '최악이에요';
				}else if(avg_score<=2){
					avg_score_content = '보통이에요';
				}else if(avg_score<=3){
					avg_score_content = '좋아요!';
				}else if(avg_score<=4){
					avg_score_content = '최고에요!';
				}else if(avg_score<=5){
					avg_score_content = '완벽해요!';
				}

				$('.pop-score .pop-score-avg').text(data.avg_score);
				$('.pop-review-reviewIcon div').text(data.total_review+'건의 리뷰');
				$('.switch-container .switch-sort .sort-get-score').text(data.avg_score);
				$('.switch-container .switch-sort .sort-get-catergory').text(avg_score_content);
				$('.switch-list-container .btn-group .btn-outline-primary:eq(0)').text('모두보기 ('+(total_review || 0)+')');
				$('.switch-list-container .btn-group .btn-outline-primary:eq(2)').text('긍정적 ('+(total_positiveReview || 0)+')');
				$('.switch-list-container .btn-group .btn-outline-primary:eq(3)').text('부정적 ('+(total_negativeReview || 0)+')');
				$('.switch-list-container .btn-group .btn-outline-primary:eq(4)').text('사진 ('+(total_photo || 0)+')');

			},error: function(err){
				console.log(err);
			}
		});
	}

	
	function getPopImg(){
		//메인이미지
		$.ajax({
			url: '/nadri/popular/getPopImg',
			type: 'post',
			data: 'pop_seq='+$('#pop_seq').val(),
			success: function(data){
				 
				//이미지 데이터 넣기
				$('#carousel-item0').prop('src', '/nadri/repository/img/' + data[0].img_path + '/popmain/' + data[0].img_name);
				$('#carousel-item1').prop('src', '/nadri/repository/img/' + data[1].img_path + '/popmain/' + data[1].img_name);
				$('#carousel-item2').prop('src', '/nadri/repository/img/' + data[2].img_path + '/popmain/' + data[2].img_name);
				$('#carousel-item3').prop('src', '/nadri/repository/img/' + data[3].img_path + '/popmain/' + data[3].img_name);
				
				$('#col-img0').prop('src', '/nadri/repository/img/' + data[0].img_path + '/popmain/' + data[0].img_name);
				$('#col-img1').prop('src', '/nadri/repository/img/' + data[1].img_path + '/popmain/' + data[1].img_name);
				$('#col-img2').prop('src', '/nadri/repository/img/' + data[2].img_path + '/popmain/' + data[2].img_name);
				$('#col-img3').prop('src', '/nadri/repository/img/' + data[3].img_path + '/popmain/' + data[3].img_name);
				
				//이미지 클릭시 보여주기
				$('.row-cols-4').find('#col-img0').click(function() {
					$('.active img').prop('src', '/nadri/repository/img/' + data[0].img_path + '/popmain/' + data[0].img_name);
				});
				$('.row-cols-4').find('#col-img1').click(function() {
					$('.active img').prop('src', '/nadri/repository/img/' + data[1].img_path + '/popmain/' + data[1].img_name);
				});
				$('.row-cols-4').find('#col-img2').click(function() {
					$('.active img').prop('src', '/nadri/repository/img/' + data[2].img_path + '/popmain/' + data[2].img_name);
				});
				$('.row-cols-4').find('#col-img3').click(function() {
                    $('.active img').prop('src', '/nadri/repository/img/' + data[3].img_path + '/popmain/' + data[3].img_name);
				});


			},
			error: function(err){
				console.log(err);
			}
		});
	}

    function getReviewList(){
        //모든 리뷰리스트 출력
        var pageNum = $.trim($('#pageNum').val() || 0);
        var searchType = $.trim($('#searchType').val() || '');
        var isDesc = $.trim($('#isDesc').val() || '');
        var pop_seq = $.trim($('#pop_seq').val() || '');
        //리스트삭제
        removeReviewList();
        $.ajax({
            url: '/nadri/popular/getReviewContent',
            type: 'get',
            data: 'pageNum='+pageNum+'&searchType='+searchType+'&isDesc='+isDesc+'&pop_seq='+pop_seq,
            success: function(data){
                const list = data.list;
                const contentList = data.contentList;
				const photoList = data.photoList;				
                                
                if(searchType=='IMAGE'){//사진버튼 클릭시출력부
	                for(var i = 0; i < contentList.length; i++){
						var profileImg = $.trim(data.contentList[i].profileImg || "");
						if(profileImg == ""){
							profileImg = "defaultImg.png"
						}
						
	                    var private_score_content = null;
	                    const private_score = parseFloat($.trim(contentList[i].review_score));
	                    var img_path = ($.trim(photoList[i].imgList[0].img_path) || "");
	                    var image_name1='';
	                    var image_name2='';
	                    var image_name3='';
	                    var image_name4='';
	                    var image_name5='';
	                    var image_name6='';
	                    var image_name7='';
	                    var noImge = "https://www.publicdomainpictures.net/pictures/30000/velka/plain-white-background.jpg";
	                    
	                    //content내용 뽑기
	                    if(private_score<=1){
	                        private_score_content = '최악이에요';
	                    }else if(private_score<=2){
	                        private_score_content = '보통이에요';
	                    }else if(private_score<=3){
	                        private_score_content = '좋아요!';
	                    }else if(private_score<=4){
	                        private_score_content = '최고에요!';
	                    }else if(private_score<=5){
	                        private_score_content = '완벽해요!';
	                    }
	                    
	                    //img_name 빈값 정리
							if(data.photoList[i].imgList[1] == undefined && data.photoList[i].imgList[0].img_name == 'noImg.jpg'){
	                            image_name1 = noImge;
	                            image_name2 = noImge;
	                            image_name3 = noImge;
	                            image_name4 = noImge;
	                            image_name5 = noImge;
	                            image_name6 = noImge;
	                            image_name7 = noImge;
	                        }else if(data.photoList[i].imgList[1] == undefined && data.photoList[i].imgList[0].img_name != 'noImg.jpg'){
	                        	image_name1 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(data.photoList[i].imgList[0].img_name);
	                            image_name2 = noImge;
	                            image_name3 = noImge;
	                            image_name4 = noImge;
	                            image_name5 = noImge;
	                            image_name6 = noImge;
	                            image_name7 = noImge;
	                        }
							
							
	                        if(data.photoList[i].imgList[1] != undefined && data.photoList[i].imgList[1].img_name != 'noImg.jpg'){
	                            image_name1 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(data.photoList[i].imgList[0].img_name);
	                            image_name2 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(data.photoList[i].imgList[1].img_name);
	                            image_name3 = noImge;
	                            image_name4 = noImge;
	                            image_name5 = noImge;
	                            image_name6 = noImge;
	                            image_name7 = noImge;
	                        }
	                        if(data.photoList[i].imgList[2] != undefined && data.photoList[i].imgList[2].img_name != 'noImg.jpg'){
	                            image_name1 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(data.photoList[i].imgList[0].img_name);
	                            image_name2 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(data.photoList[i].imgList[1].img_name);
	                            image_name3 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(data.photoList[i].imgList[2].img_name);
	                            image_name4 = noImge;
	                            image_name5 = noImge;
	                            image_name6 = noImge;
	                            image_name7 = noImge;
	                        }
	                        if(data.photoList[i].imgList[3] != undefined && data.photoList[i].imgList[3].img_name != 'noImg.jpg'){
	                            image_name1 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(data.photoList[i].imgList[0].img_name);
	                            image_name2 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(data.photoList[i].imgList[1].img_name);
	                            image_name3 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(data.photoList[i].imgList[2].img_name);
	                            image_name4 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(data.photoList[i].imgList[3].img_name);
	                            image_name5 = noImge;
	                            image_name6 = noImge;
	                            image_name7 = noImge;
	                        }
	                        if(data.photoList[i].imgList[4] != undefined && data.photoList[i].imgList[4].img_name != 'noImg.jpg'){
	                            image_name1 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(data.photoList[i].imgList[0].img_name);
	                            image_name2 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(data.photoList[i].imgList[1].img_name);
	                            image_name3 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(data.photoList[i].imgList[2].img_name);
	                            image_name4 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(data.photoList[i].imgList[3].img_name);
	                            image_name5 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(data.photoList[i].imgList[4].img_name);
	                            image_name6 = noImge;
	                            image_name7 = noImge;
	                        }
	                        if(data.photoList[i].imgList[5] != undefined && data.photoList[i].imgList[5].img_name != 'noImg.jpg'){
	                            image_name1 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(data.photoList[i].imgList[0].img_name);
	                            image_name2 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(data.photoList[i].imgList[1].img_name);
	                            image_name3 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(data.photoList[i].imgList[2].img_name);
	                            image_name4 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(data.photoList[i].imgList[3].img_name);
	                            image_name5 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(data.photoList[i].imgList[4].img_name);
	                            image_name6 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(data.photoList[i].imgList[5].img_name);
	                            image_name7 = noImge;
	                        }
	                        if(data.photoList[i].imgList[6] != undefined && data.photoList[i].imgList[6].img_name != 'noImg.jpg'){
	                            image_name1 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(data.photoList[i].imgList[0].img_name);
	                            image_name2 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(data.photoList[i].imgList[1].img_name);
	                            image_name3 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(data.photoList[i].imgList[2].img_name);
	                            image_name4 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(data.photoList[i].imgList[3].img_name);
	                            image_name5 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(data.photoList[i].imgList[4].img_name);
	                            image_name6 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(data.photoList[i].imgList[5].img_name);
	                            image_name7 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(data.photoList[i].imgList[6].img_name);
	                        }
	                    
	                    
	                    ($('<li/>', {
	                        class: "reviewCommentDetail",
	                        id: "reviewCommentDetail",
	                        style: "border-top: 1px solid rgb(218, 223, 230)"
	                    }).append($('<div/>', {
	                        class: "review-user-view"
	                    }).append($('<a/>',{
	                        style:"color: rgb(15, 41, 77"
	                    }).append($('<img/>',{
	                        class: "review-user-img",
	                        alt: "user_icon",
	                        width: "50",
	                        heigth: "50",
	                        src: "/nadri/repository/img/tripmember/"+profileImg
	                    }))).append($('<div/>',{
	                        class:"review-user-info"
	                    }).append($('<div/>',{
	                        class:"review-user-name",
	                        text:contentList[i].nickname
	                    })))).append($('<div/>',{
	                        class: "review-content-detail"
	                    }).append($('<div/>',{
	                        class:"review-switch-sort"
	                    }).append($('<span/>',{
	                        class:"review-score",
	                        text:contentList[i].review_score
	                    })).append($('<span/>',{
	                        class:"review-all-score"
	                    })).append($('<span/>',{
	                        class:"review-score-name",
	                        text:private_score_content
	                    }))).append($('<div/>',{
	                        class:"review-content-view"
	                    }).append($('<p/>', {
	                        class:"review-content-text",
	                        text:contentList[i].review_content
	                    }))).append($('<div/>',{
	                        class:"review-content-photolist"
	                    }).append($('<div/>',{
	                        class:"review-content-photowall"
	                    }).append($('<img/>',{
	                        alt:"review-content-photowall",
	                        id:"image_name1",
	                        src:image_name1
	                    })).append($('<img/>',{
	                        alt:"review-content-photowall",
	                        id:"image_name2",
	                        src:image_name2
	                    })).append($('<img/>',{
	                        alt:"review-content-photowall",
	                        id:"image_name3",
	                        src:image_name3
	                    })).append($('<img/>',{
	                        alt:"review-content-photowall",
	                        id:"image_name4",
	                        src:image_name4
	                    })).append($('<img/>',{
	                        alt:"review-content-photowall",
	                        id:"image_name5",
	                        src:image_name5
	                    })).append($('<img/>',{
	                        alt:"review-content-photowall",
	                        id:"image_name6",
	                        src:image_name6
	                    })).append($('<img/>',{
	                        alt:"review-content-photowall",
	                        id:"image_name7",
	                        src:image_name7
	                    })))).append($('<div/>',{
	                        class:"review-content-date"
	                    }).append($('<span/>',{
	                        class:"review-content-time"
	                    }).append($('<span/>',{
	                        text:"작성일 : "+contentList[i].review_logtime
	                    })))))).appendTo($('#review-comment-detail'));
	                    
	                }//for
                }else{//모두보기, 최신순, 긍정, 부정 클릭시출력부
 	 				for(var i = 0; i < data.list.length; i++){
 	 					var profileImg = $.trim(data.list[i].profileImg || "");
						if(profileImg == ""){
							profileImg = "defaultImg.png"
						}
	                    var private_score_content = null;
	                    const private_score = parseFloat($.trim(list[i].review_score));
	                    var img_path = ($.trim(list[i].imgList[0].img_path));
	                    var image_name1='';
	                    var image_name2='';
	                    var image_name3='';
	                    var image_name4='';
	                    var image_name5='';
	                    var image_name6='';
	                    var image_name7='';
	                    var noImge = "https://www.publicdomainpictures.net/pictures/30000/velka/plain-white-background.jpg";
	                    
	                    
	                    //content내용 뽑기
	                    if(private_score<=1){
	                        private_score_content = '최악이에요';
	                    }else if(private_score<=2){
	                        private_score_content = '보통이에요';
	                    }else if(private_score<=3){
	                        private_score_content = '좋아요!';
	                    }else if(private_score<=4){
	                        private_score_content = '최고에요!';
	                    }else if(private_score<=5){
	                        private_score_content = '완벽해요!';
	                    }
	                    
	                    //img_name 빈값 정리
	          			
		          			if(list[i].imgList[1] == undefined && list[i].imgList[0].img_name == 'noImg.jpg'){
	                            image_name1 = noImge;
	                            image_name2 = noImge;
	                            image_name3 = noImge;
	                            image_name4 = noImge;
	                            image_name5 = noImge;
	                            image_name6 = noImge;
	                            image_name7 = noImge;
	                        }else if(list[i].imgList[1] == undefined && list[i].imgList[0].img_name != 'noImg.jpg'){
	                        	image_name1 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(list[i].imgList[0].img_name);
	                            image_name2 = noImge;
	                            image_name3 = noImge;
	                            image_name4 = noImge;
	                            image_name5 = noImge;
	                            image_name6 = noImge;
	                            image_name7 = noImge;
	                        }
	                        
	                        
	                        if(list[i].imgList[1] != undefined && list[i].imgList[1].img_name != "noImg.jpg"){
	                            image_name1 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(list[i].imgList[0].img_name);
	                            image_name2 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(list[i].imgList[1].img_name);
	                            image_name3 = noImge;
	                            image_name4 = noImge;
	                            image_name5 = noImge;
	                            image_name6 = noImge;
	                            image_name7 = noImge;
	                        }
	                        if(list[i].imgList[2] != undefined && list[i].imgList[2].img_name != "noImg.jpg"){
	                            image_name1 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(list[i].imgList[0].img_name);
	                            image_name2 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(list[i].imgList[1].img_name);
	                            image_name3 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(list[i].imgList[2].img_name);
	                            image_name4 = noImge;
	                            image_name5 = noImge;
	                            image_name6 = noImge;
	                            image_name7 = noImge;
	                        }
	                        if(list[i].imgList[3] != undefined && list[i].imgList[3].img_name != "noImg.jpg"){
	                            image_name1 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(list[i].imgList[0].img_name);
	                            image_name2 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(list[i].imgList[1].img_name);
	                            image_name3 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(list[i].imgList[2].img_name);
	                            image_name4 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(list[i].imgList[3].img_name);
	                            image_name5 = noImge;
	                            image_name6 = noImge;
	                            image_name7 = noImge;
	                        }
	                        if(list[i].imgList[4] != undefined && list[i].imgList[4].img_name != "noImg.jpg"){
	                            image_name1 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(list[i].imgList[0].img_name);
	                            image_name2 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(list[i].imgList[1].img_name);
	                            image_name3 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(list[i].imgList[2].img_name);
	                            image_name4 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(list[i].imgList[3].img_name);
	                            image_name5 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(list[i].imgList[4].img_name);
	                            image_name6 = noImge;
	                            image_name7 = noImge;
	                        }
	                        if(list[i].imgList[5] != undefined && list[i].imgList[5].img_name != "noImg.jpg"){
	                            image_name1 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(list[i].imgList[0].img_name);
	                            image_name2 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(list[i].imgList[1].img_name);
	                            image_name3 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(list[i].imgList[2].img_name);
	                            image_name4 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(list[i].imgList[3].img_name);
	                            image_name5 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(list[i].imgList[4].img_name);
	                            image_name6 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(list[i].imgList[5].img_name);
	                            image_name7 = noImge;
	                        }
	                        if(list[i].imgList[6] != undefined && list[i].imgList[6].img_name != "noImg.jpg"){
	                            image_name1 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(list[i].imgList[0].img_name);
	                            image_name2 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(list[i].imgList[1].img_name);
	                            image_name3 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(list[i].imgList[2].img_name);
	                            image_name4 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(list[i].imgList[3].img_name);
	                            image_name5 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(list[i].imgList[4].img_name);
	                            image_name6 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(list[i].imgList[5].img_name);
	                            image_name7 = "/nadri/repository/img/popular/"+img_path+"/"+$.trim(list[i].imgList[6].img_name);
	                        }
	                    
	                    
	                    ($('<li/>', {
	                        class: "reviewCommentDetail",
	                        id: "reviewCommentDetail",
	                        style: "border-top: 1px solid rgb(218, 223, 230)"
	                    }).append($('<div/>', {
	                        class: "review-user-view"
	                    }).append($('<a/>',{
	                        style:"color: rgb(15, 41, 77"
	                    }).append($('<img/>',{
	                        class: "review-user-img",
	                        alt: "user_icon",
	                        width: "50",
	                        heigth: "50",
	                        src: "/nadri/repository/img/tripmember/"+profileImg
	                    }))).append($('<div/>',{
	                        class:"review-user-info"
	                    }).append($('<div/>',{
	                        class:"review-user-name",
	                        text:list[i].nickname
	                    })))).append($('<div/>',{
	                        class: "review-content-detail"
	                    }).append($('<div/>',{
	                        class:"review-switch-sort"
	                    }).append($('<span/>',{
	                        class:"review-score",
	                        text:list[i].review_score
	                    })).append($('<span/>',{
	                        class:"review-all-score"
	                    })).append($('<span/>',{
	                        class:"review-score-name",
	                        text:private_score_content
	                    }))).append($('<div/>',{
	                        class:"review-content-view"
	                    }).append($('<p/>', {
	                        class:"review-content-text",
	                        text:list[i].review_content
	                    }))).append($('<div/>',{
	                        class:"review-content-photolist"
	                    }).append($('<div/>',{
	                        class:"review-content-photowall"
	                    }).append($('<img/>',{
	                        alt:"review-content-photowall",
	                        id:"image_name1",
	                        src:image_name1
	                    })).append($('<img/>',{
	                        alt:"review-content-photowall",
	                        id:"image_name2",
	                        src:image_name2
	                    })).append($('<img/>',{
	                        alt:"review-content-photowall",
	                        id:"image_name3",
	                        src:image_name3
	                    })).append($('<img/>',{
	                        alt:"review-content-photowall",
	                        id:"image_name4",
	                        src:image_name4
	                    })).append($('<img/>',{
	                        alt:"review-content-photowall",
	                        id:"image_name5",
	                        src:image_name5
	                    })).append($('<img/>',{
	                        alt:"review-content-photowall",
	                        id:"image_name6",
	                        src:image_name6
	                    })).append($('<img/>',{
	                        alt:"review-content-photowall",
	                        id:"image_name7",
	                        src:image_name7
	                    })))).append($('<div/>',{
	                        class:"review-content-date"
	                    }).append($('<span/>',{
	                        class:"review-content-time"
	                    }).append($('<span/>',{
	                        text:"작성일 : "+list[i].review_logtime
	                    })))))).appendTo($('#review-comment-detail'));
	            	}//for       
                }//if
                
                $('#page-selection').bootpag({
                	total: data.total,
                	page: pageNum,
                	maxVisible: Math.ceil(data.total / 5)
                });
				
            }, error: function(err){
                console.log(err);
            }
        });
    }
    
	function getUserInfo(){
		$.ajax({
			url: '/nadri/popular/getUserInfo',
			type: 'post',
			success: function(data){
				var nickName = $.trim(data.nickName || "");
				
				
				if(nickName != ""){
					$('.reivew-write-userName').text(nickName);
					$('.review-write-userImg').prop("src", "/nadri/repository/img/tripmember/"+data.profileImg);
				}else{
					$('.reivew-write-userName').text("로그인해주세요");
					$('.review-write-userImg').prop("src", "/nadri/repository/img/tripmember/defaultImg.png");
				}
				
			}, error: function(err){
				console.log(err);
			}
		});
	}
	
	function locationhref(moment_seq) {
	location.href="/nadri/tripmoment/tripmomentView?moment_seq=" + moment_seq 
	}
	
	function getTripMoment(){
		$.ajax({
			url : '/nadri/tripmoment/onTripmoment',
			type : 'get',
			success : function(data) {
					var count = -1;
			        var momentCount = 1;	

				$.each(data, function(index, items){
					if(index % 4 == 0) {

			            if(index == 0) {
			              $('<div/>', {
			                class: 'carousel-item active'
			              }).append($('<div/>', {
			                class: 'card-group'
			              })).appendTo($('#moment_carousel_inner'));
			            }else {
			              $('<div/>', {
			                class: 'carousel-item'
			              }).append($('<div/>', {
			                class: 'card-group'
			              })).appendTo($('#moment_carousel_inner'));
			            }            
			            count++;
			          }
					
					$('<div>', {
						class: 'cardstyle card index_card_con',
						onclick : 'locationhref('+ items.moment_seq + ')'
					}).append($('<div>', {
						style: 'padding-bottom: 106%', 
						class: 'slide_img'
					}).append($('<div>', {
						class: 'img'
					}).append($('<img>', {
						src: '/nadri/repository/img/' + items.img_path + '/' + items.img_name,
						class: 'card-img-top',
						alt: '트립1'
					})))).append($('<div>', {
						class: 'bottom_con'
					}).append($('<div>', {
						style: '-webkit-box-orient: vertical', 
						class: 'bottom_desc',
						text: items.moment_content
					})).append($('<div>', {
						class: 'bottom_user_left'
					}).append($('<i>', {
						class: 'bi bi-person-circle'
					})).append($('<span>', {
						text: '개복치'
					}))).append($('<div>', {
						class: 'bottom_user_right'
					}).append($('<img>', {
						src: "/nadri/repository/img/main/thumb.png"
					})).append($('<span>', {
						text : '34'
					})))).appendTo($('#moment_carousel_inner .card-group:eq(' + count + ')'));
				})//each
				
			},
			error : function(err) {
			}
		});
	}
    