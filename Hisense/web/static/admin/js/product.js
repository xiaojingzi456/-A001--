$(function () {
  //监听表单
  layui.use(['form', 'upload'], function () {
    var form = layui.form
        , upload = layui.upload;


    //增加商品，监听提交，普通图片上传
    var uploadInst = upload.render({
      elem: '#test1'
      , url: '/Hisense/category?method=addCategoryTow'
      , field: 'copicture'
      , accept: 'images'
      , auto: false
      , bindAction: '#addProduct'
      , before: function (obj) {
        this.data = {
          'caid': $("#caid").val()
          , 'ctname': $("#ctname").val()
        }
        this.url = '/Hisense/category?method=addCategoryTow&ctname=' + $("#ctname").val();
      }
      , choose: function (obj) {
        //预读本地文件示例，不支持ie8
        obj.preview(function (index, file, result) {
          $('#demo1').attr('src', result); //图片链接（base64）
        });
      }
      ,
      done: function (res) {
        if (res.flag) {
          layer.msg(res.errorMsg, {icon: 2, time: 1000, anim: 6});
        } else {
          layer.msg(res.errorMsg, {icon: 1, time: 1000}, function () {
            xadmin.father_reload();
          });
        }
      }
      ,
      error: function () {
        //演示失败状态，并实现重传
        var demoText = $('#demoText');
        demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
        demoText.find('.demo-reload').on('click', function () {
          uploadInst.upload();
        });
      }
    });
  });
})