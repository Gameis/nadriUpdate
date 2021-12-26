$(function(){
    $('.article_content').each(function(){
        var content = $(this).children('.content_collapse');
        var content_txt = content.text();
        var content_txt_short = content_txt.substring(0,100)+"...";
        var btn_more = $('<a href="javascript:void(0)" class="bi-arrow-down"></a>');
        
        $(this).append(btn_more);
        
        if(content_txt.length >= 100){
            content.html(content_txt_short)
            
        }else{
            btn_more.hide()
        }
        
        btn_more.click(toggle_content);

        function toggle_content(){
            if($(this).hasClass('short')){
                content.html(content_txt_short)
                $(this).removeClass('short');
            }else{
                content.html(content_txt);
                $(this).addClass('short');
            }
        }
    });
});