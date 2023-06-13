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
})