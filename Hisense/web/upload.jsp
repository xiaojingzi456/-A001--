<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>$Title$</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/upload" method="POST" enctype="multipart/form-data">
  姓名：<input type="text" name="name"/><br/>
  年龄：<input type="text" name="age"/><br/>
  图片：<input type="file" name="photo"/><br/>
  <input type="submit" value="提交">
</form>
</body>
</html>
