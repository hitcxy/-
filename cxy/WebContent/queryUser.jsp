<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="s" uri="/struts-tags" %>  
<%@ page import="information.dao.*,information.bean.User" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>图书馆：查询</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
<nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid">
    <div>
        <form action="query" method="post" class="navbar-form navbar-left" role="search">
            <div class="form-group">
               <input name="name" type="text" class="form-control" placeholder="请输入作者姓名"/>
            </div>
            <button type="submit" class="btn btn-default btn-sm">
            	<span class="glyphicon glyphicon-search"></span>search
            </button>
        </form>
        <div align="right">
        	<a class="navbar-text" href="#">半亩方塘一鉴开，天光月影共徘徊。问渠那得清如许，为有源头活水来。（宋 朱熹《观书有感》）</a>
    	</div>
    	<div align="right">
        <button type="button" class="btn btn-default navbar-btn" onclick="location.href='Book.action'">
            <span class="glyphicon glyphicon-hand-left"></span>back
        </button>
        </div>
    </div>
	</div>
</nav>
	<div align="center">
        <table class="table table-striped">  
            <thead>
            	<tr>
            		<th style="text-align:center;font-size:30px">图书编号</th>
                	<th style="text-align:center;font-size:30px">题目</th>
                	<th style="text-align:center;font-size:30px">作者</th>
                	<th style="text-align:center;font-size:30px">出版社</th>
                	<th style="text-align:center;font-size:30px">出版日期</th>
                	<th style="text-align:center;font-size:30px">价格</th>
                	<th style="text-align:center;font-size:30px">修改</th>  
                	<th style="text-align:center;font-size:30px">删除</th> 
                </tr>
            </thead>
            
           	<tbody>
            	<s:iterator value="bookList">  
               		<tr>  
                		<td style="font-size:20px;font-family:SimHei" align="center"><s:property value="ISBN" /></td> 
                		<td style="font-size:20px;font-family:SimHei" align="center"><a href="detail.action?ISBN=<s:property value="ISBN"/>"><s:property value="Title" /></a></td>  
                    	<td style="font-size:20px;font-family:SimHei" align="center"><s:property value="Name" /></td>
                    	<td style="font-size:20px;font-family:SimHei" align="center"><s:property value="Publisher" /></td>   
                    	<td style="font-size:20px;font-family:SimHei" align="center"><s:property value="PublishDate" /></td>  
                    	<td style="font-size:20px;font-family:SimHei" align="center"><s:property value="Price" /></td> 
                    	<td style="font-size:20px;font-family:SimHei" align="center"><a href="toupdate.action?ISBN=<s:property value="ISBN"/>"><span class="glyphicon glyphicon-pencil"></span></a></td>
                    	<td style="font-size:20px;font-family:SimHei" align="center"><a href="delete.action?ISBN=<s:property value="ISBN"/>"><span class="glyphicon glyphicon-trash"></span></a></td>  
                	</tr>  
            	</s:iterator>
            </tbody>  
        </table>  
	</div>
</div>
</body>
</html>