<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>view college</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/scrollerbar.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common.css"/>


<script src="<%=request.getContextPath() %>/js/jquery-3.1.1.min.js"></script>
<script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
</head>
<body>
	<c:if test="${message =='success'}">
		<div class="alert alert-success alert-dismissable">
			<button type="button" class="close" data-dismiss="alert"
					aria-hidden="true">
				&times;
			</button>
			成功！
		</div>
	</c:if>
	<c:if test="${message =='failed'}">
		<div class="alert alert-danger alert-dismissable">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">
				&times;
			</button>
			失败！
		</div>	
	</c:if>
	<div class="panel panel-default" style="margin:0">
	    <div class="panel-body">
	                            查看系 <a href="#" data-toggle="modal" data-target="#myModal" id="add"> <span class="	glyphicon glyphicon-plus-sign" style="color:green;float:right" data-toggle="tooltip" data-placement="bottom" title="添加"></span></a>
    			
	    </div>
    </div>
    <table class="table table-hover" >
    	<tr class="info">
    		<td width="70px">编号</td>
    		<td>系</td>
    		<td>学院</td>
    		<td>操作</td>
    	</tr>
    	<c:forEach items="${departments }" var="items">
    		<tr>
    			<td><c:out value="${items.id }"></c:out></td>
    			<td><c:out value="${items.departmentName }"></c:out></td>
    			<td><c:out value="${items.college.collegeName }"></c:out></td>
    			<td width="70px">
    				<a href="javascript:void(0)" onclick="deleteItem(${items.id })"> <span class="glyphicon  glyphicon-trash" style="color:red" data-toggle="tooltip" data-placement="bottom" title="删除"></span></a>
    				<a href="javascript:void(0)" 	onclick="editInfo(${items.id})"><span class="glyphicon glyphicon-edit" style="color:green;padding-left:20px" data-toggle="tooltip" data-placement="bottom" title="更新"></span></a>
    			</td>
    		</tr>
		</c:forEach>
    </table>
    <div class="col-sm-2">
    	<ul class="pagination" style="margin-top:1px">
	    	<!-- 上一页 -->
	    	<c:if test="${pagination.page>1 }">
	    		<li><a href="<%=request.getContextPath() %>/department/viewDepartment.do?page=${pagination.page-2 }">上一页</a></li>
	    	</c:if>
			<c:if test="${pagination.page<=1 }">
				<li class="disabled"><a href="javascript:void(0)">上一页</a></li>
	    	</c:if>
	    	
	    	<!-- 中间区域 
	    	
	    	
	    	
	    	<c:if test="${pagination.totlePage>5&&pagination.page>=1&&pagination.page<=2 }">
				<li class="active"><a href="<%=request.getContextPath() %>/department/viewDepartment.do?page=${pagination.page-1 }" >${pagination.page }</a></li>
				<li><a href="<%=request.getContextPath() %>/department/viewDepartment.do?page=${pagination.page+1-1 }">${pagination.page+1 }</a></li>
				<li><a href="<%=request.getContextPath() %>/department/viewDepartment.do?page=${pagination.page+2-1 }">${pagination.page+2 }</a></li>
	    		<li><a href="<%=request.getContextPath() %>/department/viewDepartment.do?page=${pagination.page+3-1 }">${pagination.page+3 }</a></li>
	    		<li><a href="<%=request.getContextPath() %>/department/viewDepartment.do?page=${pagination.page+4-1 }">${pagination.page+4 }</a></li>
	    		<li class="disabled"><a href="javascript:void(0)">...</a></li>
	    	</c:if>
	    	<c:if test="${pagination.totlePage>5&&pagination.page>2&&pagination.page<pagination.totlePage-1	 }">
	    		<li><a href="<%=request.getContextPath() %>/department/viewDepartment.do?page=${pagination.page-2-1 }">${pagination.page-2 }</a></li>
				<li><a href="<%=request.getContextPath() %>/department/viewDepartment.do?page=${pagination.page-1-1 }">${pagination.page-1 }</a></li>
				<li class="active"><a href="<%=request.getContextPath() %>/department/viewDepartment.do?page=${pagination.page-1 }" >${pagination.page }</a></li>
				<li><a href="<%=request.getContextPath() %>/department/viewDepartment.do?page=${pagination.page+1-1 }">${pagination.page+1 }</a></li>
				<li><a href="<%=request.getContextPath() %>/department/viewDepartment.do?page=${pagination.page+2-1 }">${pagination.page+2 }</a></li>
	    	</c:if>
	    	<c:if test="${pagination.totlePage>5&&pagination.page>=pagination.totlePage-1 }">
				<li><a href="<%=request.getContextPath() %>/department/viewDepartment.do?page=${pagination.page-4-1 }">${pagination.page-4 }</a></li>
				<li><a href="<%=request.getContextPath() %>/department/viewDepartment.do?page=${pagination.page-3-1 }">${pagination.page-3 }</a></li>
				<li><a href="<%=request.getContextPath() %>/department/viewDepartment.do?page=${pagination.page-2-1 }">${pagination.page-2 }</a></li>
				<li><a href="<%=request.getContextPath() %>/department/viewDepartment.do?page=${pagination.page-1-1 }">${pagination.page-1 }</a></li>
				<li class="active"><a href="<%=request.getContextPath() %>/department/viewDepartment.do?page=${pagination.page-1 }" >${pagination.page }</a></li>
	    		<li class="disabled"><a href="javascript:void(0)">...</a></li>
	    	</c:if>
	    	-->
			<!-- 下一页 -->
			<c:if test="${pagination.page<pagination.totlePage }">
	    		<li><a href="<%=request.getContextPath() %>/department/viewDepartment.do?page=${pagination.page }">下一页</a></li>
	    	</c:if>
			<c:if test="${pagination.page>=pagination.totlePage }">
				<li class="disabled"><a href="javascript:void(0)">下一页</a></li>
	    	</c:if>
		</ul>
    </div>
	<div class="col-sm-2">
	<form action="<%=request.getContextPath() %>/department/viewDepartment.do" method="post">
		<div class="input-group" width="200px">
				<input type="number" class="form-control" name="page" value="1">
				<span class="input-group-btn">
				<button class="btn btn-default" type="submit">
					跳转
				</button>
			</span>
		</div><!-- /input-group -->
	</form>
	</div>
	<div class="col-sm-8" style="margin-top:10px">
		<p class="text-left">共 ${pagination.totleSize }条记录，每页显示${pagination.eachPage }条，当前( ${pagination.page }/${pagination.totlePage } )页</p>
    </div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">添加系</h4>
            </div>
            <div class="modal-body">
            	<div class="college">
            	
            	</div>
            	<br>
            	<div class="grade-content">
            	
            	</div>
            	<br>
            	<div class="department-content">
            	
            	</div>
            	<div class="panel panel-success" style="margin-top:30px;width:50%;margin-left:25%" id="message">
	 			   <div class="panel-body" align="center">
	 			   		保存成功！
	 			   </div>
	 			</div>
	 			<div class="panel panel-danger" style="margin-top:30px;width:50%;margin-left:25%" id="message2">
	 			   <div class="panel-body" align="center">
	 			   		请填写内容或选择正确选项！
	 			   </div>
	 			</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="addConfirm">提交保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!-- 模态框（Modal）[学生修改_郭亮] [开始]-->
<div class="modal fade" id="update" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">
					修改信息
				</h4>
			</div>
			<div class="modal-body">
				<input type="text" name="qq1" placeholder="学生QQ（选填）" id="departmentid" class="form-control"/>
				<label>学院：</label><input type="text" name="collegename1" placeholder="系名称（*必填）" id="collegename1" class="form-control"/>
            	<br>
				<label>系：</label><input type="text" name="departmentname1" placeholder="系名称（*必填）" id="departmentname1" class="form-control"/>
            	<br>
            	<div class="panel panel-success" style="margin-top:30px;width:50%;margin-left:25%" id="message01">
	 			   <div class="panel-body">
	 			   		保存成功！
	 			   </div>
	 			</div>
	 			<div class="panel panel-danger" style="margin-top:30px;width:50%;margin-left:25%" id="message02">
	 			   <div class="panel-body">
	 			   		请输入系名称！
	 			   </div>
	 			</div>
            	
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				 <button type="button" class="btn btn-primary" id="updateInfo" onclick="updateInfo()">提交保存</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
<script>

	function editInfo(departmentId) { 
		$("#departmentid").hide();
		$("#message01").hide();
		$("#message02").hide();
		$("#departmentid").val(departmentId);
		$.ajax({
			type:"post",
			url:"<%=request.getContextPath()%>/department/findDepartment1By.do",
			data:{"type":"json","departmentId":departmentId},
			dataType:"json",
			success:function(data){
				$("#collegename1").val(data.departments[0].college.collegeName);
				$("#departmentname1").val(data.departments[0].departmentName);
			},
			error:function(msg){
				console.log(msg)
			}
		})	
		$('#update').modal('show');
	}
	function updateInfo(){
		//
		var departmentid=$("#departmentid").val();
		var	departmentname=$("#departmentname1").val();
		if(departmentname!=''){
			$.ajax({
				type:"post",
				url:"<%=request.getContextPath()%>/department/updateInfo.do",
				data:{ "id":departmentid,
					  "departmentName":departmentname		  
				},
				dataType:"text",
				success:function(data){
					if(data==1){
						$("#message02").hide();
						$("#message01").fadeIn();
					}
					 window.setTimeout(reload,2000);
				},
				error:function(msg){
					console.log(msg)
				}
			})	
		}
		else{
			$("#message01").hide();
			$("#message02").fadeIn();
		}	
	}
	
	
	$(function () { $("[data-toggle='tooltip']").tooltip(); });
	$("#add").click(function(){
		//初始时提示消息隐藏
		$("#message").hide();
		$("#message2").hide();
		getColleges();//获取学院信息
		
	})
	
	//获取学院信息
	function getColleges(){
		$.ajax({
			type:"post",
			url:"<%=request.getContextPath()%>/college/viewCollege.do",
			data:{"type":"json"},
			dataType:"json",
			success:function(data){
				var length = data.colleges.length;
				var content = "<select name='id' class='form-control' id='selectCollege' onchange='showInput()'>";
				content += "<option value='null'>--请选择学院--</option>";
				for(var i=0;i<length;i++){
					content += "<option value='"+data.colleges[i].id+"'>"+data.colleges[i].collegeName+"</option>";
				}
				content += "</select>";
				$(".college").html(content);
				
			},
			error:function(msg){
				console.log(msg)
			}
		})	
	}
	//获取年级信息
	function getGrades(){
		var collegeId = $("#selectCollege").val();
		$.ajax({
			type:"post",
			url:"<%=request.getContextPath()%>/grade/findGradeBy.do",
			data:{"type":"json","collegeId":collegeId},
			dataType:"json",
			success:function(data){
				var length = data.grades.length;
				var content = "<select name='id' class='form-control' id='selectGrade' onchange='showInput()'>";
				content += "<option value='null'>--请选择年级--</option>";
				for(var i=0;i<length;i++){
					content += "<option value='"+data.grades[i].id+"'>"+data.grades[i].gradeName+"</option>";
				}
				content += "</select>";
				$(".grade-content").html(content);
				
			},
			error:function(msg){
				console.log(msg)
			}
		})	
	}
	//选取学院后的事件处理
	function showInput(){
		//选取学院后，错误消息隐藏
		$("#message2").hide();
		$(".department-content").html("<input type='text' class='form-control' id='department' hidden='hidden' placeholder='系' required/>");
		//alert(document.getElementById("selectCollege").value)
	}
	
	$("#addConfirm").click(function(){
		var departmentName=$("#department").val();
		//var gradeId = $("#selectGrade").val();
		var collegeId = $("#selectCollege").val();
		if(collegeId!="null"){
			$.ajax({
				type:"post",
				url:"<%=request.getContextPath()%>/department/addDepartment.do",
				data:{"collegeId":collegeId,"departmentName":departmentName},
				dataType:"text",
				success:function(data){
					if(data==1){
						$("#message").fadeIn();
					}
					 window.setTimeout(reload,1000);
					
				},
				error:function(msg){
					console.log(msg)
				}
			})
		}else{
			$("#message2").fadeIn();
		}
		
		
		
	})
	function reload(){
		location.reload()
	}
	
	window.setTimeout(hidden,3000); 
	function hidden() 
	{ 
		$(".alert").hide();
	} 
	
	//删除
	function deleteItem(id){
		if(confirm("取认删除？删除该选项将会删除与该选项相关联数据！")){
			location.href="<%=request.getContextPath()%>/department/deleteDepartment.do?id="+id;
		}
	}
</script>	
	
</body>
</html>