/*$(function() {
	$('#m_footer_bottom_btn').click(function(){
		$.ajax({
			url: '/jsp/activities/activities.jsp',
			dataType: 'json',
			succrss:function(data){
				alert(data.next_redirect_pc_url);
				var box = data.next_redirect_pc_url;
				window.open(box);
			},
			error:function(error){
				alert(error);
			}
		});
	});
});  
*/