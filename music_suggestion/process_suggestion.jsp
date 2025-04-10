<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.text.SimpleDateFormat" %>
<%
    // 设置请求的字符编码为UTF-8
    request.setCharacterEncoding("UTF-8");

    // 获取表单数据
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String topic = request.getParameter("topic");
    String suggestion = request.getParameter("suggestion");
    String[] musicTypes = request.getParameterValues("musicType");
    String otherMusicText = request.getParameter("otherMusicText");
    
    // 表单验证
    boolean isValid = true;
    String errorMessage = "";
    
    if(name == null || name.trim().isEmpty()) {
        isValid = false;
        errorMessage = "姓名不能为空";
    } else if(email == null || email.trim().isEmpty()) {
        isValid = false;
        errorMessage = "邮箱不能为空";
    } else if(suggestion == null || suggestion.trim().isEmpty()) {
        isValid = false;
        errorMessage = "建议内容不能为空";
    } else if(musicTypes != null && containsOther(musicTypes) && (otherMusicText == null || otherMusicText.trim().isEmpty())) {
        isValid = false;
        errorMessage = "选择\"其他\"音乐类型时，请填写具体内容";
    }
    
    // 格式化音乐类型字符串
    String musicTypesStr = "";
    if(musicTypes != null && musicTypes.length > 0) {
        for(int i = 0; i < musicTypes.length; i++) {
            if(i > 0) musicTypesStr += ", ";
            
            if("electronic".equals(musicTypes[i])) musicTypesStr += "电子音乐";
            else if("jazz".equals(musicTypes[i])) musicTypesStr += "爵士音乐";
            else if("classical".equals(musicTypes[i])) musicTypesStr += "古典音乐";
            else if("world".equals(musicTypes[i])) musicTypesStr += "世界音乐";
            else if("other".equals(musicTypes[i]) && otherMusicText != null && !otherMusicText.trim().isEmpty()) 
                musicTypesStr += "其他: " + otherMusicText;
        }
    } else {
        musicTypesStr = "未选择";
    }
    
    // 格式化主题
    String topicStr = "";
    if("website".equals(topic)) topicStr = "网站功能";
    else if("content".equals(topic)) topicStr = "音乐内容";
    else if("recommendation".equals(topic)) topicStr = "音乐推荐";
    else topicStr = "其他";
    
    // 存储数据到session中，以便在响应页面使用
    session.setAttribute("name", name);
    session.setAttribute("email", email);
    session.setAttribute("topic", topicStr);
    session.setAttribute("suggestion", suggestion);
    session.setAttribute("musicTypes", musicTypesStr);
    session.setAttribute("isValid", isValid);
    session.setAttribute("errorMessage", errorMessage);
    
    // 如果表单验证通过，将建议保存到文件
    if(isValid) {
        try {
            // 获取当前时间
            Date now = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String formattedDate = sdf.format(now);
            
            // 创建存储目录(如果不存在)
            File dir = new File(application.getRealPath("/") + "WEB-INF/suggestions");
            if(!dir.exists()) {
                dir.mkdirs();
            }
            
            // 文件名格式：建议_日期_随机码.txt
            String fileName = "suggestion_" + new SimpleDateFormat("yyyyMMdd_HHmmss").format(now) + "_" + 
                              String.format("%04d", new Random().nextInt(10000)) + ".txt";
            
            // 创建文件
            File file = new File(dir, fileName);
            // 使用OutputStreamWriter指定UTF-8编码
            FileOutputStream fos = new FileOutputStream(file);
            OutputStreamWriter osw = new OutputStreamWriter(fos, "UTF-8");
            BufferedWriter bw = new BufferedWriter(osw);
            
            // 写入建议信息
            bw.write("提交时间: " + formattedDate);
            bw.newLine();
            bw.write("姓名: " + name);
            bw.newLine();
            bw.write("邮箱: " + email);
            bw.newLine();
            bw.write("主题: " + topicStr);
            bw.newLine();
            bw.write("喜爱的音乐类型: " + musicTypesStr);
            bw.newLine();
            bw.write("建议内容:");
            bw.newLine();
            bw.write(suggestion);
            bw.newLine();
            
            // 关闭文件
            bw.close();
            osw.close();
            fos.close();
            
            // 添加成功保存的消息到session
            session.setAttribute("suggestionSaved", true);
            session.setAttribute("savedTime", formattedDate);
            
        } catch(Exception e) {
            // 如果发生错误，添加错误信息到session
            session.setAttribute("suggestionSaved", false);
            session.setAttribute("saveError", "保存建议时发生错误: " + e.getMessage());
        }
    }
    
    // 跳转到响应页面
    response.sendRedirect("suggestion_response.jsp");
%>

<%!
    // 检查音乐类型数组中是否包含"other"
    private boolean containsOther(String[] musicTypes) {
        if(musicTypes == null) return false;
        for(String type : musicTypes) {
            if("other".equals(type)) return true;
        }
        return false;
    }
%>
