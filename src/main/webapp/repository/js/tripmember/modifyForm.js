$(function(){
	$.ajax({
		url: '/nadri/member/getMemberInfo',
		type: 'post',
		dataType: 'json',
		success:function(data){
			console.log(JSON.stringify(data));		//json을 안썼지만 json형식으로 뜸 오류가 안뜸

			
			$('#name').val(data.name);
			$('#id').val(data.id);

			$('#email').val(data.email1+"@"+data.email2);
			$('#tel').val(data.tel1+"-"+data.tel2+"-"+data.tel3);
			$('#add').val(data.zipcode+" "+data.addr1+" "+data.addr2);
		},
		error:function(err){
			console.log(err);
		}
		
		});	//ajax
		
	});	//function		
			
$('#modifyBtn').click(function(){
	$('#pwdDiv').empty();
	$('#emailDiv').empty();
	$('#telDiv').empty();
	$('#addrDiv').empty();
	

	if($('#pwd').val()==''){
		$('#pwdDiv').html('비밀번호를 입력해주세요 ');
		
	}else if($('#pwd').val() != $('#repwd').val()){
		$('#repwdDiv').html('비밀번호가 다릅니다');
	}else if($('#email1').val()==''||$('#email2').val()==''){
		$('#emailDiv').html('메일주소가 제대로 입력되지 않았습니다');

	}else if($('#tel1').val()==''||$('#tel2').val()==''||$('#tel3').val()==''){
		$('#telDiv').html('핸드폰번호가 제대로 입력되지 않았습니다');

	}else if($('#zipcode').val()==''||$('#addr1').val()==''){
		$('#addrDiv').html('주소가 제대로 입력되지 않았습니다');

	}else{
		$.ajax({
			url:'/nadri/member/modify',
			type:'post',		
			data:$('#modifyForm').serialize(),

			success(){
				alert('회원정보가 변경되었습니다 ');
			},
			error(err){
				console.log(err);
			}
		});	//ajax
	}	//else	
	
});	//modifyBtn click 
