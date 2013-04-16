<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title><g:layoutTitle default="${message(code: 'app.title')}"/></title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
        <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
        <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'global.css')}" type="text/css">
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
        <!-- jQuery noty plugin -->
        <script type="text/javascript" src="${resource(dir: 'js/noty', file: 'jquery.noty.js')}"></script>
        <script type="text/javascript" src="${resource(dir: 'js/noty/layouts', file: 'bottomRight.js')}"></script>
        <script type="text/javascript" src="${resource(dir: 'js/noty/themes', file: 'default.js')}"></script>
        <script type="text/javascript">
        function generate(text, type) {
            var n = noty({
                text: text,
                type: type,
                dismissQueue: true,
                layout: 'bottomRight',
                theme: 'defaultTheme'
            });
            console.log(type + ' - ' + n.options.id);
            return n;
        }
        </script>
        <g:layoutHead/>
        <r:layoutResources/>
    </head>
    <body>
        <g:if test="${flash.message}">
            <script type="text/javascript">
            $(document).ready(function() {
                var error = generate('${flash.message}', 'information');
                setTimeout(function() {
                    $.noty.close(error.options.id);
                }, 10000);
            });
            </script>
        </g:if>
        <g:hasErrors>
            <g:eachError var="error">
                <script type="text/javascript">
                $(document).ready(function() {
                    var error = generate('<g:message error="${error}"/>', 'error');
                    setTimeout(function() {
                        $.noty.close(error.options.id);
                    }, 10000);
                });
                </script>
            </g:eachError>
        </g:hasErrors>
        <g:layoutBody/>
        <r:layoutResources/>
    </body>
</html>