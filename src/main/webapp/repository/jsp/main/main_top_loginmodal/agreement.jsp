<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="/nadri/repository/css/tripmember/agreement.css">

</head>
<body class="agreement">
    
<form id="agreeform" class="agreeclass">
   	<ul class="agree_box">
   		<li class="checkBox check01">
   			<ul class="clearfix">
   				<li>
   					<h2>이용약관, 개인정보 수집 및 이용,
                      위치정보 이용약관(선택), 프로모션 안내
                      메일 수신(선택)에 모두 동의합니다.</h2>
   				</li>
   				
	        	<li class="checkAllBtn">
	                <input type="checkbox" id="checkAll" name="checkAll"/>일괄선택
	            </li>
            </ul>
        </li>
           
     	<li class="checkBox check02">
    		<ul class="clearfix">
   				<li>
   					<h4 class="h4">전자상거래표준약관(필수)</h4>
   				</li>
   				<li class="checkBtn">
   					<input type="checkbox" id="chk1"  name="chk1" class="check" />  동의 
   				</li>
     		</ul>	
            <textarea class="license auto" style="font-size:1em;" readonly>
               <jsp:include page="license/license.jsp" />	
            </textarea>
        </li>   
                  
   	   	<li class="checkBox check03">   
   	   		<ul class="clearfix">  
   	   			<li>        
         			<h4 class="h4">개인정보보호지침(필수)</h4>
         		</li>
         		<li class="checkBtn">
        			<input type="checkbox" id="chk2"  name="chk2" class="check"/>  동의 
		   	     </li>
      		</ul>

       		<textarea class="license auto" style="font-size:1em;" readonly>
   				<jsp:include page="license/license2.jsp" />	
        	</textarea>
     	</li>
        
  		<li class="checkBox check04">
  			<ul class="clearfix">
		        <li>   
		           <h4 class="h4">개인정보 수집동의 및 이용약관(선택)</h4>
		        </li>
		         
	         	<li class="checkBtn">   
	           	   <input type="checkbox" id="chk3"  name="chk3" class="check"/>  동의 
	        	</li>	
       		</ul>
            <textarea class="license auto" style="font-size:1em;" readonly>
   				<jsp:include page="license/license3.jsp" />
			</textarea>
		</li>
 	 </ul>
 	 <br><br>
      <ul class="footBtwrap clearfix" >
    
        <li><div align="center"><button class="nextBtn" id="nextBtn">위 내용에 동의 합니다</button></div></li>
      </ul>
</form>


<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
		
    	//$("#membershipmodalBtn").attr('disabled', true);//이거한줄이랑
        $("#nextBtn").click(function(){
        	if(!$("#chk1").is(":checked")){
        		alert("전자 상거래 표준약관에 동의 하셔야 다음 단계로 진행 가능합니다 ");	
        		return false;
        	
        	}else if(!$("#chk2").is(":checked")){
                alert("개인정보 보호지침에 동의 하셔야 다음 단계로 진행 가능합니다 ");
             	return false;
                
            }else {
				$("#membershipmodalBtn").attr('disabled', false); 	

        		return false;	//여기에 return false 가 걸려있는데 대체 왜 모달에서 나가지는건지 모르겠어요

        	
        	}
        });    
    });
    //if($("#chk1").is(":checked") && $("#chk2").is(":checked")
        
  //전체 선택 전체 해제
    $('#checkAll').click(function(){
    	if($('#checkAll').prop("checked")){
    		$('.check').prop('checked',true);
    	}else{
    		$('.check').prop('checked',false);
    	}
    });		//click   
  
  //선택시에 버튼 변화  
    $('#agreeform').change(function() {
    	if($("#chk1").is(":checked") && $("#chk2").is(":checked")) {
    		$('#nextBtn').removeClass('nextBtn');
    		$('#nextBtn').addClass('nextBtn2');
    	}else {
    		$('#nextBtn').removeClass('nextBtn2');
    		$('#nextBtn').addClass('nextBtn');
    	}
    });
    
    
</script>
</body>
</html>

