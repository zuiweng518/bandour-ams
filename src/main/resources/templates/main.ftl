<html>
    <head>
            <link rel="stylesheet" type="text/css" href="/css/index.css">
           <script src="/js/jquery-3.0.0.js"></script>
           <script>
                    $(function(){

                        $("a").click(function(){

                          var url=$(this).attr("rel");
                           $("iframe").attr("src",url);
                        })


                    })
           </script>
    </head>
    <body>
            <div class="container">
                <div id="nav">
                                   <ul id="menu">
                                       <#list menus as menu>
                                           <li><a rel="${menu.url}">${menu.name}</a></li>
                                       </#list>

                                    </ul>
                                    <ul id="logout">
                                        <li ><a href="/logout">注销</a></li>
                                    </ul>
                </div>
                <div id="body">
                    <iframe src="http://www.baidu.com"></iframe>
                </div>
              </div>
    </body>

</html>