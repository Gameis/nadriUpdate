$(function() {
    $('#popWriteBtn').click(function() {
        var formData = new FormData($('#popWriteForm')[0]);
        $.ajax({
            url: '/nadri/area/popWrite',
            type: 'post',
            enctype: 'multipart/form-data',
            processData: false,
            contentType: false,
            data: formData,
            success: function() {
            	alert('성공');
            },
            error: function(err) {
                console.log(err);
            }
             
        });
    });

    $('#hotelWriteBtn').click(function() {
        var formData = new FormData($('#hotelWriteForm')[0]);
        $.ajax({
            url: '/nadri/area/hotelWrite',
            type: 'post',
            enctype: 'multipart/form-data',
            processData: false,
            contentType: false,
            data: formData,
            success: function() {
            },
            error: function() {
                console.log(err);
            }
        });
    });
    $('#activityWriteBtn').click(function() {
        var formData = new FormData($('#activityWriteForm')[0]);
        $.ajax({
            url: '/nadri/area/activityWrite',
            type: 'post',
            enctype: 'multipart/form-data',
            processData: false,
            contentType: false,
            data: formData,
            success: function() {
            },
            error: function() {
                console.log(err);
            }
        });
    });

	$('#btnAtt').change(function(e){
	
			var reader = new FileReader();
			
			reader.onload = function(event) {
				var img = document.createElement("img");
				$('#att_zone img').prop('src', event.target.result);
			}
		
			reader.readAsDataURL(e.target.files[0]);
	});

	$('#img').change(function(e){
		var div_style = "display: inline-block; width: 80px; height: 80px;"
		for(var image of e.target.files) {
			var reader = new FileReader();
			
			reader.onload = function(event) {
				var div = document.createElement("div");
				var img = document.createElement("img");
				div.setAttribute("style", div_style);
				img.setAttribute("src", event.target.result);
				img.setAttribute("style", "width: 100%; height: 100%;")
				div.append(img);
				$('#image_container').append(div);
			};
			
			reader.readAsDataURL(image);
		}
		
		$('#img').hide();
	});
	
	$('#pop_name').focusout(function(){
	    var location_name = $('#pop_name').val();
	
	    $.ajax({
	        type: 'get',
	        url: 'https://dapi.kakao.com/v2/local/search/keyword.json',
	        headers: { 'Authorization': 'KakaoAK 32efaa6ae080dc2a02583db85d1065eb' },
	        data: { 'query': location_name},
	        success: function(data){
	            var address_name = data.documents[0].address_name;
	            var map_x = data.documents[0].x; 
	            var map_y = data.documents[0].y;
	            
	            /* alert(address_name);
	            alert(map_x);
	            alert(map_y); */
	            
	            $('input[name="address_name"]').attr('value', address_name);
	            $('input[name="map_x"]').attr('value', map_x);
	            $('input[name="map_y"]').attr('value', map_y);
	                        
	        },
	        error: function(err){
	            console.log(err);
	        }
	    });
	});
});