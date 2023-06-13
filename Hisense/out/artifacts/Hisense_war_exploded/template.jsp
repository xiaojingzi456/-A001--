<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
</head>
<script src="static/js/jQuery/jquery-1.12.4.js"></script>
<script src="static/js/jQuery/template-web.js"></script>
<script id="demoTmpl1" type="text/html">
  {{if flag==false}}
  <h1>正确</h1>
  {{/if}}
  {{each data v i}}
  <h2>{{v.uid}}-------{{i}}</h2>
  {{/each}}
  {{each data}}
  <h3>{{$value.uname}}-------{{$value.uid}}</h3>
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
        var template1 = template("demoTmpl1", result);
        $demo1.html(template1);
      },
      error: function () {
        console.log("出错了！")
      }
    });
  })
</script>
<body>
<div id="demo1"></div>
</body>
</html>
