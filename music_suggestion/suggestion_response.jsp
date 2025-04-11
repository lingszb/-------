<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // 从session中获取数据
    String name = (String)session.getAttribute("name");
    String email = (String)session.getAttribute("email");
    String topic = (String)session.getAttribute("topic");
    String suggestion = (String)session.getAttribute("suggestion");
    String musicTypes = (String)session.getAttribute("musicTypes");
    Boolean isValid = (Boolean)session.getAttribute("isValid");
    String errorMessage = (String)session.getAttribute("errorMessage");
    Boolean suggestionSaved = (Boolean)session.getAttribute("suggestionSaved");
    String savedTime = (String)session.getAttribute("savedTime");
    String saveError = (String)session.getAttribute("saveError");
    
    // 清除session中的数据
    // session.removeAttribute("name");
    // session.removeAttribute("email");
    // session.removeAttribute("topic");
    // session.removeAttribute("suggestion");
    // session.removeAttribute("musicTypes");
    // session.removeAttribute("isValid");
    // session.removeAttribute("errorMessage");
    // session.removeAttribute("suggestionSaved");
    // session.removeAttribute("savedTime");
    // session.removeAttribute("saveError");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>建议反馈 - 音乐红茶馆</title>
    <link rel="stylesheet" href="../common.css">
    <link rel="stylesheet" href="suggestion.css">
    <script src="../player.js" defer></script>
</head>
<body>
    <div class="container">
        <div class="header">
            <img src="../images/logo.png" alt="音乐红茶馆" class="logo">
            <h1>音乐红茶馆</h1>
        </div>
        
        <div class="nav">
            <table border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td><a href="../index.jsp">首页</a></td>
                    <td><a href="../music_theme/electronic.jsp">音乐主题</a></td>
                    <td><a href="../music_appreciation/classical.jsp">音乐品鉴</a></td>
                    <td><a href="suggestion_form.jsp">乐迷建议</a></td>
                </tr>
            </table>
        </div>
        
        <div class="content fade-in">
            <div class="suggestion-header">
                <h2>建议反馈</h2>
            </div>
            
            <% if(isValid != null && isValid) { %>
                <div class="response-message success">
                    <h3>感谢您的建议！</h3>
                    <p>我们已经收到您的反馈，并将尽快处理。</p>
                    
                    <% if(suggestionSaved != null) { %>
                        <% if(suggestionSaved) { %>
                            <p class="save-success">您的建议已成功保存于系统中！</p>
                            <p class="save-time">提交时间：<%= savedTime %></p>
                        <% } else { %>
                            <p class="save-error">抱歉，保存建议时遇到问题：<%= saveError %></p>
                        <% } %>
                    <% } %>
                </div>
                
                <div class="suggestion-form">
                    <h3>您的建议详情</h3>
                    <table class="suggestion-detail-table">
                        <tr>
                            <td>姓名</td>
                            <td><%= name %></td>
                        </tr>
                        <tr>
                            <td>电子邮箱</td>
                            <td><%= email %></td>
                        </tr>
                        <tr>
                            <td>主题</td>
                            <td><span class="suggestion-topic-tag"><%= topic %></span></td>
                        </tr>
                        <tr>
                            <td>喜爱的音乐类型</td>
                            <td><%= musicTypes %></td>
                        </tr>
                        <tr>
                            <td>建议内容</td>
                            <td><div class="suggestion-content"><%= suggestion %></div></td>
                        </tr>
                    </table>
                    
                    <div style="margin-top: 20px;">
                        <a href="suggestion_form.jsp" class="btn">提交新建议</a>
                        <a href="../index.jsp" class="btn btn-secondary">返回首页</a>
                    </div>
                </div>
            <% } else { %>
                <div class="response-message error">
                    <h3>提交失败</h3>
                    <p><%= errorMessage %></p>
                    <div style="margin-top: 20px;">
                        <a href="javascript:history.back()" class="btn">返回修改</a>
                    </div>
                </div>
            <% } %>
        </div>
        
        <div class="footer">
            <p>© 2025 音乐红茶馆 版权所有</p>
        </div>
    </div>
</body>
</html>
