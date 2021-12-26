<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/nadri/repository/css/tripmember/deleteForm.css">

</head>
<body>

<div class="delete_wrapper">
	<form id="deleteForm">
		<div class="deletewrap">
			<div class="deletesubject">
				<span>회원탈퇴</span>
			</div>
		
			<div class="deletepwdwrap">
				<div class="deletepwd">비밀번호확인</div><div id="deletepwdDiv"></div>
				<div class="deletepwdinputbox">
					<input class="deletepwdinput" type="password"  id="deletepwd" name="deletepwd">
				</div>
			</div>
	</div>
	<br><hr>
	<div class="deletereasonwrap">
		<div class="deletereason">탈퇴사유</div>
		<div class="deletereasoninputbox">
			<input list="dropout" name="drop" id="drop" placeholder="직접입력">
			<datalist id="dropout">
			  <option value="가격이 비싸요" label="가격">
			  <option value="불친절해요" label="친절">
			  <option value="장소가 적어요" label="장소">
			  <option value="날짜가 달라요" label="날짜">
			</datalist>
 		</div>
 	</div>
 	
 	<div class="deletehopewrap">	
		<div class="deletehope">개선요구사항 </div>
		<div class="deletehopecheckbox">
			 <input type="checkbox" name="require1"/>가격할인
			 <input type="checkbox" name="require2"/>편의성 
			 <input type="checkbox" name="require3"/>다양한장소	
			 <input type="checkbox" name="require4"/>다양한계획표 
			 <br>
			 <textarea placeholder="필요시 기타사항을 적어주세요" id="opinion" name="opinion" cols="30" rows="5"></textarea>
 		</div> 		
	</div>
	<br>




	<div class="deletecautionwrap">
		<div class="deletecation">회원탈퇴시 유의사항</div>
		<br>
		<div class="deletereference">
			<ol>
				<li>회원 탈퇴 시에는 고객님의 개인정보가 모두 삭제되어, 더 이상 등급 혜택을 받으실 수 없습니다.</li><br>
				<li>회원탈퇴에 의해 등록 해지된 일반 카드는 재등록을 하지 않은 상태에서도 trip.com에서 정상적으로 이용이 가능하지만, 별의 지급, 분실, 분실신고 시 잔액보장 등의 등급 혜택은 더 이상 누리실 수 없게 됩니다.</li><br>
				<li>정상 이용하셨던 일반 카드는 탈퇴와 함께 자동 해지되어 회원 재가입 후 본인 또는 다른 사용자에 의해 다시 등록될 수 있지만 이전에 사용하셨던 거래정보는 확인하실 수 없습니다.</li><br>
				<li>중지된 카드에 잔액이 남아있는 경우, 잔액이전이나 잔액환불을 통해 잔액이 0원이 되어야 회원탈퇴가 가능하며, 중지된 카드는 재사용 또는 재등록이 불가합니다.</li><br>
				<li>골드카드는 수령등록이 완료된 경우에만 회원 탈퇴가 가능합니다.</li><br>
				<li>등록된 골드카드 및 특정카드에 잔액이 남아있는 경우, 잔액 소진, 잔액 이전 또는 잔액 환불을 통해 잔액이 0원이 되어야 회원탈퇴가 가능합니다.</li><br>
				<li>잔액이 남아있지 않은 골드 카드는 탈퇴와 함께 자동 중지되어 재사용 또는 재등록이 불가합니다.</li><br>
				<li>Gift 서비스의 진행 중인 주문 내역 등이 있는 경우, 주문 절차가 모두 완료된 후에 탈퇴할 수 있습니다.</li><br>
			</ol>
		</div>
		<br>
	</div>	
	<br>	
	<div class="deletecheckbox">
		<input type="checkbox" id ="deletecheckbox" name="deletecheckbox">
		회원탈퇴 후 혜택 및 등록한 카드의 소유권 상실에 대해 동의합니다.
	
	</div>		
	<br><br><br>
		
	<div>
		<input type="button" id ="deleteBtn" name="deleteBtn" class="deleteBtn" value="회원탈퇴신청">
	</div>
	<div class="clearfix"></div>
	<br><br>
	</form>
</div>	

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">


$('#deleteBtn').click(function(){

	$('#deletepwdDiv').empty();
	if($('#deletepwd').val()==''){
		alert("비밀번호를 입력해주세요");
		$('#deletepwdDiv').html('비밀번호를 입력해주세요 ');
		$('#deletepwdDiv').css('color', 'red');
		$('#deletepwdDiv').css('font-size', '15pt');
		$('#deletepwdDiv').css('font-weight', 'bold');
	}else{
		$.ajax({
			url:'/nadri/tripmember/compare',
			type: 'post',
			
			data:{'pwd':$('#deletepwd').val()},
				
			success: function(data){
				//console.log(JSON.stringify(data));
								
				if(data=='fail'){		
					alert("비밀번호를 확인해주세요");
	
					$('#deletepwdDiv').html('비밀번호가 다릅니다');
					$('#deletepwdDiv').css('color', 'red');
					$('#deletepwdDiv').css('font-size', '15pt');
					$('#deletepwdDiv').css('font-weight', 'bold');
				}
				else if(!$("#deletecheckbox").is(":checked")){
					//	location.href='/nadri/index.jsp';
		      		alert("회원 탈퇴에 동의 하셔야 다음 단계로 진행 가능합니다 ");	
						
				}else if((data=='ok') && $("#deletecheckbox").is(":checked")){
					confirm('정말로 탈퇴하시겠습니까')
					$.ajax({
						url:'/nadri/tripmember/delete',
						type:'post',
						
						success:function(){
							alert("회원탈퇴가 완료되었습니다");		
							$.ajax({
								url:'/nadri/tripmember/logOut',
								type: 'post',						
								success: function(){	
									location.href='/nadri/index.jsp';
								},		//success	
								error: function(err){
									console.log(err);			
								}	
								
							});		// ajax
						},
						error: function(err){
							console.log(err);			
						}	
					});			//ajax
				}	//else if
			},	//success
			error:function(err){
				console.log(err);
			}
		});		//ajax	
	}	//else

});		//click


</script>
</body>
</html>