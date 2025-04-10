<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>现代音乐品鉴 - 音乐红茶馆</title>
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
                <h2>现代音乐品鉴</h2>
                <p>探索当代音乐的多元表达与创新</p>
            </div>
            
            <div class="music-piece">
                <h2 class="music-title">Autumn Leaves</h2>
                
                <div class="composer-info">
                    <img src="../images/bill.png" class="composer-photo" alt="Bill Evans">
                    <div class="composer-bio">
                        <h3>Bill Evans</h3>
                        <p>Bill Evans（1929-1980）是20世纪最具影响力的爵士钢琴家之一，以其富有诗意的演奏风格和创新的和声语言著称。他将古典音乐的精致感与爵士乐的即兴性完美结合，创造了一种独特的声音美学。</p>
                    </div>
                </div>
                
                <div class="music-analysis">
                    <h3>音乐赏析</h3>
                    <p>《Autumn Leaves》原为法国歌曲《Les Feuilles Mortes》，由Joseph Kosma作曲。在Bill Evans的演绎下，这首歌曲被赋予了全新的深度和情感层次。</p>
                    <p>Evans以其标志性的触键方式，在这首作品中创造了如水晶般透明的音色和层次感。他的演绎以沉思的前奏开始，然后逐步展开旋律，通过丰富的和声变化和微妙的节奏处理，完美地捕捉了秋天落叶的意境与伤感。特别是他那富有弹性的左手伴奏和精准的右手旋律线条，展现了高超的平衡感与音乐对话能力。</p>
                </div>
                
                <div class="music-controls">
                    <button class="play-button" onclick="window.musicPlayer.playSpecificTrack('music/autumn leaves.mp3')">播放音乐</button>
                    <span>Bill Evans - Autumn Leaves</span>
                </div>
            </div>
            
            <div class="music-piece">
                <h2 class="music-title">Alone</h2>
                
                <div class="composer-info">
                    <img src="../images/Marshmello.png" class="composer-photo" alt="Marshmello">
                    <div class="composer-bio">
                        <h3>Marshmello</h3>
                        <p>Marshmello是一位美国电子音乐制作人和DJ，以其标志性的白色桶状头盔而闻名。他的音乐融合了电子舞曲、流行和陷阱音乐元素，创造出既适合舞池又富有情感的作品。</p>
                    </div>
                </div>
                
                <div class="music-analysis">
                    <h3>音乐赏析</h3>
                    <p>《Alone》是Marshmello在2016年发布的单曲，迅速成为全球热门歌曲。这首歌以其强烈的情感表达和令人难忘的旋律著称。</p>
                    <p>作品以轻柔的钢琴和温暖的人声开场，营造出一种亲密的氛围。随着歌曲的发展，合成器音色和电子节拍逐渐加入，在副歌部分达到高潮。这种从私密到宏大的音乐架构，完美地传达了歌曲关于孤独与连接的主题。尤其值得注意的是，Marshmello巧妙地在现代电子制作中融入了情感化的元素，使这首作品在商业性和艺术性之间取得了平衡。</p>
                </div>
                
                <div class="music-controls">
                    <button class="play-button" onclick="window.musicPlayer.playSpecificTrack('music/alone.mp3')">播放音乐</button>
                    <span>Marshmello - Alone</span>
                </div>
            </div>
            
            <div class="appreciation-navigation">
                <a href="classical.jsp">上一页：古典音乐品鉴</a>
            </div>
        </div>
        
        <div class="footer">
            <p>© 2025 音乐红茶馆 版权所有</p>
        </div>
    </div>
</body>
</html>
