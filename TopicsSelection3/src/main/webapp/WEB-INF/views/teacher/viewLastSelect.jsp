<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>view class</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/scrollerbar.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common.css"/>


<script src="<%=request.getContextPath() %>/js/jquery-3.1.1.min.js"></script>
<script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>

<!-- file -->
<script src="<%=request.getContextPath() %>/js/fileinput.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/js/fileinput_locale_zh.js" type="text/javascript"></script>
<link href="<%=request.getContextPath() %>/css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
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
	                            查看最后选题情况
	           <a href="<%=request.getContextPath() %>/teacher/exportLastSelect.do">
	         	<span class="glyphicon glyphicon-export" style="color:green;float:right;margin-right:80px" data-toggle="tooltip" data-placement="bottom" title="导出"></span>                  
	          </a>
	    </div>
    </div>
    <table class="table table-hover table-striped" >
    	<tr class="info">
    		<td width="100px">学号</td>
    		<td>姓名</td>
    		<td>班级</td>
    		<td>方向</td>
    		<td>专业</td>
    		
    		<td>年级</td>
    		<td>系</td>
    		<td>题目名称</td>
    		<td>子题目</td>
    		<td>指导老师</td>
    	</tr>
    	<c:forEach items="${students }" var="items">
    		<tr>
    			<td><c:out value="${items.no }"></c:out></td>
    			<td>
    				<a href="<%=request.getContextPath() %>/student/viewStudentOne.do?filter=no&no=<c:out value="${items.no }"></c:out>&id=<c:out value="${items.id }"></c:out>"><c:out value="${items.name }"></c:out></a>
    			</td>
    			<td><c:out value="${items.clazz.className }"></c:out></td>
    			<td><c:out value="${items.clazz.direction.directionName }"></c:out></td>
    			<td><c:out value="${items.clazz.direction.spceialty.specialtyName }"></c:out></td>
    			<td><c:out value="${items.clazz.direction.spceialty.grade.gradeName }"></c:out></td>
    			<td><c:out value="${items.clazz.direction.spceialty.grade.department.departmentName }"></c:out></td>
    			
    			<td><c:out value="${items.topics.topicsName }"></c:out></td>
    			<td>${items.subTopic.subName }</td>
    			<td><c:out value="${items.topics.teacher.name }"></c:out></td>
    			
    		</tr>
		</c:forEach>
    </table>
  <!-- 分页开始 -->
    <div class="col-sm-2">
    	<ul class="pagination" style="margin-top:1px">
	    	<!-- 上一页 -->
	    	<c:if test="${pagination.page>1 }">
	    		<li><a href="<%=request.getContextPath() %>/teachStu/viewLastSelect.do?gradeId=${gradeId }&page=${pagination.page-2 }">上一页</a></li>
	    	</c:if>
			<c:if test="${pagination.page<=1 }">
				<li class="disabled"><a href="javascript:void(0)">上一页</a></li>
	    	</c:if>
			<!-- 下一页 -->
			<c:if test="${pagination.page<pagination.totlePage }">
	    		<li><a href="<%=request.getContextPath() %>/teachStu/viewLastSelect.do?gradeId=${gradeId }&page=${pagination.page }">下一页</a></li>
	    	</c:if>
			<c:if test="${pagination.page>=pagination.totlePage }">
				<li class="disabled"><a href="javascript:void(0)">下一页</a></li>
	    	</c:if>
		</ul>
    </div>
	<div class="col-sm-2">
	<form action="<%=request.getContextPath() %>/teachStu/viewLastSelect.do?gradeId=${gradeId }" method="post" onsubmit="return checkPage()">
		<div class="input-group" width="100px">
				<input type="number" class="form-control" name="page" value="1" id="page">
				<input type="hidden" class="form-control" name="pageType" value="1">
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
   <!-- /分页-->   
    
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">添加学生</h4>
            </div>
            <div class="modal-body">
            	<input type="text" name="name" placeholder="学生姓名（*必填）" id="name" class="form-control"/>
            	<br>
            	<input type="text" name="no" placeholder="学生学号（*必填）" id="no" class="form-control"/>
            	<br>
            	<select id="sex" name="sex" class="form-control">
            		<option value="男">男</option>
            		<option value="女">女</option>
            	</select>
            	<br>
            	<input type="text" name="telephone" placeholder="学生电话（选填）" id="telephone" class="form-control"/>
            	<br>
            	<input type="text" name="qq" placeholder="学生QQ（选填）" id="qq" class="form-control"/>
            	<br>
            	<input type="text" name="email" placeholder="学生邮箱（选填）" id="email" class="form-control"/>
            	<br>
            	<div class="grade-content">
            	
            	</div>
            	<br>
            	<div class="specialty-content">
            	
            	</div>
            	<br>
            	<div class="direction-content">
            	
            	</div>
            	<br>
            	<div class="clazz-content">
            	
            	</div>
            	<div class="panel panel-success" style="margin-top:30px;width:50%;margin-left:25%" id="message">
	 			   <div class="panel-body">
	 			   		保存成功！
	 			   </div>
	 			</div>
	 			<div class="panel panel-danger" style="margin-top:30px;width:50%;margin-left:25%" id="message2">
	 			   <div class="panel-body">
	 			   		请选择正确选项！
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

<!-- 模态框（Modal） -->
<div class="modal fade" id="import1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					批量导入学生
				</h4>
			</div>
			<div class="modal-body">
				<form action="<%=request.getContextPath() %>/student/batchImportStudent.do" method="post" enctype="multipart/form-data">
					<div class="input-group">
			            <span class="input-group-addon" style="border-radius: 0;">学生名单文件</span>
			            <input type="file" name="file" required class="file" class="form-control" accept="application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet">
			        </div>
					<br>
					<input type="submit" value="导入" class="btn btn-primary" style="width:150px"/>
				</form>
				
				<br>
				<br>
				<a href="<%=request.getContextPath() %>/upload/">下载示例文件</a>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
<script>
  $(function () { $("[data-toggle='tooltip']").tooltip(); });
	
	//检查页数
	function checkPage() {
		var page = $("#page").val();
		if(page <= 0) {
			$("#page").val("1");
		} else if(page > ${pagination.totlePage }) {
			$("#page").val(${pagination.totlePage });
		}
		
		return true;
	}
	
	
	$("#add").click(function(){
		//初始时提示消息隐藏
		$("#message").hide();
		$("#message2").hide();
		getGrades();//获取学院信息
	})
	

	//获取年级信息
	function getGrades(){
		$("#message2").hide();
		var departmentId = ${departmentId};
		$.ajax({
			type:"post",
			url:"<%=request.getContextPath()%>/grade/findGradeBy.do",
			data:{"type":"json","departmentId":departmentId},
			dataType:"json",
			success:function(data){
				var length = data.grades.length;
				var content = "<select name='id' class='form-control' id='selectGrade' onchange='getSpecialty()'>";
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
	
	
	//获取专业信息
	function getSpecialty(){
		$("#message2").hide();
		var gradeId = $("#selectGrade").val();
		$.ajax({
			type:"post",
			url:"<%=request.getContextPath()%>/specialty/findSpecialtyBy.do",
			data:{"type":"json","gradeId":gradeId},
			dataType:"json",
			success:function(data){
				var length = data.specialtys.length;
				var content = "<select name='id' class='form-control' id='selectSpecialty' onchange='getDirection()'>";
				content += "<option value='null'>--请选择专业--</option>";
				for(var i=0;i<length;i++){
					content += "<option value='"+data.specialtys[i].id+"'>"+data.specialtys[i].specialtyName+"</option>";
				}
				content += "</select>";
				$(".specialty-content").html(content);
				
			},
			error:function(msg){
				console.log(msg)
			}
		})	
	}
	//获取方向信息
	function getDirection(){
		$("#message2").hide();
		var specialtyId = $("#selectSpecialty").val();
		$.ajax({
			type:"post",
			url:"<%=request.getContextPath()%>/direction/findDirectionBy.do",
			data:{"type":"json","specialtyId":specialtyId},
			dataType:"json",
			success:function(data){
				var length = data.directions.length;
				var content = "<select name='id' class='form-control' id='selectDirection' onchange='getClazz()'>";
				content += "<option value='null'>--请选择方向--</option>";
				for(var i=0;i<length;i++){
					content += "<option value='"+data.directions[i].id+"'>"+data.directions[i].directionName+"</option>";
				}
				content += "</select>";
				$(".direction-content").html(content);
				
			},
			error:function(msg){
				console.log(msg)
			}
		})	
	}
	//获取班级信息
	function getClazz(){
		$("#message2").hide();
		var directionId = $("#selectDirection").val();
		$.ajax({
			type:"post",
			url:"<%=request.getContextPath()%>/clazz/findClazzBy.do",
			data:{"type":"json","directionId":directionId},
			dataType:"json",
			success:function(data){
				var length = data.clazzs.length;
				var content = "<select name='id' class='form-control' id='selectClazz' onchange=''>";
				content += "<option value='null'>--请选择班级--</option>";
				for(var i=0;i<length;i++){
					content += "<option value='"+data.clazzs[i].id+"'>"+data.clazzs[i].className+"</option>";
				}
				content += "</select>";
				$(".clazz-content").html(content);
				
			},
			error:function(msg){
				console.log(msg)
			}
		})	
	}
	
	$("#addConfirm").click(function(){
		var classId=$("#selectClazz").val();
		var gradeId = $("#selectGrade").val();
		var collegeId = $("#selectCollege").val();
		var departmentId = $("#selectDepartment").val();
		var specialtyId = $("#selectSpecialty").val();
		var directionId = $("#selectDirection").val();
		//获取学生信息
		var name = $("#name").val();
		var no = $("#no").val();
		var sex = $("#sex").val();
		var qq = $("#qq").val();
		var telephone = $("#telephone").val();
		var email = $("#email").val();
		
		if(classId!="null"&&gradeId!="null"&&collegeId!="null"&&departmentId!="null"&&specialtyId!="null"&&directionId!="null"){
			$.ajax({
				type:"post",
				url:"<%=request.getContextPath()%>/student/addStudent.do",
				data:{"classId":classId,
					  "name":name,
					  "no":no,	 
					  "sex":sex,	 
					  "qq":qq,	 
					  "telephone":telephone,
					  "email":email
				},
				dataType:"text",
				success:function(data){
					if(data==1){
						$("#message").fadeIn();
					}
					 window.setTimeout(reload,2000);
					
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
			location.href="<%=request.getContextPath()%>/clazz/deleteClazz.do?id="+id;
		}
	}
</script>	
	
</body>
</html>