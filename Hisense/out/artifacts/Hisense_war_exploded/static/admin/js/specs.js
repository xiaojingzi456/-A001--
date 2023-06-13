$(function () {

  //监听表单
  layui.use('form', function () {
    var form = layui.form;

    //监听增加一级规格表单提交
    form.on('submit(addSpecs)', function () {
      $.ajax({
        url: "/Hisense/specsServlet?method=addSpecs",
        type: "POST",
        data: $("#addSpecsForm").serialize(),
        dataType: "json",
        async: true,
        cache: false,
        success: function (result) {
          if (result.flag) {
            layer.msg(result.errorMsg, {icon: 2, time: 1000, anim: 6});
          } else {
            layer.msg(result.errorMsg, {icon: 1, time: 1000}, function () {
              xadmin.father_reload();
            });
          }
        },
        error: function () {
          console.log("出错了");
        }
      })
      return false;
    });


  });


});

//获取一级规格的ID完成添加二级规格
function addSpecsTow(obj) {
  var $sid = $(obj).parents("tr").find(".sid").text();
  console.log($sid);
  // $.ajax({
  //   url: "/Hisense/specsServlet?method=findSpecsByName",
  //   type: "POST",
  //   data: {"sname": parameterId},
  //   dataType: "json",
  //   async: false,
  //   cache: false,
  //   success: function () {
  //     xadmin.open('编辑', openUrl);
  //   },
  //   error: function () {
  //     console.log("出错了");
  //   }
  // })
  // xadmin.open("增加二级规格", "/Hisense/controllerAdmin?method=addSpecsTow")

}
