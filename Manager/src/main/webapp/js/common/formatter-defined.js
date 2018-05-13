/**
 * JH EasyUI Expand
 * Copyright(c) 2015 GLORYPTY(hardy). All rights reserved.
 * Note:formatter
 */
var UIFormatter = {
	toFixed: function(value, row, index){
        if(undefined!=value && !isNaN(value)){
        	return value.toFixed(3);
        }
        return "--";      
    },del: function(value, row, index){     
        return "<del>"+value+"</del>";      
    },delToFixed: function(value, row, index){  
        return "<del>"+UIFormatter.toFixed(value, row, index)+"</del>";      
    },Date: function(value, row, index){
        if(undefined!=value && !isNaN(value)){
        	return formatDate("yyyy-MM-dd", value);
        }
        return "--";     
    },DateTime: function(value, row, index){
        if(undefined!=value && !isNaN(value)){
        	return formatDate("yyyy-MM-dd HH:mm:ss", value);
        }
        return "--"; 
    },BooleanEnabled: function(value, row, index){
		switch(value){
			case "0":	return "关闭";
			case "1":	return "启用";
			case "NO":	return "关闭";
			case "YES":	return "启用";			
			default: return "--";
		}
    },Payment: function(value, row, index){
		switch(value){
			case "1":	return "现金";
			case "2":	return "在线支付(中行)";
			default: return "--";
		}
	},AccountNO: function(value, row, index){
		if(undefined!=value){
			return value.length>=6 ? value.substr(0,4)+"******"+value.substr(value.length-3) : value;
		}
		return "--"; 
	},/*操作人类型*/OperatorType: function(value, row, index){
		switch(value){
			case 0:	return "其它";
			case 1:	return "平台管理员";
			case 2:	return "网站用户";
			default: return "--";
		}
	},/*业务操作类型*/BusinessType: function(value, row, index){
		switch(value){
			case 0:	return "其它";
			case 1:	return "新增";
			case 2:	return "修改";
			case 3:	return "删除";
			case 4:	return "审核";
			case 5:	return "导出";
			case 6:	return "查询";
			default: return "--";
		}
	},/*业务操作类型*/BusinessStatus: function(value, row, index){
		switch(value){
			case 0:	return "其它";
			case 1:	return "成功";
			case 2:	return "失败";
			default: return "--";
		}
	},BillStatus: function(value, row, index){
		switch(value){
			case "CLOSE":	return "关闭";
			case "FINISH":	return "已完成";
			case "WAIT_PAY_IN": return "待收款";
			case "WAIT_PAY_IN_PART": return "部分收款";
			case "PAY_IN_PROCESS": return "收款处理中";
			case "WAIT_PAY_OUT": return "已到账待付款";
			case "PAY_OUT_PROCESS": return "付款处理中";

			case "PAY_OUT_WAIT_AUDIT": return "已申请付款";
			case "PAY_OUT_AUDIT_YES": return "付款申请通过";
			case "PAY_OUT_AUDIT_NO": return "付款申请不通过";

			default: return "--";
		}
	},BillStatusBalance: function(value, row, index){
		switch(value){
			case 0:	return "未结算";
			case 1:	return "已结算";
			case 2: return "部分结算";
			default: return "--";
		}
	},BillStatusBuyer: function(value, row, index){
		switch(value){
			case "WAIT_PAY_IN": return "待付款";
			case "PAY_IN_PROCESS": return "付款处理中";
			case "WAIT_PAY_OUT": return UIFormatter.BillStatus("FINISH");
			case "PAY_OUT_PROCESS": return UIFormatter.BillStatus("FINISH");
			default: return UIFormatter.BillStatus(value);
		}
	},BillStatusSeller: function(value, row, index){
		switch(value){
			case "WAIT_PAY_IN": return "待收款";
			case "PAY_IN_PROCESS": return "待收款";
			case "WAIT_PAY_OUT": return "待收款";
			case "PAY_OUT_PROCESS": return "收款处理中";
			default: return UIFormatter.BillStatus(value);	
		}
	},BillCloseCause: function(value, row, index){
		switch(value){
			case "OTHER":	return "其它";
			case "NO_PAY":	return "未付款";
			case "NO_SEND": return "未配送";
			case "RETURN": return "退货";
			default: return "--";
		}
	}
};

