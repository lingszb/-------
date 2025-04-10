<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // 清除session中的管理员登录标记
    session.removeAttribute("adminLoggedIn");
    
    // 重定向到登录页面
    response.sendRedirect("login.jsp");
%>
