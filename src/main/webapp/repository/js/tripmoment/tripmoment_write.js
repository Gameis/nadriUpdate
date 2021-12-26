$(function() {
	$('#submit').click(function() {
        var formData = new FormData($('#tripmoment_writeForm')[0]);
        $.ajax({
            url: '/nadri/tripmoment/tripmoment_writeForm',
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
});