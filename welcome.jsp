<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>欢迎访问音乐茶馆</title>
    <style>
        body {
            font-family: "华文行楷", "楷体", serif;
            margin: 0;
            padding: 0;
            background-color: #e8d6c3; /* 茶色调背景 */
            background-image: linear-gradient(to bottom, #e8d6c3, #c9b18c);
            text-align: center;
            color: #5a3921;
            background-attachment: fixed;
        }
        .welcome-container {
            max-width: 800px;
            margin: 100px auto;
            padding: 30px;
            background-color: rgba(255, 251, 240, 0.9); /* 更温暖的半透明背景 */
            border: 1px solid #d0b89a;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(90, 57, 33, 0.3);
        }
        .logo {
            max-width: 220px;
            margin-bottom: 25px;
            border-radius: 10px;
        }
        h1 {
            color: #5a3921;
            font-size: 36px;
            margin-bottom: 25px;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.1);
        }
        .quote-section {
            margin: 30px 0;
            padding: 20px;
            border-top: 1px solid #d0b89a;
            border-bottom: 1px solid #d0b89a;
            font-style: italic;
        }
        .quote {
            font-size: 18px;
            line-height: 1.6;
            margin-bottom: 15px;
            color: #6b4926;
        }
        .quote-author {
            font-size: 16px;
            color: #8c6e4a;
            text-align: right;
            margin-top: 5px;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            padding: 12px 30px;
            background-color: #8c6e4a;
            color: white;
            text-decoration: none;
            border-radius: 25px;
            font-size: 18px;
            transition: all 0.3s ease;
        }
        a:hover {
            background-color: #6b4926;
            transform: scale(1.05);
        }
        footer {
            margin-top: 20px;
            font-size: 14px;
            color: #8c6e4a;
        }
    </style>
</head>
<body>
    <div class="welcome-container">
        <img src="images/logo.png" alt="音乐茶馆Logo" class="logo">
        <h1>静享茶香 · 感受音乐</h1>
        
        <div class="quote-section">
            <div class="quote">"音乐是灵魂的语言，茶是心灵的慰藉。在这里，二者交融，抚平岁月的褶皱。"</div>
            <div class="quote-author">— 音乐茶馆</div>
            
            <div class="quote">"音乐洗涤心灵，茶香抚慰情感。生活如茶，需要慢慢品味；音乐如水，静静流淌在心间。"</div>
            <div class="quote-author">— 古典诗人</div>
            
            <div class="quote">"没有一种艺术，比音乐更能打动人心；也没有一种饮品，比茶更能沁人心脾。"</div>
            <div class="quote-author">— 贝多芬</div>
        </div>
        
        <p>欢迎来到音乐茶馆，在这里，您可以沉浸在悠扬的旋律与醇香的茶韵之中，享受片刻的宁静与舒适。</p>
        <a href="index.jsp">开启音乐之旅</a>
        
        <footer>茶与音乐，滋养心灵，抚慰生活</footer>
    </div>
</body>
</html>
