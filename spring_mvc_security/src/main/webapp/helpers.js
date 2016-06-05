/**
 * Created by andrew on 05.06.2016.
 */


//Load jQuery library using plain JavaScript
(function(){
    var newscript = document.createElement('script');
    newscript.type = 'text/javascript';
    newscript.async = true;
    newscript.src = 'jquery-1.8.3.js';
    (document.getElementsByTagName('head')[0]||document.getElementsByTagName('body')[0]).appendChild(newscript);
})();

// emulate POST call to logout url with csrf parameter which is required by spring > 4.x version
function logoutPostHelper( logoutUrl, csrfParamName, csrfToken ) {
    console.log("===>>> Loggin out ===>>>");

    var util = {};
    util.post = function(url, fields) {
        var $form = $('<form>', {
            action: url,
            method: 'post'
        });
        $.each(fields, function(key, val) {
            $('<input>').attr({
                type: "hidden",
                name: key,
                value: val
            }).appendTo($form);
        });
        $form.submit();
    }

    var postData = {};
    postData[csrfParamName] = csrfToken;
    util.post( logoutUrl, postData );
}

