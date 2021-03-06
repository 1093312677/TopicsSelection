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
	                            学生详细信息 
	    </div>
    </div>
    <div class="container">
    	<div class="row">
    	<!-- 基本信息区域 -->
    		<div class="col-md-6">
	    		<div class="panel panel-default" style="margin-top:25px;">
				    <c:forEach items="${students }" var="items">
				    	<div class="panel-heading">
					        <h3 class="panel-title"><c:out value="${items.name }"></c:out></h3>
					    </div>
					    <table class="table">
					        <tr><td>性别</td><td><c:out value="${items.sex }"></c:out></td></tr>
					        <tr><td>学号</td><td><c:out value="${items.no }"></c:out></td></tr>
					    	
					    	<tr><td>电话</td><td><c:out value="${items.telephone }"></c:out></td></tr>
					    	<tr><td>邮箱</td><td><c:out value="${items.email }"></c:out></td></tr>
						    <tr><td>QQ</td><td><c:out value="${items.qq }"></c:out></td></tr>
						    <tr><td>学院</td><td><c:out value="${items.clazz.direction.spceialty.grade.department.college.collegeName }"></c:out></td></tr>
						    <tr><td>系</td><td><c:out value="${items.clazz.direction.spceialty.grade.department.departmentName  }"></c:out></td></tr>
						    <tr><td>年级</td><td><c:out value="${items.clazz.direction.spceialty.grade.gradeName  }"></c:out></td></tr>
						    <tr><td>专业</td><td><c:out value="${items.clazz.direction.spceialty.specialtyName  }"></c:out></td></tr>
						    <tr><td>方向</td><td><c:out value="${items.clazz.direction.directionName  }"></c:out></td></tr>
						    <tr><td>班级</td><td><c:out value="${items.clazz.className  }"></c:out></td></tr>
					    </table>
				    </c:forEach>
			  	</div>
			  </div>
		<!-- /基本信息区域 -->
		
		<!-- 课程成绩信息区域 -->	  
			  <div class="col-md-6">
    				<div class="panel panel-default" style="margin-top:25px;">
    					<div class="panel-heading">
					        <h3 class="panel-title">课程成绩 (平均分  ${average } )</h3>
					    </div>
					    <c:forEach items="${courseAndGrades }" var="items">
						    <table class="table" >
						        <tr >
							        <td >
							      		<c:out value="${items.courseName }"></c:out>
							        </td>
							        <td align="right">
							       		<c:out value="${items.score }"></c:out>
							        </td>
							    </tr>
						    </table>
					    </c:forEach>
				  	</div>
    		  </div>
    	<!-- /课程成绩信息区域 -->	
    	
    </div>		
    
<script>
	$(function () { $("[data-toggle='tooltip']").tooltip(); });
</script>	
	
</body>
</html>