<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
  <script src="static/js/jQuery/jquery-1.12.4.js"></script>
</head>
<body>
<form enctype="multipart/form-data" id="tjForm">
  姓名：<input type="text" name="caid" value="06286F25B42A4708BC6AE0B7269B71F5"/><br/>
  二级类别名称：<input type="text" name="ctname"/><br/>
  二级类别图片：<input type="file" name="capicture"/><br/>
  <button onclick="tj()">提交</button>
</form>
<script>
  function tj() {
    var formData = new FormData($("#tiForm")[0]);
    alert(formData)
    var $formData = $("#tiForm").serialize();
    $.ajax({
      url: "${pageContext.request.contextPath}/upload2",
      type: "POST",
      data: formData,
      enctype: 'multipart/form-data',
      cache: false,
      processData: false,
      contentType: false,
      success: function (data) {
        alert("操作成功！");
      },
      error: function (e) {
        alert("网络错误，请重试！！");
      }
    });
  }
</script>
</body>
</html>
