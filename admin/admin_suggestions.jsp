<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.text.SimpleDateFormat" %>
<%
    // 检查管理员登录状态
    String adminUsername = (String) session.getAttribute("adminUsername");
    if(adminUsername == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    // 获取过滤参数
    String topicFilter = request.getParameter("topic");
    if(topicFilter == null) topicFilter = "all";
    
    // 获取所有建议文件
    List<Map<String, String>> allSuggestions = new ArrayList<>();
    File dir = new File(application.getRealPath("/") + "WEB-INF/suggestions");
    
    if(dir.exists() && dir.isDirectory()) {
        File[] files = dir.listFiles(new FileFilter() {
            public boolean accept(File file) {
                return file.isFile() && file.getName().startsWith("suggestion_") && file.getName().endsWith(".txt");
            }
        });
        
        if(files != null) {
            // 按照文件修改时间排序（最新的在前面）
            Arrays.sort(files, new Comparator<File>() {
                public int compare(File f1, File f2) {
                    return Long.compare(f2.lastModified(), f1.lastModified());
                }
            });
            
            for(File file : files) {
                try {
                    Map<String, String> suggestion = new HashMap<>();
                    suggestion.put("fileName", file.getName());
                    
                    // 读取文件内容
                    BufferedReader reader = new BufferedReader(
                        new InputStreamReader(new FileInputStream(file), "UTF-8"));
                    String line;
                    StringBuilder contentBuilder = new StringBuilder();
                    
                    while((line = reader.readLine()) != null) {
                        contentBuilder.append(line).append("\n");
                        
                        if(line.startsWith("提交时间: ")) {
                            suggestion.put("time", line.substring(5).trim());
                        } else if(line.startsWith("姓名: ")) {
                            suggestion.put("name", line.substring(3).trim());
                        } else if(line.startsWith("主题: ")) {
                            suggestion.put("topic", line.substring(3).trim());
                        } else if(line.startsWith("喜爱的音乐类型: ")) {
                            suggestion.put("musicTypes", line.substring(8).trim());
                        } else if(line.startsWith("建议内容:")) {
                            StringBuilder suggestionContent = new StringBuilder();
                            while((line = reader.readLine()) != null) {
                                suggestionContent.append(line).append("\n");
                            }
                            suggestion.put("content", suggestionContent.toString().trim());
                            break;
                        }
                    }
                    reader.close();
                    
                    // 根据主题过滤
                    if("all".equals(topicFilter) || (suggestion.get("topic") != null && suggestion.get("topic").equals(topicFilter))) {
                        allSuggestions.add(suggestion);
                    }
                } catch(Exception e) {
                    // 文件读取错误，跳过该文件
                    continue;
                }
            }
        }
    }
    
    // 分页处理
    int pageSize = 5;
    int totalSuggestions = allSuggestions.size();
    int totalPages = (totalSuggestions + pageSize - 1) / pageSize;
    
    String pageStr = request.getParameter("page");
    int currentPage = 1;
    try {
        if(pageStr != null) {
            currentPage = Integer.parseInt(pageStr);
            if(currentPage < 1) currentPage = 1;
            if(currentPage > totalPages) currentPage = totalPages;
        }
    } catch(NumberFormatException e) {
        currentPage = 1;
    }
    
    int startIdx = (currentPage - 1) * pageSize;
    int endIdx = Math.min(startIdx + pageSize, totalSuggestions);
    
    // 当前页的建议
    List<Map<String, String>> currentPageSuggestions = new ArrayList<>();
    if(startIdx < totalSuggestions) {
        for(int i = startIdx; i < endIdx; i++) {
            currentPageSuggestions.add(allSuggestions.get(i));
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>管理员 - 建议管理 - 音乐红茶馆</title>
    <link rel="stylesheet" href="../common.css">
    <link rel="stylesheet" href="../music_suggestion/suggestion.css">
</head>
<body>
    <div class="container">
        <div class="header">
            <img src="../images/logo.png" alt="音乐红茶馆" class="logo">
            <h1>音乐红茶馆 - 管理员系统</h1>
        </div>
        
        <div class="nav">
            <table border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td><a href="../index.jsp">网站首页</a></td>
                    <td><a href="admin_home.jsp">管理首页</a></td>
                    <td><a href="admin_suggestions.jsp">建议管理</a></td>
                    <td><a href="logout.jsp">退出登录</a></td>
                </tr>
            </table>
        </div>
        
        <div class="content fade-in">
            <div class="suggestion-header">
                <h2>乐迷建议管理</h2>
                <p>欢迎，<%=adminUsername%>！您可以在这里查看和管理用户提交的建议。</p>
            </div>
            
            <div class="topic-filter">
                <form action="admin_suggestions.jsp" method="get">
                    <label for="topic">按主题筛选：</label>
                    <select id="topic" name="topic">
                        <option value="all" <%= "all".equals(topicFilter) ? "selected" : "" %>>全部主题</option>
                        <option value="网站功能" <%= "网站功能".equals(topicFilter) ? "selected" : "" %>>网站功能</option>
                        <option value="音乐内容" <%= "音乐内容".equals(topicFilter) ? "selected" : "" %>>音乐内容</option>
                        <option value="音乐推荐" <%= "音乐推荐".equals(topicFilter) ? "selected" : "" %>>音乐推荐</option>
                        <option value="其他" <%= "其他".equals(topicFilter) ? "selected" : "" %>>其他</option>
                    </select>
                    <button type="submit" class="btn">筛选</button>
                </form>
            </div>
            
            <% if(currentPageSuggestions.isEmpty()) { %>
                <div class="suggestion-info">
                    <p>暂无符合条件的建议。</p>
                </div>
            <% } else { %>
                <ul class="suggestion-list">
                    <% for(Map<String, String> suggestion : currentPageSuggestions) { %>
                        <li class="suggestion-item">
                            <div class="suggestion-header-info">
                                <div>
                                    <strong><%= suggestion.get("name") %></strong>
                                    <span class="suggestion-topic-tag"><%= suggestion.get("topic") %></span>
                                </div>
                                <div class="save-time"><%= suggestion.get("time") %></div>
                            </div>
                            <div class="suggestion-content"><%= suggestion.get("content") %></div>
                            <div style="margin-top: 10px;">
                                <strong>喜爱的音乐类型：</strong> <%= suggestion.get("musicTypes") %>
                            </div>
                        </li>
                    <% } %>
                </ul>
                
                <% if(totalPages > 1) { %>
                    <div class="pagination">
                        <% if(currentPage > 1) { %>
                            <a href="?topic=<%= topicFilter %>&page=<%= currentPage - 1 %>">上一页</a>
                        <% } %>
                        
                        <% 
                        int startPage = Math.max(1, currentPage - 2);
                        int endPage = Math.min(startPage + 4, totalPages);
                        for(int i = startPage; i <= endPage; i++) { 
                        %>
                            <a href="?topic=<%= topicFilter %>&page=<%= i %>" <%= i == currentPage ? "class=\"active\"" : "" %>><%= i %></a>
                        <% } %>
                        
                        <% if(currentPage < totalPages) { %>
                            <a href="?topic=<%= topicFilter %>&page=<%= currentPage + 1 %>">下一页</a>
                        <% } %>
                    </div>
                <% } %>
            <% } %>
        </div>
        
        <div class="footer">
            <p>© 2025 音乐红茶馆 版权所有</p>
        </div>
    </div>
</body>
</html>
