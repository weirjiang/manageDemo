<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="content" class="col-lg-10 col-sm-10">
	<div>
		<ul class="breadcrumb">
			<li><a href="#">首页</a></li>
			<li><a href="#">DataTable</a></li>
		</ul>
	</div>
	
	<div class="row">
		<div class="box col-md-12">
			<div class="box-inner">
				<div class="box-header well" data-original-title="">
					<h2>
						<i class="glyphicon glyphicon-user"></i>经销商列表
					</h2>
					<div class="box-icon">
						<a href="#" class="btn btn-setting btn-round btn-default"><i class="glyphicon glyphicon-cog"></i></a> 
						<a href="#" class="btn btn-minimize btn-round btn-default"><i class="glyphicon glyphicon-chevron-up"></i></a> 
						<a href="#" class="btn btn-close btn-round btn-default"><i class="glyphicon glyphicon-remove"></i></a>
					</div>
				</div>
				<div class="box-content">
					<table	id="myTable" class="display">
						<thead>
							<tr>
								<th>收款人</th>
								<th>开户行</th>
								<th>账号</th>
								<th>品牌</th>
								<th>操作</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</div>
	</div>
	
<script>
$(document).ready(function(){
 	$('#myTable').DataTable( {
		  "jqueryUI":true,
		  "searching":false,
		  "lengthMenu": [ 10, 30, 50, 75, 100 ],
		  "lengthChange": true,
		  "sort":false,
		  "language":{
			    "processing":   "处理中...",
			    "lengthMenu":   "显示 _MENU_ 项结果",
			    "zeroRecords":  "没有匹配结果",
			    "info":         "Showing page _PAGE_ of _PAGES_,显示第 _START_ 至 _END_ 项结果，共  _MAX_项",
			    "infoEmpty":    "显示第 0 至 0 项结果，共 0 项",
			    "infoFiltered": "(由 _MAX_ 项结果过滤)",
			    "infoPostFix":  "",
			    "search":       "搜索:",
			    "url":          "",
			    "paginate": {
			        "first":    "首页",
			        "previous": "上页",
			        "sNext":     "下页",
			        "sLast":     "末页"
			    }
 			},
 		"serverSide":true,
		"columns" : [{
			"data":"payee",
		},{
			"data":"bank",
		},{
			"data":"account",
		},{
			"data":"brand",
		}],
        "columnDefs": [
                       {
                           "targets": [4],
                           "data": "id",
                           "render": function(data, type, full) {
                               return "<a href='/update?id=" + data + "'>Update</a>";
                           }
                       }
                   ],
		ajax:"${basePath}admin/dealer/listDealer"
		}); 
		//dataTable	1.9
/* 		$('#myTable').DataTable({
			bAutoWidth : true,
			bFilter : false,
			bSort : false,
			bStateSave:true,//让浏览器记住状态
			bLengthChange : false,
			bPaginate : true,
			sPaginationType : "bootstrap",
			oLanguage : {
				    "sProcessing":   "处理中...",
				    "sLengthMenu":   "显示 _MENU_ 项结果",
				    "sZeroRecords":  "没有匹配结果",
				    "sInfo":         "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
				    "sInfoEmpty":    "显示第 0 至 0 项结果，共 0 项",
				    "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
				    "sInfoPostFix":  "",
				    "sSearch":       "搜索:",
				    "sUrl":          "",
				    "oPaginate": {
				        "sFirst":    "首页",
				        "sPrevious": "上页",
				        "sNext":     "下页",
				        "sLast":     "末页"
				    }
				},
			bServerSide : true,
			bInfo:true,
			"aoColumns" : [{
				"mDataProp":"payee",
				"sWidth" : "10%"
			},{
				"mDataProp":"bank",
				"sWidth" : "10%"
			},{
				"mDataProp":"account",
				"sWidth" : "10%"
			},{
				"mDataProp":"brand",
				"sWidth" : "10%"
			},{
				"mDataProp":null,
				"sWidth" : "10%"
			}],
			fnServerData : function(sSource, aoData, fnCallback) {
				var pd={};
				var aoDataMap = {};
				$.each(aoData, function(index, obj) {
					aoDataMap[obj.name] = obj.value;
				});
				pd["offset"] = aoDataMap.iDisplayStart;
				pd["fetchSize"] = aoDataMap.iDisplayLength;
				$.syRequest({
					type : "GET",
					url : "${basePath}admin/dealer/list",
					data : pd,
					beforeSend : function() {
					},
					success : function(data) {
						var aoData = {
							iDisplayStart : data.offset,
							iDisplayLength : data.fetchSize,
							aaData : data.data,
							iTotalDisplayRecords : data.total,
							iTotalRecords : data.total
						}
						fnCallback(aoData);
					},
					complete : function() {
					}
				});
			}
		})*/
});	 
</script>
	
</div>
