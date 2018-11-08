<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Index</title>
    <script src="/js/jquery-1.8.3.min.js"></script>
    <script src="/js/jquery.form.js"></script>
     <style>
            .login {
                  float:right
            }
            .body{
                  margin-top:20px;
                  margin-left:10%;
                  margin-right:10%;

            }
            .form{
                   background-color:#F8F8F8;
                   border:1px solid #CCCCCC;
                   height:300px;
            }
            table input {
                   height:30px;
                   width:500px;
                   text-align:left;
            }
            input[type="button"]{
               display: inline-block;
               width:80px;
               height:40px;
               marign-top:10px;
               margin-left:300px
            }
            .content {
                      height:300px;
                      margin-top:50px;
                      display:none;
                      background-color:#F8F8F8;
                      border:1px solid #CCCCCC
            }
            .info {
                        margin-top:20px;
                        width:100%;
                        heith:300px;
                        word-break:break-all
            }
            select {

                       border: 1px solid #555;
                       padding: 0.5em;
                       font-size: 15px;
                       line-height: 1.2em;
                       background: #fff;
                       -webkit-appearance: none;
                       -webkit-box-shadow: 1px 1px 1px #fff;
                       -webkit-border-radius: 0.5em;
             }

            </style

     </style>
     <script>
       function getOption(){
            var id=$("select").val();
            $.ajax({
                 url:"/api/queryOptionById",
                                 data:"id="+id,
                                 type:"get",
                                 dataType:"json",
                                 contentType: "text",
                                 success:function(data)
                                 {
                                     var txt="<table style='table-layout:fixed' width='100%'>";
                                     $.each(data,function(i,param){
                                         if(param.name!=null)
                                         txt+="<tr><td width='50px'><label for='"+param.name+"' >"+param.name+"</td><td><input type='text' style='margin-left:50px'  id='"+param.id+"' name='"+param.name+"'></td></tr>";
                                     })

                                        $(".option").html(txt+"</table>");
                                     },

                                 error: function() {
                                     alert("error");
                                   }
            })
       }
       function sendAjax()
         {
           var cValue= $("#form1").formSerialize();
           $.ajax(
             {
                 url:"/api/query",
                 data:cValue,
                 type:"get",
                 dataType:"json",
                 contentType: "content-type：application/x-www-form-urlencoded",
                 success:function(data)
                 {
                        $(".info").text(data.content);
                        $(".content").show();
                 },
                 error: function() {

                   }
             });
         }

       </script>
</head>
<body>
   <div class="head">
        <center><h1>集中权限管理系统接口调试工具</h1></center>
        <div class="login">
            <a href="/logout">注销</a>

        </div>
    </div>
    <div class="body">
            <div class="form">
                 <form id="form1">
                     <div class="queryBody">
                         <table>

                                 <tr><td><label for="url">URL:</label></td><td><input type="text" name="url" id="url"/></td></tr>
                                 <tr><td><label for="api">API:</label></td><td>
                                            <select name="api" onchange="getOption()" height="40px">
                                                 <#list apiList as data>
                                                     <option value="${data.id!''}">${data.name!''}(${data.annotation!''})</option>
                                                 </#list>
                                            </select>

                                </td></tr>
                                <tr><td><label for="app_code">APP_Code:</label></td><td><input type="text" name="app_code" id="app_code"/></td></tr>
                                <tr><td><label for="app_secret">APP_SECRET:</label></td><td><input type="text" name="app_secret" id="app_secret"/></td></tr>

                         </table>
                     </div>
                     <div class="option">

                      </div>
                  </form>
            </div>

             <input type="button" onclick="sendAjax()" width="10px" height="100px" value="查询">
            <div class="content">
                 <div class="info"></div>
            </div>
    </div>
</body>
</html>