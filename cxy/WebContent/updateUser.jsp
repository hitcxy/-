<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<%@ page import="information.dao.*,information.bean.User" %>  
      
<%@ taglib prefix="s" uri="/struts-tags" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
<head>  
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">  
	<title>图书馆：修改</title>
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>  
</head>  
<body>  
    <div align="center" style="padding: 10px 560px;">  
        <div class="panel-body" style="font-size:30px">修改信息</div>
        <s:form action="update" method="post" class="form-horizontal" role="form">
        	
        	<div class="form-group" align="center" >
        	 	<label for="1" class="control-label" style="font-size:14px;">图书编号</label>
                <input name="ISBN" type="text" class="form-control" id="1" readonly="true" value="${user.ISBN}"/>
            </div>
            <div class="form-group" align="center">
            	<label for="2" class="control-label" style="font-size:14px;">题目</label>
                <input name="user.Title" type="text" class="form-control" id="2" readonly="true" value="${user.title}"/>
            </div>  
            <div class="form-group" align="center">
            	<label for="3" class="control-label" style="font-size:14px;">作者</label>
                <input name="user.Name" type="text" class="form-control" id="3" value="${user.name}" required="true"/>
            </div> 
             
            <div class="form-group" align="center">
            	<label for="4" class="control-label" style="font-size:14px;">年龄</label>
                <input name="user.Age" type="text" class="form-control" id="4" value="${user.age}"/>
            </div>  
            <div class="form-group" align="center">
            	<label for="5" class="control-label" style="font-size:14px;">生活城市</label>
                <input name="user.Country" type="text" class="form-control" id="5" value="${user.country}"/>
            </div>  
            <div class="form-group" align="center">
            	<label for="6" class="control-label" style="font-size:14px;">出版社</label>
                <input name="user.Publisher" type="text" class="form-control" id="6" value="${user.publisher}"/>
            </div> 
            <div class="form-group" align="center">
            	<label for="7" class="control-label" style="font-size:14px;">出版日期</label>
                <input name="user.PublishDate" type="text" class="form-control" id="7" value="${user.publishDate}"/>
            </div>
            <div class="form-group" align="center">
            	<label for="8" class="control-label" style="font-size:14px;">价格</label>
                <input name="user.Price" type="text" class="form-control" id="8" value="${user.price}"/>
            </div>     
            <div align="center">
            	<input type="submit" value="修改" class="btn btn-default navbar-btn" />
        	</div>
        </s:form> 
    </div>  
</body>  
</html>