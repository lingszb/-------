<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.text.SimpleDateFormat" %>
<%
    // 设置请求的字符编码为UTF-8
    request.setCharacterEncoding("UTF-8");

    // 获取表单数据
    String suggestionFile = request.getParameter("suggestionFile");
    String userEmail = request.getParameter("userEmail");
    String userName = request.getParameter("userName");
    String replyContent = request.getParameter("replyContent");
    
    // 返回信息
    boolean success = false;
    String message = "";
    
    if(suggestionFile == null || suggestionFile.isEmpty() || 
       userEmail == null || userEmail.isEmpty() || 
       replyContent == null || replyContent.isEmpty()) {
        message = "所有字段都必须填写";
    } else if(!suggestionFile.startsWith("suggestion_") || !suggestionFile.endsWith(".txt")) {
        message = "无效的建议文件名";
    } else {
        // 获取当前时间
        Date now = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String formattedDate = sdf.format(now);
        
        try {
            // 创建回复存储目录
            String repliesDirPath = application.getRealPath("/") + "WEB-INF/suggestions/replies";
            File repliesDir = new File(repliesDirPath);
            if(!repliesDir.exists()) {
                repliesDir.mkdirs();
            }
            
            // 回复文件的位置
            String replyFilePath = repliesDirPath + "/" + suggestionFile + ".reply";
            File replyFile = new File(replyFilePath);
            
            // 写入回复记录
            // 格式: REPLY:时间||内容
            // 使用UTF-8编码写入
            FileOutputStream fos;
            OutputStreamWriter osw;
            if(replyFile.exists()) {
                fos = new FileOutputStream(replyFile, true); // 追加模式
                osw = new OutputStreamWriter(fos, "UTF-8");
                BufferedWriter bw = new BufferedWriter(osw);
                bw.write("\n"); // 换行
                bw.write("REPLY:" + formattedDate + "||" + replyContent.replace("\n", "\\n"));
                bw.close();
                osw.close();
                fos.close();
            } else {
                fos = new FileOutputStream(replyFile); // 新建文件
                osw = new OutputStreamWriter(fos, "UTF-8");
                BufferedWriter bw = new BufferedWriter(osw);
                bw.write("REPLY:" + formattedDate + "||" + replyContent.replace("\n", "\\n"));
                bw.close();
                osw.close();
                fos.close();
            }
            
            // 标记操作成功
            success = true;
            message = "回复已成功保存，并将通知用户。";
            
            // TODO: 实际环境中，这里可以添加发送邮件的代码
            // sendEmail(userEmail, userName, "音乐红茶馆 - 您的建议有了新回复", replyContent);
            
        } catch(IOException e) {
            message = "保存回复时发生错误: " + e.getMessage();
        }
    }
    
    // 保存操作状态到session中
    session.setAttribute("replySuccess", success);
    session.setAttribute("replyMessage", message);
    
    // 返回到建议管理页面
    response.sendRedirect("view_suggestions.jsp");
%>
