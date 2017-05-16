<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="s" uri="/struts-tags" %>  
<%@ page import="information.dao.*,information.bean.User" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
<head>  
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
	<title>图书馆：首页</title>
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
        	<a class="navbar-text" href="#">我一生的嗜好，除了革命之外，就是读书，我一天不读书，就不能够生活。              ———孙中山</a>
    	</div>
    	<div align="right">
    	
        <button type="button" class="btn btn-default navbar-btn" data-toggle="modal" data-target="#myModal"">
            <span class="glyphicon glyphicon-plus"></span>添加
        </button>
        
        </div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					添加图书
				</h4>
			</div>
			
			<div class="modal-body">
				<div align="center" style="padding: 10px 100px 10px;"> 
    			<div class="panel-body" style="font-size:30px">添加图书</div>  
        		<s:form action="add" method="post">
        			<div class="form-group" align="center">
               			<input name="user.ISBN" type="text" class="form-control" placeholder="图书编号" required="true"/>
            		</div>  
            		<div class="form-group" align="center">
               			<input name="user.Title" type="text" class="form-control" placeholder="题目" required="true"/>
            		</div>  
            		<div class="form-group" align="center">
               			<input name="user.Name" type="text" class="form-control" placeholder="作者" required="true"/>
            		</div>  
            		<div class="form-group" align="center">
               			<input name="user.Age" type="text" class="form-control" placeholder="年龄"/>
            		</div>  
            		<div class="form-group" align="center">
               			<input name="user.Country" type="text" class="form-control" placeholder="生活城市"/>
            		</div>  
            		<div class="form-group" align="center">
               			<input name="user.Publisher" type="text" class="form-control" placeholder="出版社"/>
            		</div> 
            		<div class="form-group" align="center">
               			<input name="user.PublishDate" type="text" class="form-control" placeholder="出版日期"/>
            		</div>
            		<div class="form-group" align="center">
               			<input name="user.Price" type="text" class="form-control" placeholder="价格"/>
            		</div>      
            		<div align="center">
            			<input type="submit" value="添加" class="btn btn-default navbar-btn" />
        			</div>
        		</s:form>  
</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
			</div>
		</div>
	</div>
</div>
        
        
    </div>
	</div>
</nav>
    <div align="center">
        <div class="panel-body" style="font-size:30px">图书馆</div>
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
            	<s:iterator value="userList">  
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