<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2021/1/12
  Time: 14:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>个人中心</title>
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
</head>
<body style="background-color:#f2f9fd;">
<div class="header bg-main">
    <div class="logo margin-big-left fadein-top">
        <h1><img src="images/y.jpg" class="radius-circle rotate-hover" height="50" alt="" />个人中心</h1>
    </div>
    <div class="head-l"><a class="button button-little bg-green" href="login.html" target="_blank"><span class="icon-home"></span> 登陆首页</a> &nbsp;&nbsp;<a href="##" class="button button-little bg-blue"><span class="icon-wrench"></span> 清除缓存</a> &nbsp;&nbsp;<a class="button button-little bg-red" href="login.html"><span class="icon-power-off"></span> 退出登录</a> </div>
</div>
<div class="leftnav">
    <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
    <h2><span class="icon-user"></span>基本信息</h2>
    <ul style="display:block">
        <li><a href="infoInit?id=<%=request.getParameter("id")%>" target="right"><span class="icon-caret-right"></span>个人信息</a></li>
        <li><a href="passInit?id=<%=request.getParameter("id")%>" target="right"><span class="icon-caret-right"></span>修改密码</a></li>

    </ul>
    <h2><span class="icon-pencil-square-o"></span>楼盘管理</h2>
    <ul>
        <li><a href="myLPInit?id=<%=request.getParameter("id")%>" target="right"><span class="icon-caret-right"></span>我的楼盘</a></li>
        <li><a href="loupanInit?mark=c&id=<%=request.getParameter("id")%>" target="right"><span class="icon-caret-right"></span>购买楼盘</a></li>

    </ul>
</div>
<script type="text/javascript">
    $(function(){
        $(".leftnav h2").click(function(){
            $(this).next().slideToggle(200);
            $(this).toggleClass("on");
        })
        $(".leftnav ul li a").click(function(){
            $("#a_leader_txt").text($(this).text());
            $(".leftnav ul li a").removeClass("on");
            $(this).addClass("on");
        })
    });
</script>
<ul class="bread">
    <li><a href="{:U('Index/info')}" target="right" class="icon-home"> 首页</a></li>
    <li><a href="##" id="a_leader_txt">网站信息</a></li>
    <li><b>当前语言：</b><span style="color:red;">中文</php></span>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;切换语言：<a href="##">中文</a> &nbsp;&nbsp;<a href="##">英文</a> </li>
</ul>
<div class="admin">
    <iframe scrolling="auto" rameborder="0" src="infoInit?id=<%=request.getParameter("id")%>" name="right" width="100%" height="100%"></iframe>
</div>
<div style="text-align:center;">
    <p>来源:<a href="http://down.admin5.com/" target="_blank">A5源码</a></p>
</div>
</body>
</html>
