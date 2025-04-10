<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // 检查是否已经提交登录表单
    String error = null;
    if ("POST".equals(request.getMethod())) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        // 这里使用一个简单的用户名和密码，实际应用中应该使用数据库存储和加密密码
        if ("admin".equals(username) && "123456".equals(password)) {
            // 登录成功，设置session
            session.setAttribute("adminLoggedIn", true);
            // 重定向到管理页面
            response.sendRedirect("view_suggestions.jsp");
            return;
        } else {
            error = "用户名或密码错误";
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>管理员登录 - 音乐红茶馆</title>
    <link rel="stylesheet" href="../common.css">
    <link rel="stylesheet" href="admin.css">
    <style>
        .login-container {
            max-width: 400px;
            margin: 50px auto;
            padding: 25px;
            background-color: white;
            border-radius: 5px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }
        
        .login-header {
            text-align: center;
            margin-bottom: 25px;
        }
        
        .login-form .form-group {
            margin-bottom: 15px;
        }
        
        .login-form label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        
        .login-form input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
        }
        
        .login-form .login-btn {
            width: 100%;
            padding: 10px;
            background-color: #8B4513;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
        }
        
        .login-form .login-btn:hover {
            background-color: #6b4226;
        }
        
        .error-message {
            color: #721c24;
            background-color: #f8d7da;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 4px;
            text-align: center;
        }
        
        .back-link {
            text-align: center;
            margin-top: 15px;
        }
        
        .back-link a {
            color: #6c757d;
            text-decoration: none;
        }
        
        .back-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <img src="../images/logo.png" alt="音乐红茶馆" class="logo">
            <h1>音乐红茶馆 - 管理后台</h1>
        </div>
        
        <div class="content fade-in">
            <div class="login-container">
                <div class="login-header">
                    <h2>管理员登录</h2>
                    <p>请输入您的管理员凭据</p>
                </div>
                
                <% if (error != null) { %>
                    <div class="error-message">
                        <%= error %>
                    </div>
                <% } %>
                
                <form action="login.jsp" method="post" class="login-form">
                    <div class="form-group">
                        <label for="username">用户名</label>
                        <input type="text" id="username" name="username" required autofocus>
                    </div>
                    
                    <div class="form-group">
                        <label for="password">密码</label>
                        <input type="password" id="password" name="password" required>
                    </div>
                    
                    <button type="submit" class="login-btn">登录</button>
                </form>
                
                <div class="back-link">
                    <a href="../index.jsp">返回网站首页</a> | 
                    <a href="../music_suggestion/suggestion_form.jsp">返回乐迷建议</a>
                </div>
            </div>
        </div>
        
        <div class="footer">
            <p>© 2025 音乐红茶馆 管理系统</p>
        </div>
    </div>
</body>
</html>
