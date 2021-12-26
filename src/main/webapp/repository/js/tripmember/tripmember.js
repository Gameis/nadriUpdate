
$(function(){
    // 회원 가입 처리
    $('#join-submit').click(function(e){
        e.preventDefault();
        if($("#inputName").val() ==''){
            alert('이름을 입력하세요');
            $("#inputName").focus();
            return false;
        }

        var email = $('#InputEmail').val();
        if(email == ''){
            alert('이메일을 입력하세요');
            $("#InputEmail").focus();
            return false;
        } else {
            var emailRegex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            if (!emailRegex.test(email)) {
                alert('이메일 주소가 유효하지 않습니다. ex)abc@gmail.com');
                $("#inputEmail").focus();
                return false;
            }
        }

        if($("#inputPassword").val() ==''){
            alert('비밀번호를 입력하세요');
            $("#inputPassword").focus();
            return false;
        }

        if($("#inputPasswordCheck").val() ==''){
            alert('비밀번호를 다시 한번 더 입력하세요');
            $("#inputPasswordCheck").focus();
            return false;
        }
        
        if($("#inputPassword").val()!== $("#inputPasswordCheck").val()){
            alert('비밀번호를 둘다 동일하게 입력하세요');
            return false;
        }

        if($("#inputMobile").val() ==''){
            alert('휴대폰 번호를 입력하세요');
            $("#inputMobile").focus();
            return false;
        }
        
        if($("#agree").is(":checked") == false){
            alert('약관에 동의하셔야 합니다');
            return false;      
        }     
        
		$.ajax({
			url:'/nadri/tripmember/write',
			type:'post',
			data:$('#writeForm').serialize(),

			success(){
				alert('회원가입이 완료되었습니다 ');
				location.href='/nadri/index.jsp';				
			},	//success
			error(err){
				console.log(err);
			}
		});	//ajax
        
    });
});		

//우편번호 체크
$('#zipcodeBtn').click(function(){
	window.open("/nadri/repository/jsp/tripmember/checkPost.jsp", "checkPost", "width=500 height=500 top=200 left=700");
});

//인증메일보내기버튼
$("#emailCheckBtn").click(function(){

	if($('#InputEmail').val()==''){
		alert('메일주소를 입력해주세요');
	}	
	else{
	  	var email = $("#InputEmail").val(); //입력한 이메일
		console.log(email);
	   	$.ajax({
	        type:"GET",
	        url:"/nadri/tripmember/emailCheck?email=" + email,

	        
	           success:function(data){
	   	            alert("인증메일을 전송하였습니다");       
	          	 	console.log("data : " + data);
	             $(".emailcheckinputbox").attr("id", "emailchecktrue"); 
	              	emailcode = data;
	        	},	//success
	        	
	            error:function(err){
					console.log(err);
				}	   
	  });	//ajax
  }	//else
});
