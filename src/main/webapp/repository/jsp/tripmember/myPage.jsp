<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

    <!-- Bootstrap core CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
 
    <!-- Custom styles for this template -->
<link rel="stylesheet" href="/nadri/repository/css/tripmember/myPage.css">
  </head>
<body>


<main>
	<aside id="left-sidebar">
	  <div class="flex-shrink-0 p-3 bg-white" style="width: 230px;">
	  
	    <a href="/nadri/index.jsp" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
	      <svg class="bi me-2" width="30" height="24"><use xlink:href="#bootstrap"/></svg>
	      <span class="fs-5 fw-semibold">트립닷컴 회원</span>
	    </a>
	    <ul class="list-unstyled ps-0">
	    
	 	      <li class="mb-1">
		        <button class="btn btn-toggle" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true">
		          My 정보
		        </button>
		            
		               
		        <div class="collapse show" id="home-collapse">
		          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
		  
		  		<!--      
		         	<li><a href="#" id="memberInfo" class="link-dark rounded">개인정보확인</a></li>	  		  
		    	  --> 
		            
		          	<li><a href="/nadri/tripmember/getTripmember" class="link-dark rounded">개인정보확인</a></li>
		            	           	           
<!-- 		            <li><a href="/nadri/tripmember/tripWrite" class="link-dark rounded">작성글관리</a></li>
 -->		          
 					<li><a href="/nadri/tripmember/modifyForm" class="link-dark rounded">회원정보수정</a></li>
		            <li><a href="/nadri/tripmember/deleteForm" class="link-dark rounded">회원탈퇴</a></li>        
		          </ul>
		        </div>
		        
		      </li>
	<!-- 			
		      <li class="mb-1">
		        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
		          CSS 구경하기
		        </button>
		        <div class="collapse" id="orders-collapse">
		          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
		            <li><a href="#" class="link-dark rounded">내등급확인</a></li>
		            <li><a href="#" class="link-dark rounded">전체등급확인</a></li>
		            <li><a href="#" class="link-dark rounded">등급별해택</a></li>
		            <li><a href="#" class="link-dark rounded">사용내역</a></li>
		          </ul>
		        </div>
		      </li> -->
	    </ul>
	  </div>
	</aside>
	
  <div class="b-example-divider"></div>
  

  	<section id="contents">
	
  		<c:if test="${empty display }">
			<jsp:include page="/repository/jsp/tripmember/mainbody.jsp"/>
  		</c:if>
  		

   
  		<c:if test="${not empty display }">
  			<jsp:include page="${display }"/>
  		</c:if>
  	
  	</section>

  <aside id="right-sidebar">
		<div class="banner_wraper">
           	 <img src="/nadri/repository/img/tripmember/sky1.jpg"></img>
       		 <img src="/nadri/repository/img/tripmember/sky2.jpg"></img>
      		 <img src="/nadri/repository/img/tripmember/sky3.jpg"></img>
        	 <img src="/nadri/repository/img/tripmember/sky4.jpg"></img>
     	  	 <img src="/nadri/repository/img/tripmember/sky5.jpg"></img>
         	 <img src="/nadri/repository/img/tripmember/sky6.jpg"></img>
        	 <img src="/nadri/repository/img/tripmember/sky7.jpg"></img>
        	 <img src="/nadri/repository/img/tripmember/sky8.jpg"></img>
       		 <img src="/nadri/repository/img/tripmember/sky9.jpg"></img>
        	 <img src="/nadri/repository/img/tripmember/sky10.jpg"></img>
		</div>
  </aside>
  
 </main> 

	<!-- footer -->
	<div id="wrap_foot">
		<footer>
			<jsp:include page="../main/main_footer.jsp">
				<jsp:param value="param1" name="param1" />
			</jsp:include>
		</footer>
	</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/nadri/repository/js/tripmember/myPage.js"></script>

<script type="text/javascript">

//client rolling banner
window.onload = function() {
var bannerLeft=0;
var first=1;
var last;
var imgCnt=0;
var $img = $(".banner_wraper img");
var $first;
var $last;

	$img.each(function(){   // 5px 간격으로 배너 처음 위치 시킴
	    $(this).css("left",bannerLeft);
	    bannerLeft += $(this).width()+5;
	    $(this).attr("id", "banner"+(++imgCnt));  // img에 id 속성 추가
	});
	

	if( imgCnt > 9){                //배너 9개 이상이면 이동시킴
	
	    last = imgCnt;
	
	    setInterval(function() {
	        $img.each(function(){
	            $(this).css("left", $(this).position().left-1); // 1px씩 왼쪽으로 이동
	        });
	        $first = $("#banner"+first);
	        $last = $("#banner"+last);
	        if($first.position().left < -990) {    // 제일 앞에 배너 제일 뒤로 옮김
	            $first.css("left", $last.position().left + $last.width()+5 );
	            first++;
	            last++;
	            if(last > imgCnt) { last=1; }   
	            if(first > imgCnt) { first=1; }
	        }
	    }, 50);   //여기 값을 조정하면 속도를 조정할 수 있다.(위에 1px 이동하는 부분도 조정하면 
	
	//깔끔하게 변경가능하다           
	
	}

};


</script>

</body>
</html>