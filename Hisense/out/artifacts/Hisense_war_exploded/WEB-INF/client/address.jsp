<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>地址管理</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/font_1468400228_1677577.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/font_72064_8d6mr7huygmn29.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/font_844587_t32m3dyr45.css"/>

    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/eevee-layout-677c65.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/vendor-b0dfc7.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/app-back-45d2ee.css"/>

    <script type="text/javascript" src="<%=request.getContextPath()%>/static/jsjar/jquery-3.1.0.js"></script>
    <script src="<%=request.getContextPath()%>/static/js/cart/iPicker.min.js" type="text/javascript"
            charset="utf-8"></script>
    <script src="<%=request.getContextPath()%>/static/jsjar/template-web.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/person/address.js"></script>
</head>
<body>
<div class="main-right user-center" style="margin-top:0;padding: 5px;width: 958px;height: auto;min-height: 580px">
    <div class="address-manage component-standard-wrap js-comp eve-component" data-comp-name="买家收货地址管理" data-comp-path="user/address_manage"><div class="component-header">
        <h2>管理收货地址</h2>
        <a class="js-add-address"><i class="iconfont icon-xinjian"></i>新建收货地址</a>
    </div>
        <div class="component-body" style="width: 948px">
            <table>
                <thead>
                <tr>
                    <th width="128" style="text-align: center">收货人</th>
                    <th width="488" style="text-align: left">收货地址</th>
                    <th width="128" style="text-align: center">联系电话</th>
                    <th width="128" style="text-align: center">操作</th>
                    <th width="128" style="text-align: center">选择</th>
                </tr>
                </thead>
                <tbody id="addressTamp">

                <script type="text/html" id="userAddress">
                    {{if data}}
                    {{each data value i}}
                    <tr class="address-tr" id="vv">
                        <td width="128" style="text-align: center">{{value.aname}}</td>
                        <td width="488" style="text-align: left" class="address">
                            <div class=" txts-ellipsis">
                                {{value.aprovince}}{{value.acity}}{{value.aarea}}{{value.aspecific}}
                            </div>
                        </td>
                        <td width="128" style="text-align: center">{{value.aphone}}</td>
                        <td width="128" style="text-align: center">
                            <a class="js-edit-address-label edit-a js-update-address" data-id="{{value.aid}}">修改</a>
                            &nbsp;|&nbsp;
                            <a id="22" class="delete-a js-delete-address" data-id="{{value.aid}}" data-title="您确定删除吗?">删除</a>
                        </td>
                        <td width="128" style="text-align: center">
                            {{if value.adefault==1}}
                                <span class="if-default">当前默认</span>
                            {{/if}}
                            {{if value.adefault==0}}
                                <a class="js-set-default set-a" data-id="{{value.aid}}">设为默认</a>
                            {{/if}}

                        </td>
                    </tr>
                    {{/each}}
                    {{/if}}
                </script>

               </tbody>
            </table></div>
    </div>

</div>


<div class="modal address-modal hide" style="z-index: 999; top: 20px; left: 200px;float: left;">
    <div class="modal-header">
        <h2 id="address-head">新增收货地址</h2>
        <span class="close"><i class="iconfont icon-ic-close"></i></span>
    </div>
    <form class="form form-aligned address-form " id="address-form" data-id="" novalidate="true">
        <fieldset>
            <div class="address-edit-form modal-body" >
                <input type="hidden" name="type" value="1">
                <div class="control-group">
                    <label class="control-label" ><span class="required">*</span>所在地区</label>
                    <div class="address-select-group">
                        <div class="demo" id="demo-4"></div>
                    </div>
                </div>
                <div class="control-group">
                    <label class="address-detail-label control-label" ><span class="required">*</span>具体地址</label>
                    <textarea class="address-field" id="streetaddress" name="detail" type="text" placeholder="请输入具体地址" pattern="^[\s\S]{5,50}$" maxlength="50" required=""></textarea>
                    <span class="note-error"><i>×</i> 请输入5-50个字符</span>
                    <span class="note-error-empty"><i>×</i> 必填 不得为空</span>
                </div>
                <input type="hidden" name="isDefault" value="">
                <div class="control-group">
                    <label class="control-label" ><span class="required">*</span>收件人</label>
                    <input class="address-field" id="sitesid" name="receiveUserName" type="text" placeholder="请输入收件人" value="" maxlength="25" pattern="^.{2,25}$" required="">
                    <span class="note-error"><i>×</i> 姓名为2-25个字符</span>
                    <span class="note-error-empty"><i>×</i> 姓名为2-25个字符</span>
                </div>
                <div class="control-group">
                    <label class="control-label"><span class="required">*</span>联系电话</label>
                    <input class="address-field" id="mobilephone" name="mobile" type="text" pattern="(?:^1[3456789]|^9[289]|^6[12456789])\d{9}$" placeholder="请输入手机号" value="" required="">
                    <span class="note-error"><i>×</i> 请输入正确的手机号</span>
                    <span class="note-error-empty"><i>×</i> 手机号不得为空</span>
                </div>
                <div class="control-group">
                    <label class="control-label" for="phone">固定电话</label>
                    <input class="address-field" id="phone" name="phone" type="text" placeholder="请输入固定电话" pattern="(^\d{3,4}-\d{7,8})$|(^\(\d{3,4}\)\d{7,8})$" value="">
                    <span class="note-error"><i>×</i> 请输入正确的固定电话</span>
                </div>

                <div class="control-group">
                    <label class="control-label" for="post-code">邮编</label>
                    <input class="address-field" id="post-code" name="postcode" type="text" placeholder="请输入邮政编码" maxlength="6" pattern="^\d{6}$" value="">
                    <span class="note-error"><i>×</i> 邮编必须为6位数字</span>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-info btn-medium close">取&nbsp;&nbsp;消</button>
                <button class="btn btn-success btn-primary btn-medium" id="suborder" type="button">确&nbsp;&nbsp;定</button>
            </div>
        </fieldset>
    </form>
</div>

<%-- 删除提示 --%>
<div class="modal modal-dialog clearfix hide" id="407753" data-id="407753" data-title="删除地址？" style="z-index: 999; top: 220px; left: 325px;">
    <div class="modal-dialog-icon ">
        <i class="icon-pokeball icon-pokeball-notify-warning warning-status"></i>
    </div>
    <div class="modal-dialog-message">
        <h3>删除地址？</h3>
        <p>删除地址</p>
        <div class="modal-controls">
            <button class="btn btn-info close">
                取消
            </button>
            &nbsp;
            <button class="btn btn-minor submit" id="delAddress">
                确定
            </button>
        </div>
    </div>
</div>

</body>
</html>
