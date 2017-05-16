<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="s" uri="/struts-tags" %>  
<%@ page import="information.dao.*,information.bean.User" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
	<title>图书馆：详细信息</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">  
    .br_TR{  
        background-color:expression(this.rowIndex%2==0?"#CCFFFF":"FFFFCC");  
        corhur:hand;  
    }  
      
    .br_head{  
        backgroun-color:"#CCFFDD";  
    }  
</style>  
</head>  
<body>
<div class="container">
    <div align="center">
        <h3><font color="blue">详细信息列表</font></h3>  
        <table class="table table-striped"> 
        	<thead>
        		<tr>
        			<th style="text-align:center;font-size:25px">图书编号</th> 
        			<td align="center" style="font-size:20px;font-family:SimHei"><s:property value="ISBN" /></td>
        		</tr>
        	</thead>
        	<thead>
        		<tr>
        			<th style="text-align:center;font-size:25px">题目</th> 
        			<td align="center" style="font-size:20px;font-family:SimHei"><s:property value="user.Title" /></td>
        		</tr>
        	</thead>
        	<thead>
        		<tr>
        			<th style="text-align:center;font-size:25px">作者</th> 
        			<td align="center" style="font-size:20px;font-family:SimHei"><s:property value="user.Name" /></td>
        		</tr>
        	</thead>
        	<thead>
        		<tr>
        			<th style="text-align:center;font-size:25px">年龄</th> 
        			<td align="center" style="font-size:20px;font-family:SimHei"><s:property value="user.Age" /></td>
        		</tr>
        	</thead>
        	<thead>
        		<tr>
        			<th style="text-align:center;font-size:25px">生活城市</th> 
        			<td align="center" style="font-size:20px;font-family:SimHei"><s:property value="user.Country" /></td>
        		</tr>
        	</thead>
        	<thead>
        		<tr>
        			<th style="text-align:center;font-size:25px">出版社</th> 
        			<td align="center" style="font-size:20px;font-family:SimHei"><s:property value="user.Publisher" /></td>
        		</tr>
        	</thead>
        	<thead>
        		<tr>
        			<th style="text-align:center;font-size:25px">出版日期</th> 
        			<td align="center" style="font-size:20px;font-family:SimHei"><s:property value="user.PublishDate" /></td>
        		</tr>
        	</thead>
        	<thead>
        		<tr>
        			<th style="text-align:center;font-size:25px">价格</th> 
        			<td align="center" style="font-size:20px;font-family:SimHei"><s:property value="user.Price" /></td>
        		</tr>
        	</thead>
        </table>
        <table width="620">  
            	<tr>
            		<td align="center"><input type="button" name="submit" value="返回" onclick="location.href='Book.action'" ></td>
            	</tr>  
        </table> 
    </div>
</div>  
</body>  
</html>  