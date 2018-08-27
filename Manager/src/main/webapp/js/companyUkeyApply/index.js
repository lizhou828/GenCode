 $(function(){
 	   //查看详情
 		$("#detailBtn").click(function(){
 		var _docid = $.dataGridOperation.getCheckedId();
 		if(_docid > 0){
 			var buttons = new Array();
 			buttons[0] = {iconCls:'icon-cancel',text:'取消',handler:function(){$.easyuiDialog.close();}};
 		$.easyuiDialog.openSimple('查看详情','detail?id='+_docid,800,600,buttons);
 			}
 		});

     //查看详情
     $("#editBtn").click(function(){
         var _docid = $.dataGridOperation.getCheckedId();
         var obj =$.dataGridOperation.getChecked();
         if(obj.status == '1' || obj.status == '2'){
             $.messager.alert('提示','请选择待审核数据进行操作!',"warning");
             return null;
		 }
         if(_docid > 0){
             var buttons = new Array();
             buttons[0] = {iconCls:'icon-save',text:'确认',handler:function(){$.easyuiDialog.submitSimple();}};
             buttons[1] = {iconCls:'icon-cancel',text:'取消',handler:function(){$.easyuiDialog.close();}};
             $.easyuiDialog.openSimple('审核','edit?id='+_docid,800,600,buttons);
         }
     });
 	
       })
       //格式化状态 (Enum:0待提交1待审核2审核通过3审核不通过)
 			function formatStatus(value){
 				var result = '';
 				do{
 					if(value==0){result = '待审核';   break;}
 					if(value==1){result = '审核通过'; 	break;}
                    if(value==2){result = '审核不通过'; 	break;}
 					break;
 				}while(true);
 				return result ;
 			}

			 function formatType(value){
				 var result = '';
				 do{
					 if(value==1){result = '新发 ';   break;}
					 if(value==2){result = '遗失补发'; 	break;}
					 if(value==3){result = '注销'; 	break;}
					 break;
				 }while(true);
				 return result ;
			 }

 		function parameterSearch(){
 			var queryParams = $('#searchForm').serializeObject();
 			$('#dg').datagrid({
 				url:'search.shtml',
 				queryParams: queryParams,
 				onLoadError:function (msg){$('#dg').datagrid('loadData', {total:0, rows:[]});}
 			});

 		}

