//设置账户状态
function status(number, array) {
  if (number === 1) {
    array.push('<td class="td-status"><span class="layui-btn layui-btn-normal layui-btn-mini">已启用</span></td>');
    array.push('<td class="td-manage"><a onclick="member_stop(this,\'10001\')" href="javascript:;" title="停用"><i class="layui-icon">&#xe601;</i></a></td></tr>')
  } else {
    array.push('<td class="td-status"><span class="layui-btn layui-btn-normal layui-btn-mini layui-btn-disabled">已停用</span></td>');
    array.push('<td class="td-manage"><a onclick="member_stop(this,\'10001\')" href="javascript:;" title="启用"><i class="layui-icon">&#xe62f;</i></a></td></tr>')
  }
}