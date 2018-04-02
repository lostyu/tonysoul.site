$(function(){

    var $bg = $('.m-banner-bg');
    var sbgurl = localStorage.getItem('bgurl')



    if(sbgurl){
        console.log('yes',sbgurl);
        $bg.css('backgroundImage', 'url(' + sbgurl + ')');
    }else{
        console.log('no',sbgurl);

        var url = 'https://bing.ioliu.cn/v1?d=1&callback=?';

        $.getJSON(url, function (data) {
            if (data && data.data.url) {
                localStorage.setItem('bgurl',data.data.url);
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