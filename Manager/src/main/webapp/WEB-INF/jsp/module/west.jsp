<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function(){
    var menuTree = [];
    if(type == 1){
        //登录后,判断当前帐号类型,如果为监管端帐号,就只显示"档案管理"和"资料交换"菜单
        menuTree = [{
            text: '档案管理',
            state: 'open',
            href:'archive/index.html'
        },{
            text: '资料交换',
            state: 'open',
            href:'task/index'
        }];
    }else{
        menuTree = [{
            text: '消息提醒<span id="messageRemind"></span>',
            state: 'open',
            href:'sysMessage/index'
        },{
            text: '企业管理',
            state: 'open',
            children:[{text:'企业用户',href:'companyAccount/index'},{text:'企业基本信息审核',href:'company/index'},{text:'档案信息审核',href:'company/archiveAudit/index.html'},{text:'Ukey申请审核',href:'companyUkeyApply/index'},{text:'印章审核',href:'companySeal/index'}]
        },{
            text: '档案管理',
            state: 'open',
            href:'archiveManagement/index'
        },{
            text: '资料交换',
            state: 'open',
            href:'task/index'
        },{
            text: '系统管理',
            state: 'open',
            children:[{text:'用户管理',href:'admin/index'},{text:'角色管理',href:'role/index'},{text:'数据字典',href:'productDict/index'},{text:'操作日志',href:'logs/index'},{text:'非法词汇管理',href:'illegalwords/index'}]
        }];
    }
    $("#menuTree").tree({
        data:menuTree
    });

})


</script>
<div  class="easyui-accordion" data-options="fit:true,border:false" >
    <ul class="easyui-tree" id="menuTree"></ul>
</div>