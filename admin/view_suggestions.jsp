<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.text.SimpleDateFormat" %>
<%
    // 检查管理员是否已登录
    Boolean adminLoggedIn = (Boolean)session.getAttribute("adminLoggedIn");
    if (adminLoggedIn == null || !adminLoggedIn) {
        // 如果未登录，重定向到登录页面
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>乐迷建议管理 - 音乐红茶馆</title>
    <link rel="stylesheet" href="../../common.css">
    <link rel="stylesheet" href="../suggestion.css">
    <link rel="stylesheet" href="admin.css">
</head>
<body>
    <%
        // 获取建议文件目录
        String suggestionsPath = application.getRealPath("/") + "WEB-INF/suggestions";
        File suggestionsDir = new File(suggestionsPath);
        
        // 存储所有建议文件的列表
        List<Map<String, String>> suggestionsList = new ArrayList<>();
        
        if(suggestionsDir.exists() && suggestionsDir.isDirectory()) {
            // 获取所有建议文件
            File[] files = suggestionsDir.listFiles(new FilenameFilter() {
                public boolean accept(File dir, String name) {
                    return name.startsWith("suggestion_") && name.endsWith(".txt");
                }
            });
            
            // 按照修改时间排序文件（最新的在前）
            if(files != null) {
                Arrays.sort(files, new Comparator<File>() {
                    public int compare(File f1, File f2) {
                        return Long.compare(f2.lastModified(), f1.lastModified());
                    }
                });
                
                // 读取每个文件的内容
                for(File file : files) {
                    Map<String, String> suggestionData = new HashMap<>();
                    suggestionData.put("fileName", file.getName());
                    suggestionData.put("lastModified", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date(file.lastModified())));
                    
                    try {
                        // 使用InputStreamReader并指定UTF-8编码
                        FileInputStream fis = new FileInputStream(file);
                        InputStreamReader isr = new InputStreamReader(fis, "UTF-8");
                        BufferedReader reader = new BufferedReader(isr);
                        
                        String line;
                        StringBuilder content = new StringBuilder();
                        String submissionTime = "";
                        String userName = "";
                        String userEmail = "";
                        String topic = "";
                        String musicTypes = "";
                        StringBuilder suggestionContent = new StringBuilder();
                        
                        boolean isReadingSuggestion = false;
                        
                        while((line = reader.readLine()) != null) {
                            content.append(line).append("\n");
                            
                            if(line.startsWith("提交时间:")) {
                                submissionTime = line.substring(line.indexOf(":") + 1).trim();
                            } else if(line.startsWith("姓名:")) {
                                userName = line.substring(line.indexOf(":") + 1).trim();
                            } else if(line.startsWith("邮箱:")) {
                                userEmail = line.substring(line.indexOf(":") + 1).trim();
                            } else if(line.startsWith("主题:")) {
                                topic = line.substring(line.indexOf(":") + 1).trim();
                            } else if(line.startsWith("喜爱的音乐类型:")) {
                                musicTypes = line.substring(line.indexOf(":") + 1).trim();
                            } else if(line.startsWith("建议内容:")) {
                                isReadingSuggestion = true;
                                continue;
                            } else if(isReadingSuggestion) {
                                suggestionContent.append(line).append("\n");
                            }
                        }
                        
                        reader.close();
                        isr.close();
                        fis.close();
                        
                        suggestionData.put("content", content.toString());
                        suggestionData.put("submissionTime", submissionTime);
                        suggestionData.put("userName", userName);
                        suggestionData.put("userEmail", userEmail);
                        suggestionData.put("topic", topic);
                        suggestionData.put("musicTypes", musicTypes);
                        suggestionData.put("suggestionContent", suggestionContent.toString().trim());
                        
                        suggestionsList.add(suggestionData);
                        
                    } catch(IOException e) {
                        suggestionData.put("error", "无法读取文件: " + e.getMessage());
                        suggestionsList.add(suggestionData);
                    }
                }
            }
        }
        
        // 获取过滤条件
        String topicFilter = request.getParameter("topic");
        
        // 日期排序方式
        String sortOrder = request.getParameter("sort");
        final boolean sortAscending = "asc".equals(sortOrder);
        
        // 应用过滤
        List<Map<String, String>> filteredList = new ArrayList<>();
        if(topicFilter != null && !topicFilter.isEmpty()) {
            for(Map<String, String> suggestion : suggestionsList) {
                if(suggestion.get("topic").contains(topicFilter)) {
                    filteredList.add(suggestion);
                }
            }
        } else {
            filteredList.addAll(suggestionsList);
        }
        
        // 应用排序
        if(sortOrder != null) {
            Collections.sort(filteredList, new Comparator<Map<String, String>>() {
                public int compare(Map<String, String> s1, Map<String, String> s2) {
                    String date1 = s1.get("submissionTime");
                    String date2 = s2.get("submissionTime");
                    return sortAscending ? date1.compareTo(date2) : date2.compareTo(date1);
                }
            });
        }
    %>

    <div class="container">
        <div class="header">
            <h1>音乐红茶馆 - 管理后台</h1>
        </div>
        
        <div class="admin-nav">
            <a href="../index.jsp" class="admin-nav-item">返回网站首页</a>
            <span class="admin-nav-separator">|</span>
            <a href="../music_suggestion/suggestion_form.jsp" class="admin-nav-item">返回乐迷建议</a>
            <span class="admin-nav-separator">|</span>
            <a href="view_suggestions.jsp" class="admin-nav-item active">查看乐迷建议</a>
            <span class="admin-nav-separator">|</span>
            <a href="logout.jsp" class="admin-nav-item logout">退出登录</a>
        </div>
        
        <div class="content fade-in">
            <% 
                // 显示回复操作的结果信息
                Boolean replySuccess = (Boolean)session.getAttribute("replySuccess");
                String replyMessage = (String)session.getAttribute("replyMessage");
                
                if(replyMessage != null && !replyMessage.isEmpty()) {
                    String alertClass = (replySuccess != null && replySuccess) ? "flash-success" : "flash-error";
            %>
                <div class="flash-message <%= alertClass %>">
                    <%= replyMessage %>
                    <span class="close-flash" onclick="this.parentElement.style.display='none';">&times;</span>
                </div>
            <%
                    // 清除session中的消息
                    session.removeAttribute("replySuccess");
                    session.removeAttribute("replyMessage");
                }
            %>
            
            <div class="admin-header">
                <h2>乐迷建议管理</h2>
                <p>共有 <%= filteredList.size() %> 条建议</p>
            </div>
            
            <div class="admin-filters">
                <form action="view_suggestions.jsp" method="get">
                    <div class="filter-group">
                        <label for="topic">按主题过滤：</label>
                        <select id="topic" name="topic">
                            <option value="" <%= (topicFilter == null || topicFilter.isEmpty()) ? "selected" : "" %>>全部</option>
                            <option value="网站功能" <%= "网站功能".equals(topicFilter) ? "selected" : "" %>>网站功能</option>
                            <option value="音乐内容" <%= "音乐内容".equals(topicFilter) ? "selected" : "" %>>音乐内容</option>
                            <option value="音乐推荐" <%= "音乐推荐".equals(topicFilter) ? "selected" : "" %>>音乐推荐</option>
                            <option value="其他" <%= "其他".equals(topicFilter) ? "selected" : "" %>>其他</option>
                        </select>
                    </div>
                    
                    <div class="filter-group">
                        <label for="sort">排序方式：</label>
                        <select id="sort" name="sort">
                            <option value="desc" <%= (sortOrder == null || "desc".equals(sortOrder)) ? "selected" : "" %>>最新优先</option>
                            <option value="asc" <%= "asc".equals(sortOrder) ? "selected" : "" %>>最早优先</option>
                        </select>
                    </div>
                    
                    <button type="submit" class="filter-btn">应用过滤</button>
                    <a href="view_suggestions.jsp" class="reset-btn">重置</a>
                </form>
            </div>
            
            <% if(filteredList.isEmpty()) { %>
                <div class="no-data">
                    <p>暂无建议数据</p>
                </div>
            <% } else { %>
                <div class="suggestions-list">
                    <% for(Map<String, String> suggestion : filteredList) { %>
                        <div class="suggestion-item">
                            <div class="suggestion-meta">
                                <div class="submission-info">
                                    <strong>提交时间：</strong> <%= suggestion.get("submissionTime") %><br>
                                    <strong>主题：</strong> <%= suggestion.get("topic") %>
                                </div>
                                <div class="user-info">
                                    <strong>姓名：</strong> <%= suggestion.get("userName") %><br>
                                    <strong>邮箱：</strong> <%= suggestion.get("userEmail") %>
                                </div>
                            </div>
                            
                            <div class="suggestion-details">
                                <div class="music-preferences">
                                    <strong>喜爱的音乐类型：</strong> <%= suggestion.get("musicTypes") %>
                                </div>
                                <div class="suggestion-content">
                                    <strong>建议内容：</strong>
                                    <p><%= suggestion.get("suggestionContent").replace("\n", "<br>") %></p>
                                </div>
                            </div>
                            
                            <div class="suggestion-actions">
                                <button class="action-btn mark-read" onclick="markAsRead(this)">标记为已读</button>
                                <button class="action-btn reply-btn" onclick="showReplyForm(this)">回复</button>
                            </div>
                            
                            <div class="reply-form" style="display: none;">
                                <form action="process_reply.jsp" method="post" class="reply-form-content">
                                    <input type="hidden" name="suggestionFile" value="<%= suggestion.get("fileName") %>">
                                    <input type="hidden" name="userEmail" value="<%= suggestion.get("userEmail") %>">
                                    <input type="hidden" name="userName" value="<%= suggestion.get("userName") %>">
                                    <textarea name="replyContent" placeholder="输入回复内容..." required></textarea>
                                    <div class="reply-actions">
                                        <button type="submit">发送回复</button>
                                        <button type="button" onclick="cancelReply(this)">取消</button>
                                    </div>
                                </form>
                            </div>
                            
                            <% 
                                // 显示已有的回复记录
                                String replyFilePath = suggestionsPath + "/replies/" + suggestion.get("fileName") + ".reply";
                                File replyFile = new File(replyFilePath);
                                if(replyFile.exists() && replyFile.isFile()) {
                                    try {
                                        // 使用UTF-8编码读取回复文件
                                        FileInputStream replyFis = new FileInputStream(replyFile);
                                        InputStreamReader replyIsr = new InputStreamReader(replyFis, "UTF-8");
                                        BufferedReader replyReader = new BufferedReader(replyIsr);
                                        
                                        String replyLine;
                                        while((replyLine = replyReader.readLine()) != null) {
                                            if(replyLine.startsWith("REPLY:")) {
                                                String[] replyData = replyLine.substring(6).split("\\|\\|");
                                                if(replyData.length >= 2) {
                                                    String replyTime = replyData[0];
                                                    String replyContent = replyData[1];
                                                    %>
                                                    <div class="reply-record">
                                                        <strong>已回复：</strong>
                                                        <span class="reply-time"><%= replyTime %></span>
                                                        <p class="reply-content"><%= replyContent.replace("\\n", "<br>") %></p>
                                                    </div>
                                                    <%
                                                }
                                            }
                                        }
                                        replyReader.close();
                                        replyIsr.close();
                                        replyFis.close();
                                    } catch(IOException e) {
                                        out.println("<div class='error-message'>无法读取回复记录: " + e.getMessage() + "</div>");
                                    }
                                }
                            %>
                        </div>
                    <% } %>
                </div>
            <% } %>
        </div>
        
        <div class="footer">
            <p>© 2025 音乐红茶馆 管理系统</p>
        </div>
    </div>
    
    <script>
        function markAsRead(btn) {
            let item = btn.closest('.suggestion-item');
            item.classList.toggle('read');
            if(item.classList.contains('read')) {
                btn.textContent = "标记为未读";
                btn.classList.add('marked');
            } else {
                btn.textContent = "标记为已读";
                btn.classList.remove('marked');
            }
        }
        
        function showReplyForm(btn) {
            let item = btn.closest('.suggestion-item');
            let form = item.querySelector('.reply-form');
            form.style.display = 'block';
            btn.disabled = true;
        }
        
        function cancelReply(btn) {
            // 修复取消回复功能
            const replyForm = btn.closest('.reply-form');
            const textarea = replyForm.querySelector('textarea');
            
            // 先隐藏表单
            replyForm.style.display = 'none';
            
            // 清空内容
            if (textarea) {
                textarea.value = '';
            }
            
            // 找到对应的建议项并启用回复按钮
            const item = replyForm.closest('.suggestion-item');
            const replyBtn = item.querySelector('.reply-btn');
            if (replyBtn) {
                replyBtn.disabled = false;
            }
        }
    </script>
</body>
</html>
``` 
