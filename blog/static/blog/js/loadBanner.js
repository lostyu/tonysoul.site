var myCookie = {
    'addCookie': function(name,value,expiresHours){
        var cookieString=name+"="+escape(value); 
        //判断是否设置过期时间 
        if(expiresHours>0){ 
            var date=new Date(); 
            date.setTime(date.getTime()+expiresHours*3600*1000); 
            cookieString=cookieString+"; expires="+date.toGMTString(); 
        } 
        document.cookie=cookieString; 
    },
    'getCookie': function(name){
        var strCookie=document.cookie; 
        var arrCookie=strCookie.split("; "); 

        for(var i=0;i<arrCookie.length;i++){ 
            var arr=arrCookie[i].split("="); 
            if(arr[0]==name)return unescape(arr[1]); 
        } 
        return ""; 
    },
    'deleteCookie': function(name){
        var date=new Date(); 
        date.setTime(date.getTime()-10000); 
        document.cookie=name+"=v; expires="+date.toGMTString(); 
    }
}




$(function(){

    if(window.has_banner){
        return;
    }

    var $bg = $('.m-banner-bg');
    var sbgurl = myCookie.getCookie('bgurl')



    if(sbgurl){
        console.log('yes',sbgurl);
        $bg.css('backgroundImage', 'url(' + sbgurl + ')');
    }else{
        console.log('no',sbgurl);

        var url = 'https://bing.ioliu.cn/v1?d=1&callback=?';

        $.getJSON(url, function (data) {
            if (data && data.data.url) {
                myCookie.addCookie('bgurl',data.data.url,12);
                $bg.css('backgroundImage', 'url(' + data.data.url + ')');
            }

        });
    }


    // if (sbgurl) {
    //     console.log('1'+sbgurl);
    //     $bg.css('backgroundImage', 'url(' + sbgurl + ')');
    // }else{
    //     console.log('2' + sbgurl);
    //     $bg.css('backgroundImage', 'none');

    //     var url = 'https://bing.ioliu.cn/v1?d=1&callback=?';

    //     $.getJSON(url, function (data) {
    //         console.log(data);
    //         if (data && data.data.url) {
    //             localStorage.setItem('bgurl',data.data.url);
    //             $bg.css('backgroundImage', 'url(' + data.data.url + ')');
    //         }

    //     });
    // }


    
})