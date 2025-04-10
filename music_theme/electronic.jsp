<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>电子音乐 - 音乐红茶馆</title>
    <link rel="stylesheet" href="../common.css">
    <link rel="stylesheet" href="theme.css">
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
                    <td><a href="electronic.jsp">音乐主题</a></td>
                    <td><a href="../music_appreciation/classical.jsp">音乐品鉴</a></td>
                    <td><a href="../music_suggestion/suggestion_form.jsp">乐迷建议</a></td>
                </tr>
            </table>
        </div>
        
        <div class="content fade-in">
            <div class="theme-header">
                <h2>电子音乐</h2>
                <p>探索现代科技与音乐的完美结合</p>
            </div>
            
            <div class="theme-content">
                <div class="theme-info">
                    <img src="../images/electronic music.png" class="theme-image" alt="电子音乐">
                    
                    <p>电子音乐是利用电子乐器和电子音乐技术所创作的音乐形式。它起源于20世纪中期，并在现代音乐产业中占据了重要位置。从早期的实验性电子音乐到现代的EDM（电子舞曲音乐），这一流派一直在不断发展和变化。</p>
                    
                    <h3>电子音乐的特点</h3>
                    <ul>
                        <li>使用合成器、采样器等电子设备创作</li>
                        <li>重复的节奏模式和强烈的节拍感</li>
                        <li>丰富的音色和声音效果</li>
                        <li>可以完全在数字环境中创作</li>
                    </ul>
                    
                    <div class="artist-info">
                        <img src="../images/Daft Punk.png" class="artist-photo" alt="Daft Punk">
                        <h3>艺术家聚焦：Daft Punk</h3>
                        <p>Daft Punk是电子音乐领域最具影响力的组合之一。这支法国双人组合以其独特的机器人形象和融合了迪斯科、放克和浩室的电子音乐风格而闻名于世。他们的名作包括《One More Time》、《Get Lucky》等。</p>
                    </div>
                </div>
                
                <div class="theme-tracks">
                    <h3>推荐曲目</h3>
                    <div class="track-item">
                        <div class="track-header">
                            <h4>Alone - Marshmello</h4>
                            <div class="track-tags">
                                <span class="track-tag">流行电子</span>
                                <span class="track-tag">EDM</span>
                                <span class="track-tag">2016年</span>
                            </div>
                        </div>
                        <div class="track-info">
                            <p class="track-description">这首由Marshmello创作的单曲发行于2016年，曾在Billboard热门电子/舞曲榜单上位列前茅。歌曲以温柔的钢琴开场，逐渐过渡到震撼人心的电子节拍，完美展现了孤独与勇气的主题。</p>
                            <div class="artist-bio">
                                <strong>艺术家简介:</strong> Marshmello，本名Christopher Comstock，是美国电子音乐制作人和DJ。以其标志性的白色头盔面具形象而闻名，其音乐风格融合了未来贝斯、陷阱和电子元素，创作了众多畅销单曲。
                            </div>
                        </div>
                        <div class="track-actions">
                            <button class="play-track-btn" onclick="window.musicPlayer.playSpecificTrack('music/alone.mp3')">播放音乐</button>
                            <span class="track-meta">Billboard电子榜单Top 40</span>
                        </div>
                    </div>
                    
                    <div class="track-item">
                        <div class="track-header">
                            <h4>Magnolia - Playboi Carti</h4>
                            <div class="track-tags">
                                <span class="track-tag">说唱</span>
                                <span class="track-tag">电子混合</span>
                                <span class="track-tag">2017年</span>
                            </div>
                        </div>
                        <div class="track-info">
                            <p class="track-description">发行于2017年，《Magnolia》是Playboi Carti同名专辑中的主打单曲。这首歌以其简约而强烈的电子节拍和朗朗上口的说唱风格，获得了广泛关注，同时在社交媒体平台引起了病毒式传播。</p>
                            <div class="artist-bio">
                                <strong>艺术家简介:</strong> Playboi Carti，本名Jordan Terrell Carter，是美国说唱歌手，以其独特的音乐风格和时尚感著称。他的音乐融合了数字陷阱和嘻哈元素，形成了极具辨识度的声音特色。
                            </div>
                        </div>
                        <div class="track-actions">
                            <button class="play-track-btn" onclick="window.musicPlayer.playSpecificTrack('music/magnolia.mp3')">播放音乐</button>
                            <span class="track-meta">首周下载量超过50万</span>
                        </div>
                    </div>
                </div>
                
            </div>
            
            <div class="theme-navigation">
                <a href="jazz.jsp">下一主题：爵士音乐</a>
                <a href="world.jsp">查看：世界音乐</a>
            </div>
        </div>
        
        <div class="footer">
            <p>© 2025 音乐红茶馆 版权所有</p>
        </div>
    </div>
</body>
</html>
