<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>爵士音乐 - 音乐红茶馆</title>
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
                <h2>爵士音乐</h2>
                <p>感受即兴与自由的音乐灵魂</p>
            </div>
            
            <div class="theme-content">
                <div class="theme-info">
                    <img src="../images/jazz music.png" class="theme-image" alt="爵士音乐">
                    
                    <p>爵士乐起源于20世纪初的美国，是一种融合了非洲节奏、欧洲和声和美国本土元素的音乐形式。它强调即兴演奏，让音乐家在基本结构上自由发挥，展现个人风格和情感。</p>
                    
                    <h3>爵士音乐的特点</h3>
                    <ul>
                        <li>注重即兴演奏与个人表达</li>
                        <li>摇摆感（Swing）节奏</li>
                        <li>丰富的和声变化</li>
                        <li>个性鲜明的音色与演奏技巧</li>
                    </ul>
                    
                    <div class="artist-info">
                        <img src="../images/bill.png" class="artist-photo" alt="Bill Evans">
                        <h3>艺术家聚焦：Bill Evans</h3>
                        <p>Bill Evans是一位革命性的爵士钢琴家，以其深邃的和声感、精致的触键和抒情的风格著称。他重新定义了爵士三重奏的概念，强调三位演奏者之间的互动与平等对话。他的代表作包括《Waltz for Debby》和《Sunday at the Village Vanguard》。</p>
                    </div>
                </div>
                
                <div class="theme-tracks">
                    <h3>推荐曲目</h3>
                    <div class="track-item">
                        <div class="track-header">
                            <h4>Autumn Leaves - Bill Evans</h4>
                            <div class="track-tags">
                                <span class="track-tag">爵士钢琴</span>
                                <span class="track-tag">经典</span>
                                <span class="track-tag">1959年</span>
                            </div>
                        </div>
                        <div class="track-info">
                            <p class="track-description">《Autumn Leaves》是爵士乐标准曲，原为法国歌曲《Les Feuilles Mortes》。在Bill Evans的演绎下，这首作品展现出了独特的深度和情感。他的钢琴演奏风格为这首经典歌曲注入了全新的生命力，充满了诗意与内省的气质。</p>
                            <div class="artist-bio">
                                <strong>艺术家简介:</strong> Bill Evans (1929-1980)是美国爵士钢琴家和作曲家，以其富有诗意的演奏风格、创新的和声结构和对三重奏形式的重新定义而闻名。他的演奏风格结合了古典音乐的技巧和爵士乐的即兴性，对现代爵士钢琴产生了深远影响。
                            </div>
                        </div>
                        <div class="track-actions">
                            <button class="play-track-btn" onclick="window.musicPlayer.playSpecificTrack('music/autumn leaves.mp3')">播放音乐</button>
                            <span class="track-meta">收录于专辑《Portrait in Jazz》</span>
                        </div>
                    </div>
                    
                    <div class="track-item">
                        <div class="track-header">
                            <h4>Magnolia - Playboi Carti</h4>
                            <div class="track-tags">
                                <span class="track-tag">现代爵士</span>
                                <span class="track-tag">融合风格</span>
                                <span class="track-tag">2017年</span>
                            </div>
                        </div>
                        <div class="track-info">
                            <p class="track-description">虽然《Magnolia》主要被归类为说唱音乐，但它融合了现代爵士元素，特别是在其节奏结构和音乐编排上。这种融合代表了当代音乐如何吸收爵士乐的即兴性和自由表达，创造出全新的声音体验。</p>
                            <div class="artist-bio">
                                <strong>艺术家简介:</strong> Playboi Carti的音乐虽然扎根于说唱传统，但他对声音实验和非传统结构的探索，反映了爵士乐的创新精神。他的作品展示了当代音乐如何突破流派界限，创造出新的音乐表达方式。
                            </div>
                        </div>
                        <div class="track-actions">
                            <button class="play-track-btn" onclick="window.musicPlayer.playSpecificTrack('music/magnolia.mp3')">播放音乐</button>
                            <span class="track-meta">现代爵士融合代表作</span>
                        </div>
                    </div>
                </div>
                
            </div>
            
            <div class="theme-navigation">
                <a href="electronic.jsp">上一主题：电子音乐</a>
                <a href="world.jsp">下一主题：世界音乐</a>
            </div>
        </div>
        
        <div class="footer">
            <p>© 2025 音乐红茶馆 版权所有</p>
        </div>
    </div>
</body>
</html>
