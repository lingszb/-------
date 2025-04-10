<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>古典音乐品鉴 - 音乐红茶馆</title>
    <link rel="stylesheet" href="../common.css">
    <link rel="stylesheet" href="appreciation.css">
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
                    <td><a href="classical.jsp">音乐品鉴</a></td>
                    <td><a href="../music_suggestion/suggestion_form.jsp">乐迷建议</a></td>
                </tr>
            </table>
        </div>
        
        <div class="content fade-in">
            <div class="appreciation-header">
                <h2>古典音乐品鉴</h2>
                <p>聆听经典，感受永恒的艺术之美</p>
            </div>
            
            <div class="music-piece">
                <h2 class="music-title">《千与千寻》主题曲</h2>
                
                <div class="composer-info">
                    <img src="../images/久石让.png" class="composer-photo" alt="久石让">
                    <div class="composer-bio">
                        <h3>久石让</h3>
                        <p>久石让是日本著名作曲家，以其为动画电影创作的配乐而闻名于世。他与宫崎骏长期合作，为《龙猫》、《千与千寻》等多部经典作品创作了令人难忘的音乐。</p>
                    </div>
                </div>
                
                <div class="music-analysis">
                    <h3>音乐赏析</h3>
                    <p>《千与千寻》的配乐以其细腻的情感表达和独特的东方韵味著称。主题曲《Always With Me》通过简约的钢琴旋律和空灵的女声，完美地呈现了电影中超现实与梦幻的世界。</p>
                    <p>曲目开始时平静而忧伤，随着剧情的发展逐渐展现出希望和力量，最终达到情感的高潮。这种音乐结构与电影主角千寻的成长历程相呼应，展现了她从懦弱到勇敢的转变。</p>
                </div>
                
                <div class="music-controls">
                    <button class="play-button" onclick="window.musicPlayer.playSpecificTrack('music/千与千寻.mp3')">播放音乐</button>
                    <span>久石让 - 千与千寻主题曲</span>
                </div>
            </div>
            
            <!-- 添加肖邦夜曲 -->
            <div class="music-piece">
                <h2 class="music-title">夜曲 Op.9 No.2</h2>
                
                <div class="composer-info">
                    <img src="../images/chopin.png" class="composer-photo" alt="肖邦">
                    <div class="composer-bio">
                        <h3>弗雷德里克·肖邦</h3>
                        <p>肖邦（1810-1849）是浪漫主义时期最杰出的钢琴作曲家之一，以其抒情性、细腻的表达和精湛的钢琴技巧著称。他被誉为"钢琴诗人"，创作了大量华尔兹、夜曲、前奏曲等钢琴作品。</p>
                    </div>
                </div>
                
                <div class="music-analysis">
                    <h3>音乐赏析</h3>
                    <p>《夜曲 Op.9 No.2》是肖邦最著名的作品之一，创作于1830-1832年间。这首作品展现了肖邦浪漫主义音乐风格的精髓，优美流畅的旋律线条令人陶醉。</p>
                    <p>音乐以12/8拍子进行，右手奏出如歌如诉的旋律，左手则以琶音伴奏提供和声支持，营造出宁静而忧伤的夜晚氛围。中段以对比性的素材展开发展，随后回到主题的华丽变奏，最终以温柔的收尾结束。这首夜曲被认为体现了肖邦对意大利美声歌剧的钦佩，旋律线条如同一位女高音在夜色中吟唱。</p>
                </div>
                
                <div class="music-controls">
                    <button class="play-button" onclick="window.musicPlayer.playSpecificTrack('music/nocturne.mp3')">播放音乐</button>
                    <span>肖邦 - 夜曲 Op.9 No.2</span>
                </div>
            </div>
            
            <!-- 添加德彪西月光 -->
            <div class="music-piece">
                <h2 class="music-title">月光 (Clair de Lune)</h2>
                
                <div class="composer-info">
                    <img src="../images/debussy.png" class="composer-photo" alt="德彪西">
                    <div class="composer-bio">
                        <h3>克洛德·德彪西</h3>
                        <p>德彪西（1862-1918）是法国作曲家，印象派音乐的重要代表。他突破了传统调性体系的限制，通过独特的和声语言和音色处理，创造出朦胧、富有画面感的音乐风格。</p>
                    </div>
                </div>
                
                <div class="music-analysis">
                    <h3>音乐赏析</h3>
                    <p>《月光》是德彪西《贝加马斯克组曲》的第三乐章，创作于1890-1905年间，灵感来源于法国诗人魏尔伦的同名诗作。这首作品是印象派音乐的代表作品之一。</p>
                    <p>音乐以柔和的和弦缓缓流动，如同月光洒在湖面上的微微波澜。德彪西通过全音阶和五声音阶的运用，创造出朦胧而梦幻的氛围。中段的高潮部分如同云开月现，明亮而动人，随后又回归平静。整首作品展现了德彪西对音色和和声的精妙处理，成功地将月夜的静谧与神秘转化为声音的诗意。</p>
                </div>
                
                <div class="music-controls">
                    <button class="play-button" onclick="window.musicPlayer.playSpecificTrack('music/clair_de_lune.mp3')">播放音乐</button>
                    <span>德彪西 - 月光</span>
                </div>
            </div>
            
            <div class="appreciation-navigation">
                <a href="modern.jsp">下一页：现代音乐品鉴</a>
            </div>
        </div>
        
        <div class="footer">
            <p>© 2025 音乐红茶馆 版权所有</p>
        </div>
    </div>
</body>
</html>
