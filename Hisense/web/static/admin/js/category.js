//获取一级类别的ID完成添加二级类别
function caid(obj) {
  var $caid = $(obj).parents("tr").find(".caid").text();
  findCategoryById("/Hisense/category?method=findCategoryById", $caid, '/Hisense/controllerAdmin?method=addCategoryTow');
}

/**
 * 通过ID查询并打开一个新的窗口
 * @param requestUrl
 * @param parameterId
 * @param openUrl
 */
function findCategoryById(requestUrl, parameterId, openUrl) {
  $.ajax({
    url: requestUrl,
    type: "POST",
    data: {"caid": parameterId},
    dataType: "json",
    async: false,
    cache: false,
    success: function () {
      xadmin.open('编辑', openUrl);
    },
    error: function () {
      console.log("出错了");
    }
  })
}

//删除一级类别
function category_del(obj) {
  layer.confirm('确认要删除吗？', {icon: 3}, function (index) {
    var $caid = $(obj).parents("tr").find(".caid").text();
    //发异步删除数据
    $.ajax({
      url: "/Hisense/category?method=delCategory",
      type: "POST",
      data: {"caid": $caid},
      dataType: "json",
      async: true,
      cache: false,
      success: function (result) {
        if (result.flag) {
          layer.msg(result.errorMsg, {icon: 2, time: 1000, anim: 6});
        } else {
          layer.msg(result.errorMsg, {icon: 1, time: 1000});
          $(obj).parents("tr").remove();
        }
      },
      error: function () {
        console.log("出错了！");
      }
    });
  });
}

//删除二级类别
function categoryTow_del(obj) {
  layer.confirm('确认要删除吗？', {icon: 3}, function (index) {
    var $ctid = $(obj).parents("tr").find(".ctid").text();
    $.ajax({
      url: "/Hisense/category?method=findCategoryTowAdnCommodity",
      type: "POST",
      data: {"ctid": $ctid},
      dataType: "json",
      async: true,
      cache: false,
      success: function (result) {
        if (result.flag) {
          layer.msg(result.errorMsg, {icon: 2, time: 1000, anim: 6});
        } else {
          layer.msg(result.errorMsg, {icon: 1, time: 1000});
          $(obj).parents("tr").remove();
        }
      },
      error: function () {
        console.log("出错了！");
      }
    });
  });
}

//获取二级类别选中数量并删除
function categoryTow_delAll() {
  var ckNumber = 0;
  var $categoryTowId = $(".categoryTowId");
  var $ctid = $(".ctid");
  var $ctids = [];
  $categoryTowId.each(function (index, item) {
    if (item.checked === true) {
      ckNumber += 1;
      $ctids.push($ctid.eq(index).text());
    }
  });
  console.log($ctids)
  if (ckNumber !== 0) {
    layer.confirm('确认要删除吗？', {icon: 3}, function (index) {
      $.ajax({
        url: "/Hisense/category?method=delCategoryTow",
        type: "POST",
        data: {"ctid": $ctids},
        dataType: "json",
        async: true,
        cache: false,
        success: function (result) {
          console.log(result.flag);
          if (result.flag) {
            layer.msg(result.errorMsg, {icon: 2, time: 1000, anim: 6});
          } else {
            layer.msg(result.errorMsg, {icon: 1, time: 1000}, function () {
              xadmin.father_reload();
            });
          }
        },
        error: function () {
          console.log("出错了！");
        }
      });
    });
  } else {
    layer.msg("请选择您要删除的二级类别！", {icon: 7, time: 1000, anim: 6})
    return false;
  }
  console.log(ckNumber);
}

//编辑一级类别
function categoryEdit(obj) {
  var $caid = $(obj).parents("tr").find(".caid").text();
  console.log($caid)
  findCategoryById("/Hisense/category?method=findCategoryById", $caid, '/Hisense/controllerAdmin?method=editCategory')
}

$(function () {

  // 分类展开收起的分类的逻辑
  $("tbody.x-cate tr[fid!='0']").hide();

// 栏目多级显示效果
  $('.x-show').click(function () {
    if ($(this).attr('status') === 'true') {
      $(this).html('&#xe625;');
      $(this).attr('status', 'false');
      cateId = $(this).parents('tr').attr('cate-id');
      $("tbody tr[fid=" + cateId + "]").show();
    } else {
      cateIds = [];
      $(this).html('&#xe623;');
      $(this).attr('status', 'true');
      cateId = $(this).parents('tr').attr('cate-id');
      $("tbody tr[fid=" + cateId + "]").hide()
    }
  });

  //监听表单
  layui.use(['form', 'upload'], function () {
    var form = layui.form
        , upload = layui.upload;

    //全选二级类别
    form.on('checkbox(c_all)', function (data) {
      var a = data.elem.checked;
      if (a === true) {
        $(".categoryTowId").prop("checked", true);
        form.render('checkbox');
      } else {
        $(".categoryTowId").prop("checked", false);
        form.render('checkbox');
      }
    });

    //有一个未选中全选取消选中
    form.on('checkbox(c_one)', function (data) {
      var item = $(".categoryTowId");
      item.each(function (index, item) {
        if (item.checked === false) {
          $("#c_all").prop("checked", false);
          form.render('checkbox');
          return false;
        }
      })
      //如果都勾选了  勾上全选
      var all = item.length;
      item.each(function (index, item) {
        if (item.checked === true) {
          all--;
        }
      })
      if (all === 0) {
        $("#c_all").prop("checked", true);
        form.render('checkbox');
      }
    });

    //增加一级类别，监听提交
    form.on('submit(addCategory)', function () {
      $.ajax({
        url: "/Hisense/category?method=addCategory",
        type: "POST",
        data: $("#addCategoryForm").serialize(),
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
          console.log("出错了！");
        }
      })
      return false;
    });

    //编辑一级类别，监听提交
    form.on('submit(updCategoryById)', function () {
      $.ajax({
        url: "/Hisense/category?method=updCategoryById",
        type: "POST",
        data: $("#updCategoryByIdForm").serialize(),
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
          console.log("出错了！");
        }
      })
      return false;
    });

    //监听二级类别提交检验
    $("#addCategoryTow").click(function () {
      if ($("#ctname").val() === "") {
        layer.msg("您还没有填写二级类别，请填写！", {icon: 7, time: 1000, anim: 6})
      }
      return false;
    });

    //增加二级类别，监听提交，普通图片上传
    var uploadInst = upload.render({
      elem: '#test1'
      , url: '/Hisense/category?method=addCategoryTow'
      , field: 'capicture'
      , accept: 'images'
      , auto: false
      , bindAction: '#addCategoryTow'
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
});