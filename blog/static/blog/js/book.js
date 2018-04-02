window.onload = function(){

    var $modal = $('#j-modal');
    var $cnt = $modal.find('.inner');

    function showDetail(id) {
        var data = null;
        $.each(bookdata, function(index, ele) {
            if (ele.id == id) {
                data = ele;
                return false;
            }
        });

        var temp = '<button type="button" class="close j-close" aria-label="Close"><span aria-hidden="true">&times;</span></button>';
        if (data != null) {
            temp += '<div class="m-readDetail row">\
                    <div class="pic col-md-3 hidden-xs">\
                        <a href="' + data.url + '" target="_blank">\
                            <img width="198" height="264" class="media-object" src="' + data.thumbnail + '" alt="">\
                        </a>\
                    </div>\
                    <div class="txt col-md-9">\
                        <h2 class="media-heading">\
                            <a href="' + data.url + '" target="_blank">' + data.title + '</a>\
                        </h2>\
                        <p>' + data.author + '</p>\
                        <p class="time">' + data.pub_time + '</p>\
                        <div class="content">' + data.description + '</div>\
                    </div>\
                </div>';
        }

        $cnt.html(temp);
    }

    function showModal() {
        $modal.fadeIn();
    }

    function hideModal() {
        $modal.fadeOut();
    }

    $modal.on('click', function() {
        hideModal();
    });

    $cnt.on('click', function(ev) {
        ev.stopPropagation();
    });

    $cnt.on('click', '.j-close', function(ev) {
        hideModal();
        ev.stopPropagation();
    });

    (function(){

        var $readList = $('#j-readList');
        var strHtml = '<div class="row m-readList">';
        var data = bookdata;


        $readList.on('click', 'img', function(ev) {
            showModal();
            showDetail($(this).attr('data-id'));
        });
    

    })()

};
