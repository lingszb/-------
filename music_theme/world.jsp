<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>世界音乐 - 音乐红茶馆</title>
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
                <h2>世界音乐</h2>
                <p>探索全球文化的音乐瑰宝</p>
            </div>
            
            <div class="theme-content">
                <div class="theme-info">
                    <img src="../images/world music.png" class="theme-image" alt="世界音乐">
                    
                    <p>世界音乐是一个广泛的概念，涵盖了世界各地的传统音乐形式和现代融合风格。它让我们有机会通过声音去感受不同文化的独特魅力，了解各民族的历史与情感表达方式。</p>
                    
                    <h3>世界音乐的魅力</h3>
                    <ul>
                        <li>丰富多样的乐器与演奏技巧</li>
                        <li>传统与现代元素的融合创新</li>
                        <li>承载深厚的文化背景与历史意义</li>
                        <li>独特的音阶系统与节奏模式</li>
                    </ul>
                    
                    <div class="artist-info">
                        <img src="../images/ma.png" class="artist-photo" alt="Yo-Yo Ma">
                        <h3>艺术家聚焦：Yo-Yo Ma</h3>
                        <p>马友友（Yo-Yo Ma）是世界著名的大提琴演奏家，也是跨文化音乐交流的重要推动者。他创立的"丝绸之路合奏团"致力于探索亚洲与西方音乐的交融，通过音乐架起不同文化之间的桥梁。他的演奏技巧精湛，音乐诠释深刻而富有情感。</p>
                    </div>
                </div>
                
                <div class="theme-tracks">
                    <h3>推荐曲目</h3>
                    <div class="track-item">
                        <div class="track-header">
                            <h4>千与千寻 - 久石让</h4>
                            <div class="track-tags">
                                <span class="track-tag">日本</span>
                                <span class="track-tag">动画配乐</span>
                                <span class="track-tag">2001年</span>
                            </div>
                        </div>
                        <div class="track-info">
                            <p class="track-description">这首作品是宫崎骏导演动画电影《千与千寻》的主题曲，由日本著名作曲家久石让创作。音乐融合了东方传统音乐元素与西方管弦乐风格，创造出梦幻而感人的氛围，完美配合电影中奇幻的世界观。</p>
                            <div class="artist-bio">
                                <strong>艺术家简介:</strong> 久石让(Joe Hisaishi)，生于1950年，是日本著名作曲家和指挥家，以其与宫崎骏的长期合作而闻名于世。他的音乐融合了古典、民族和现代元素，创造出独特而富有情感的声音景观。他的作品被广泛认为是日本文化输出的重要部分。
                            </div>
                        </div>
                        <div class="track-actions">
                            <button class="play-track-btn" onclick="window.musicPlayer.playSpecificTrack('music/千与千寻.mp3')">播放音乐</button>
                            <span class="track-meta">奥斯卡最佳动画长片配乐</span>
                        </div>
                    </div>
                    
                    <div class="track-item">
                        <div class="track-header">
                            <h4>Magnolia - Playboi Carti</h4>
                            <div class="track-tags">
                                <span class="track-tag">全球流行</span>
                                <span class="track-tag">文化融合</span>
                                <span class="track-tag">2017年</span>
                            </div>
                        </div>
                        <div class="track-info">
                            <p class="track-description">《Magnolia》展示了全球音乐融合的趋势，尽管根源于美国说唱文化，但其制作和音乐元素吸收了来自不同文化的影响。这首歌在世界各地的流行证明了音乐如何跨越文化和语言的界限，成为全球共通的表达方式。</p>
                            <div class="artist-bio">
                                <strong>艺术家简介:</strong> Playboi Carti的音乐代表了当代全球化背景下的文化交融现象。他的创作虽然根植于美国嘻哈文化，但其影响力已经延伸到全球各个角落，成为世界音乐文化中的一部分，展示了现代音乐的世界性特征。
                            </div>
                        </div>
                        <div class="track-actions">
                            <button class="play-track-btn" onclick="window.musicPlayer.playSpecificTrack('music/magnolia.mp3')">播放音乐</button>
                            <span class="track-meta">跨越多个大洲和文化的影响</span>
                        </div>
                    </div>
                </div>
                
            </div>
            
            <div class="theme-navigation">
                <a href="jazz.jsp">上一主题：爵士音乐</a>
                <a href="../music_appreciation/classical.jsp">前往：音乐品鉴</a>
            </div>
        </div>
        
        <div class="footer">
            <p>© 2025 音乐红茶馆 版权所有</p>
        </div>
    </div>
</body>
</html>
