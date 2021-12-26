//내용불러오기
function onActivities(){
	$.ajax({
		url: '/nadri/activities/onActivities',
		type: 'get',
		data: 'activity_seq='+ $('#activity_seq').val(),
		success: function(data) {
			$('.crumbs-item').last().text(data.activity_name);
			$('#activity_name').text(data.activity_name);
			$('#activity_price').text(data.activity_price);
			$('#activity_salePrice').text(eval(data.activity_price) * (1 - eval(data.activity_saleRate) / 100));
			$('#main_img').attr("src", "/nadri/repository/img/activities/" + data.main_img);
			$('#sub_img').attr("src", "/nadri/repository/img/activities/" + data.sub_img);

		},
		error: function(err) {
			console.log(err);
		}
		
	});
}

