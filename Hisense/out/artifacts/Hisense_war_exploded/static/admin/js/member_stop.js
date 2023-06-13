/*用户-停用*/
function member_stop(obj, id) {
  if ($(obj).attr('title') === '停用') {
    layer.confirm('确认要停用吗？', {icon: 3}, function (index) {
      $(obj).attr('title', '启用')
      $(obj).find('i').html('&#xe62f;');
      $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
      layer.msg('已停用!', {icon: 5, time: 1000});
    });
  } else {
    layer.confirm('确认要启用吗？', {icon: 3}, function (index) {
      $(obj).attr('title', '启用')
      $(obj).find('i').html('&#xe601;');
      $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
      layer.msg('已启用!', {icon: 6, time: 1000});
    });
  }
}