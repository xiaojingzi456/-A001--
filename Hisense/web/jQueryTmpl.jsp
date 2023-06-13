<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
</head>
<script src="static/js/jQuery/jquery-1.12.4.js"></script>
<script src="static/js/jQuery/jquery.tmpl.js"></script>
<script id="demoTmpl1" type="text/x-jquery-tmpl">
{{each(i,user) data}}
<h2>{{= user.uid}}</h2>
{{/each}}
</script>
<script>
  $(function () {
    var $demo1 = $("#demo1");
    $.ajax({
      url: "/Hisense/admin?method=memberList",
      type: "POST",
      dataType: "json",
      async: true,
      cache: false,
      success: function (result) {
        console.log(result);
        $("#demoTmpl1").tmpl(result).appendTo($demo1);
      },
      error: function () {
        console.log("出错了！")
      }
    });
  })
</script>
<body>
<div id="demo1" style="height: 10px;width: 10px; border: 1px solid"></div>
</body>
</html>
