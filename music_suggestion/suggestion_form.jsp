<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>乐迷建议 - 音乐红茶馆</title>
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
                <h2>乐迷建议</h2>
                <p>我们期待您的宝贵意见和建议</p>
            </div>
            
            <div class="suggestion-info">
                <p>亲爱的乐迷朋友，您的反馈对我们至关重要！通过这个表单，您可以分享您对音乐红茶馆的想法、建议，或者推荐您喜爱的音乐。我们会认真阅读每一条建议，并尽快给您回复。</p>
            </div>
            
            <div class="suggestion-form">
                <form action="process_suggestion.jsp" method="post">
                    <div class="form-group">
                        <label for="name" class="required">您的姓名</label>
                        <input type="text" id="name" name="name" class="form-control" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="email" class="required">电子邮箱</label>
                        <input type="email" id="email" name="email" class="form-control" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="topic">主题</label>
                        <select id="topic" name="topic" class="form-control">
                            <option value="website">网站功能</option>
                            <option value="content">音乐内容</option>
                            <option value="recommendation">音乐推荐</option>
                            <option value="other">其他</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="suggestion" class="required">您的建议</label>
                        <textarea id="suggestion" name="suggestion" class="form-control" required></textarea>
                    </div>
                    
                    <div class="form-group">
                        <label>您喜欢的音乐类型（可多选）</label>
                        <div class="form-check">
                            <input type="checkbox" id="electronic" name="musicType" value="electronic">
                            <label for="electronic">电子音乐</label>
                        </div>
                        <div class="form-check">
                            <input type="checkbox" id="jazz" name="musicType" value="jazz">
                            <label for="jazz">爵士音乐</label>
                        </div>
                        <div class="form-check">
                            <input type="checkbox" id="classical" name="musicType" value="classical">
                            <label for="classical">古典音乐</label>
                        </div>
                        <div class="form-check">
                            <input type="checkbox" id="world" name="musicType" value="world">
                            <label for="world">世界音乐</label>
                        </div>
                        <div class="form-check">
                            <input type="checkbox" id="other" name="musicType" value="other" onchange="toggleOtherMusic(this)">
                            <label for="other">其他</label>
                            <div id="otherMusicContainer" style="display: none; margin-top: 5px;">
                                <input type="text" id="otherMusicText" name="otherMusicText" class="form-control" placeholder="请填写您喜欢的其他音乐类型">
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <button type="submit" class="btn">提交建议</button>
                        <button type="reset" class="btn btn-secondary">重置表单</button>
                    </div>
                </form>
            </div>
        </div>
        
        <div class="footer">
            <p>© 2025 音乐红茶馆 版权所有</p>
            <div class="admin-link">
                <a href="../admin/login.jsp" class="admin-btn">管理员入口</a>
            </div>
        </div>
    </div>
    
    <script>
        function toggleOtherMusic(checkbox) {
            var otherMusicContainer = document.getElementById('otherMusicContainer');
            var otherMusicText = document.getElementById('otherMusicText');
            
            if(checkbox.checked) {
                otherMusicContainer.style.display = 'block';
                otherMusicText.required = true;
            } else {
                otherMusicContainer.style.display = 'none';
                otherMusicText.required = false;
                otherMusicText.value = '';
            }
        }
    </script>
</body>
</html>
