$(function () {
  layui.use(['form', 'jquery', 'laypage'], function () {
    var $ = layui.jquery,
        form = layui.form,
        laypage = layui.laypage;
    //登录表单校验，监听提交
    form.on('submit(login)', function () {
      $.ajax({
        url: "/Hisense/admin?method=login",
        type: "POST",
        data: $('#loginForm').serialize(),
        dataType: "json",
        async: true,
        cache: false,
        success: function (result) {
          if (result.flag) {
            layer.msg(result.errorMsg);
          } else {
            layer.msg(result.errorMsg);
            location.href = "/Hisense/controllerAdmin?method=index"
          }
        },
        error: function () {
          console.log("出错了！")
        }
      })
      return false;
    });

    //修改管理员个人信息，监听提交
    form.on('submit(modify)', function () {
      $.ajax({
        url: "/Hisense/admin?method=modify",
        type: "POST",
        data: $("#modifyForm").serialize(),
        dataType: "json",
        async: true,
        cache: false,
        success: function (result) {
          if (result.flag) {
            layer.msg(result.errorMsg, {icon: 2, time: 1000, anim: 6});
          } else {
            layer.msg(result.errorMsg, {icon: 1, time: 1000}, function () {
              xadmin.close();
              top.window.location.href = "/Hisense/controllerAdmin?method=login";
            });
          }
        },
        error: function () {
          console.log("出错了！");
        }
      });
      return false;
    });

    //增加管理员，监听提交
    form.on('submit(addAdmin)', function () {
      $.ajax({
        url: "/Hisense/admin?method=addAdmin",
        type: "POST",
        data: $("#addForm").serialize(),
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

    //增加、修改管理员字段校验
    form.verify({
      //value:表单的值，itme表单的DOM对象
      username: function (value, itme) {
        // if (!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)) {
        //   return '用户名不能有特殊字符！';
        // }
        // if (/(^\_)|(\__)|(\_+$)/.test(value)) {
        //   return '用户名首尾不能出现下划线\'_\'！';
        // }
        // if (/^\d+\d+\d$/.test(value)) {
        //   return '用户名不能全为数字！';
        // }
        if (value.length < 2) {
          return '用户名最少两位字符！';
        }
      },
      //我们既支持上述函数式的方式，也支持下述数组的形式
      //数组的两个值分别代表：[正则匹配、匹配不符时的提示文字]
      password: [/^[\S]{6,12}$/, '密码必须6到12位，且不能出现空格']
    });

    //首次进入商品信息界面调用分页
    findCommodityAll(laypage);

    //监听表单条件查询商品
    form.on('submit(CommodityFindAll)', function () {
      //条件查询后调用分页请求
      findCommodityAll(laypage)
      return false;
    });

  });

  //将商品信息分页显示
  function findCommodityAll(laypage) {
    $.ajax({
      url: "/Hisense/commodity?method=productList",
      type: "POST",
      data: $("#CommodityFindAllForm").serialize(),
      dataType: "json",
      async: true,
      cache: false,
      success: function (result) {
        commodityPageData(laypage, result);
      }
    });
  }

  //商品信息分页数据渲染
  function commodityPageData(laypage, result) {
    laypage.render({
      elem: 'commodityPage'
      , count: result.data.length
      , layout: ['prev', 'page', 'next', 'skip', 'refresh', 'limit', 'count']
      , jump: function (obj) {
        $("#commodityList").html(function () {
          var arr = []
              , thisData = result.data.concat().splice(obj.curr * obj.limit - obj.limit, obj.limit);
          layui.each(thisData, function (index, item) {
                if (item.cstate === 1) {
                  arr.push('<tr class="layui-bg-green">');
                } else {
                  arr.push('<tr>');
                }
                arr.push('<td>' + (index + 1) + '</td>');
                arr.push('<td class="coid" style="display: none">' + item.coid + '</td>');
                arr.push('<td>' + item.comodel + '</td>');
                arr.push('<td>' + item.coname + '</td>');
                arr.push('<td><img src="/Hisense/static/image/AdminNewImg/' + item.copicture + '"></td>');
                arr.push('<td>' + item.coprice + '</td>');
                arr.push('<td>' + item.disprice + '</td>');
                arr.push('<td>' + item.csold + '</td>');
                if (item.cstate === 1) {
                  arr.push('<td class="td-status">');
                  arr.push('<span class="layui-btn layui-btn-normal layui-btn-mini layui-bg-green" onclick="offShelf(this)" title="下架">已上架</span>');
                  arr.push('</td>');
                } else if (item.cstate === 0) {
                  arr.push('<td class="td-status">');
                  arr.push('<span class="layui-btn layui-btn-normal layui-btn-mini layui-bg-gray" onclick="putOnTheShelf(this)" title="上架">已下架</span>');
                  arr.push('</td>');
                }
                arr.push('</tr>');
              }
          );
          return arr.join('');
        });
      }
    });
  }

  //获取当前系统时间
  var $time = $(".time");

  function time() {
    setInterval(function time() {
      $time.html(new Date().toLocaleString())
    }, 1000);
  }

  time();

//滑块验证
  layui.config({
    base: '/Hisense/static/admin/dist/sliderVerify/'
  }).use(['sliderVerify', 'jquery', 'form'], function () {
    var sliderVerify = layui.sliderVerify,
        form = layui.form;
    var slider = sliderVerify.render({
      elem: '#slider'
    })
    //监听提交
    form.on('submit(loginForm)', function (data) {
      if (slider.isOk()) {//用于表单验证是否已经滑动成功
        // layer.msg(JSON.stringify(data.field));
      } else {
        layer.msg("请先通过滑块验证");
      }
      return false;
    });
  });


});


//点击冻结管理员账户
function closeAdmin(obj) {
  adminStateAjax(0, obj);
}

//点击启用管理员账户
function openAdmin(obj) {
  adminStateAjax(1, obj);
}

//处理管理员账号状态
function adminStateAjax($astate, obj) {
  var $aid = $(obj).parents("tr").find(".aid").text();
  $.ajax({
    url: "/Hisense/admin?method=modifyAdminState",
    type: "POST",
    data: {"astate": $astate, "aid": $aid},
    dataType: "json",
    success: function (result) {
      if (result.flag) {
        layer.msg(result.errorMsg, {icon: 2, time: 1000, anim: 6});
      } else {
        layer.msg(result.errorMsg, {icon: 1, time: 1000}, function () {
          location.reload();
        });
      }
    },
    error: function () {
      console.log("出错了！");
    }
  });
}

//处理商品上架下架状态
function commodityStateAjax($cstate, obj) {
  var $coid = $(obj).parents("tr").find(".coid").text();
  console.log($coid);
  $.ajax({
    url: "/Hisense/commodity?method=updStateById",
    type: "POST",
    data: {"cstate": $cstate, "coid": $coid},
    dataType: "json",
    success: function (result) {
      layer.msg(result.errorMsg, {icon: 1, time: 1000}, function () {
        location.reload();
      });
    },
    error: function () {
      console.log("出错了！");
    }
  });
}

//点击上架商品
function putOnTheShelf(obj) {
  commodityStateAjax(1, obj);
}

//点击下架商品
function offShelf(obj) {
  commodityStateAjax(0, obj);
}




