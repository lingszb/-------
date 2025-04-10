<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>音乐红茶馆 - 首页</title>
    <link rel="stylesheet" href="common.css">
    <script src="player.js" defer></script>
</head>
<body>
    <div class="container">
        <div class="header fade-in">
            <img src="images/logo.png" alt="音乐红茶馆" class="logo">
            <h1>音乐红茶馆</h1>
            <p>一个让心灵沉淀的音乐空间</p>
        </div>
        
        <div class="nav">
            <table border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td><a href="index.jsp">首页</a></td>
                    <td><a href="music_theme/electronic.jsp">音乐主题</a></td>
                    <td><a href="music_appreciation/classical.jsp">音乐品鉴</a></td>
                    <td><a href="music_suggestion/suggestion_form.jsp">乐迷建议</a></td>
                </tr>
            </table>
        </div>
        
        <div class="content fade-in">
            <h2>欢迎来到音乐红茶馆</h2>
            
            <p>在这里，音乐如同茶香，沁人心脾。我们致力于为您提供最优质的音乐体验，让您在忙碌的生活中找到片刻宁静。</p>
            
            <div style="margin: 20px 0;">
                <table border="0" cellspacing="0" cellpadding="15" width="100%">
                    <tr>
                        <td width="33%">
                            <div class="theme-preview">
                                <div class="theme-image-container">
                                    <img src="images/electronic music.png" class="theme-image" alt="电子音乐">
                                </div>
                                <h3 class="theme-title">电子音乐</h3>
                                <p class="theme-description">探索现代电子乐的奇妙世界，从环境音到节奏感强烈的舞曲。</p>
                                <a href="music_theme/electronic.jsp" class="theme-link">了解更多</a>
                            </div>
                        </td>
                        <td width="33%">
                            <div class="theme-preview">
                                <div class="theme-image-container">
                                    <img src="images/jazz music.png" class="theme-image" alt="爵士音乐">
                                </div>
                                <h3 class="theme-title">爵士音乐</h3>
                                <p class="theme-description">感受爵士乐的即兴与自由，体验美国音乐文化的精髓。</p>
                                <a href="music_theme/jazz.jsp" class="theme-link">了解更多</a>
                            </div>
                        </td>
                        <td width="33%">
                            <div class="theme-preview">
                                <div class="theme-image-container">
                                    <img src="images/world music.png" class="theme-image" alt="世界音乐">
                                </div>
                                <h3 class="theme-title">世界音乐</h3>
                                <p class="theme-description">聆听来自世界各地的传统音乐，领略不同文化的音乐魅力。</p>
                                <a href="music_theme/world.jsp" class="theme-link">了解更多</a>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <style>
                .theme-preview {
                    background-color: rgba(255, 248, 240, 0.7);
                    border-radius: 10px;
                    padding: 20px;
                    box-shadow: 0 3px 10px rgba(90, 57, 33, 0.15);
                    transition: all 0.3s ease;
                    height: 100%;
                    display: flex;
                    flex-direction: column;
                    border: 1px solid rgba(208, 184, 154, 0.4);
                    margin: 0 8px;
                }

                .theme-preview:hover {
                    transform: translateY(-5px);
                    box-shadow: 0 5px 15px rgba(90, 57, 33, 0.25);
                    background-color: rgba(255, 248, 240, 0.9);
                }

                .theme-image-container {
                    height: 180px;
                    overflow: hidden;
                    border-radius: 8px;
                    margin-bottom: 15px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    background-color: rgba(140, 110, 74, 0.1);
                    border: 1px solid rgba(208, 184, 154, 0.3);
                }

                .theme-image {
                    width: 100%;
                    height: 100%;
                    object-fit: cover;
                    transition: transform 0.5s ease;
                }

                .theme-preview:hover .theme-image {
                    transform: scale(1.05);
                }

                .theme-title {
                    color: #5a3921;
                    font-size: 20px;
                    margin-bottom: 10px;
                    font-family: "华文行楷", "楷体", serif;
                    border-bottom: 1px solid #d0b89a;
                    padding-bottom: 8px;
                }

                .theme-description {
                    color: #6b4926;
                    line-height: 1.6;
                    margin-bottom: 15px;
                    flex-grow: 1;
                }

                .theme-link {
                    display: inline-block;
                    background-color: #8c6e4a;
                    color: white;
                    text-decoration: none;
                    padding: 8px 15px;
                    border-radius: 20px;
                    transition: all 0.3s ease;
                    font-weight: bold;
                    text-align: center;
                    align-self: flex-start;
                }

                .theme-link:hover {
                    background-color: #6b4926;
                    transform: scale(1.05);
                }
            </style>
            
            <h2>最新推荐</h2>
            <div class="recommendations">
                <div class="carousel-container">
                    <div class="carousel-arrow prev-arrow" onclick="moveCarousel(-1)">&#10094;</div>
                    <div class="carousel-track">
                        <div class="carousel-item active">
                            <div class="recommendation-item">
                                <div class="rec-header">
                                    <img src="images/久石让.png" class="artist-avatar" alt="久石让">
                                    <div>
                                        <h3>千与千寻 - 久石让</h3>
                                        <span class="rec-subtitle">宫崎骏动画电影配乐</span>
                                    </div>
                                </div>
                                <div class="rec-content">
                                    <p>这首充满东方韵味的配乐作品出自久石让之手，为动画大师宫崎骏的名作《千与千寻》创作。旋律如流水般清澈，充满了梦幻色彩，完美地呈现了电影中超现实与奇幻的世界观。</p>
                                    <p class="artist-intro">久石让：日本著名作曲家，尤以其与吉卜力工作室的长期合作而闻名，擅长将东西方音乐元素融合，创作出富有感染力的电影配乐。</p>
                                </div>
                                <div class="rec-footer">
                                    <button onclick="window.musicPlayer.playSpecificTrack('music/千与千寻.mp3')">试听</button>
                                    <a href="music_appreciation/classical.jsp">查看详情</a>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="recommendation-item">
                                <div class="rec-header">
                                    <img src="images/bill.png" class="artist-avatar" alt="Bill Evans">
                                    <div>
                                        <h3>Autumn Leaves - Bill Evans</h3>
                                        <span class="rec-subtitle">经典爵士钢琴演绎</span>
                                    </div>
                                </div>
                                <div class="rec-content">
                                    <p>《Autumn Leaves》原为法国歌曲《Les Feuilles Mortes》，在Bill Evans的诠释下，这首曲目被赋予了深沉而内敛的情感，他精致的和声处理和细腻的触键使这首标准曲散发出迷人的忧郁气息。</p>
                                    <p class="artist-intro">Bill Evans：美国爵士钢琴大师，以其抒情、内省的演奏风格和丰富的和声语言改变了爵士钢琴的表达方式，被誉为"钢琴诗人"，对现代爵士乐产生了深远影响。</p>
                                </div>
                                <div class="rec-footer">
                                    <button onclick="window.musicPlayer.playSpecificTrack('music/autumn leaves.mp3')">试听</button>
                                    <a href="music_appreciation/modern.jsp">查看详情</a>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="recommendation-item">
                                <div class="rec-header">
                                    <img src="images/chopin.png" class="artist-avatar" alt="肖邦">
                                    <div>
                                        <h3>夜曲 Op.9 No.2 - 肖邦</h3>
                                        <span class="rec-subtitle">浪漫主义钢琴代表作</span>
                                    </div>
                                </div>
                                <div class="rec-content">
                                    <p>这首作品是肖邦最著名的夜曲之一，创作于1830-1832年间。优美如歌的旋律线条与流畅的伴奏相结合，营造出宁静而略带忧郁的夜晚氛围，体现了肖邦对意大利美声歌剧的钦佩。</p>
                                    <p class="artist-intro">弗雷德里克·肖邦：19世纪波兰裔法国作曲家，浪漫主义音乐的代表人物，被誉为"钢琴诗人"，主要创作钢琴独奏作品，以其抒情性、华丽技巧和民族色彩闻名于世。</p>
                                </div>
                                <div class="rec-footer">
                                    <button onclick="window.musicPlayer.playSpecificTrack('music/nocturne.mp3')">试听</button>
                                    <a href="music_appreciation/classical.jsp">查看详情</a>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="recommendation-item">
                                <div class="rec-header">
                                    <img src="images/debussy.png" class="artist-avatar" alt="德彪西">
                                    <div>
                                        <h3>月光 (Clair de Lune) - 德彪西</h3>
                                        <span class="rec-subtitle">印象派音乐经典</span>
                                    </div>
                                </div>
                                <div class="rec-content">
                                    <p>这首德彪西《贝加马斯克组曲》的第三乐章，灵感源自法国诗人魏尔伦的同名诗作。作品通过独特的和声语言和音色处理，成功地将月夜的静谧与神秘转化为声音的诗意，展现了印象派音乐的精髓。</p>
                                    <p class="artist-intro">克洛德·德彪西：法国作曲家，印象派音乐的重要代表。他打破传统和声体系，创造出色彩斑斓、朦胧梦幻的音乐风格，对20世纪音乐产生了革命性的影响。</p>
                                </div>
                                <div class="rec-footer">
                                    <button onclick="window.musicPlayer.playSpecificTrack('music/clair_de_lune.mp3')">试听</button>
                                    <a href="music_appreciation/classical.jsp">查看详情</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-arrow next-arrow" onclick="moveCarousel(1)">&#10095;</div>
                </div>
                
                <div class="carousel-indicators">
                    <span class="indicator active" onclick="jumpToItem(0)"></span>
                    <span class="indicator" onclick="jumpToItem(1)"></span>
                    <span class="indicator" onclick="jumpToItem(2)"></span>
                    <span class="indicator" onclick="jumpToItem(3)"></span>
                </div>
            </div>
            
            <style>
                .carousel-container {
                    position: relative;
                    width: 100%;
                    display: flex;
                    align-items: center;
                    overflow: hidden;
                    padding: 20px 0;
                    height: 380px;
                }
                
                .carousel-track {
                    display: flex;
                    width: 100%;
                    height: 100%;
                    position: relative;
                }
                
                .carousel-item {
                    width: 80%;
                    margin: 0 10%;
                    position: absolute;
                    top: 0;
                    left: 0;
                    opacity: 0;
                    transition: all 0.5s ease;
                    transform: scale(0.8);
                    pointer-events: none;
                    visibility: hidden;
                    z-index: -1;
                    height: 100%;
                }
                
                .carousel-item.active {
                    opacity: 1;
                    transform: scale(1) translateX(0);
                    z-index: 10;
                    pointer-events: auto;
                    visibility: visible;
                }
                
                .carousel-item.prev {
                    transform: translateX(-65%) scale(0.7);
                    opacity: 0.4;
                    z-index: 1;
                    visibility: visible;
                    filter: blur(1px);
                }
                
                .carousel-item.next {
                    transform: translateX(65%) scale(0.7);
                    opacity: 0.4;
                    z-index: 1;
                    visibility: visible;
                    filter: blur(1px);
                }
                
                .recommendation-item {
                    background-color: #fff;
                    border-radius: 8px;
                    padding: 20px;
                    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                    height: 100%;
                    display: flex;
                    flex-direction: column;
                    justify-content: space-between;
                    overflow: hidden;
                }
                
                .rec-header {
                    display: flex;
                    align-items: center;
                    margin-bottom: 12px;
                    border-bottom: 1px solid #f0e6d9;
                    padding-bottom: 12px;
                }
                
                .artist-avatar {
                    width: 60px;
                    height: 60px;
                    border-radius: 50%;
                    object-fit: cover;
                    margin-right: 15px;
                    border: 2px solid #8B4513;
                }
                
                .rec-header h3 {
                    margin: 0 0 5px 0;
                    color: #6b4226;
                    font-size: 1.3rem;
                }
                
                .rec-subtitle {
                    font-size: 0.9rem;
                    color: #8B4513;
                    font-style: italic;
                }
                
                .rec-content {
                    flex-grow: 1;
                    overflow: auto;
                    padding-right: 5px;
                }
                
                .rec-content p {
                    margin-bottom: 12px;
                    line-height: 1.5;
                    color: #333;
                }
                
                .artist-intro {
                    font-size: 0.9rem;
                    padding: 10px;
                    background-color: #f9f1e6;
                    border-left: 3px solid #8B4513;
                    margin-top: 10px;
                }
                
                .rec-footer {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    margin-top: 15px;
                    padding-top: 15px;
                    border-top: 1px solid #f0e6d9;
                }
                
                .rec-footer button, .rec-footer a {
                    padding: 8px 16px;
                    border-radius: 4px;
                    cursor: pointer;
                    transition: all 0.3s ease;
                    text-decoration: none;
                    text-align: center;
                }
                
                .rec-footer button {
                    background-color: #4a7c59;
                    color: white;
                    border: none;
                    flex: 0 0 45%;
                }
                
                .rec-footer a {
                    background-color: #f0e6d9;
                    color: #6b4226;
                    border: 1px solid #6b4226;
                    flex: 0 0 45%;
                }
                
                .rec-footer button:hover {
                    background-color: #3a6049;
                }
                
                .rec-footer a:hover {
                    background-color: #e8d9c5;
                }
                
                .carousel-arrow {
                    cursor: pointer;
                    font-size: 32px; /* 更大的字体 */
                    color: #6b4226; /* 使用网站主色调 */
                    background: rgba(255, 255, 255, 0.95);
                    border-radius: 50%;
                    width: 50px; /* 更大的按钮 */
                    height: 50px; /* 更大的按钮 */
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    z-index: 20;
                    box-shadow: 0 3px 10px rgba(0, 0, 0, 0.2); /* 更强的阴影 */
                    transition: all 0.3s ease;
                    position: absolute;
                    border: 2px solid #8B4513; /* 添加边框 */
                    font-weight: bold;
                }
                
                .prev-arrow {
                    left: 10px; /* 位置更靠里，更明显 */
                }
                
                .next-arrow {
                    right: 10px; /* 位置更靠里，更明显 */
                }
                
                .carousel-arrow:hover {
                    background: #f0e6d9; /* 更明显的悬停效果 */
                    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
                    transform: scale(1.1); /* 悬停时略微放大 */
                }
            </style>
            
            <script>
                document.addEventListener('DOMContentLoaded', function() {
                    setupCarousel();
                });
                
                let currentIndex = 0;
                const totalItems = document.querySelectorAll('.carousel-item').length;
                
                function setupCarousel() {
                    updateCarousel();
                    
                    const track = document.querySelector('.carousel-track');
                    let startX, moveX;
                    
                    track.addEventListener('touchstart', function(e) {
                        startX = e.touches[0].clientX;
                    }, {passive: true});
                    
                    track.addEventListener('touchmove', function(e) {
                        moveX = e.touches[0].clientX;
                    }, {passive: true});
                    
                    track.addEventListener('touchend', function(e) {
                        if (startX - moveX > 50) {
                            moveCarousel(1);
                        } else if (moveX - startX > 50) {
                            moveCarousel(-1);
                        }
                    });
                }
                
                function moveCarousel(direction) {
                    currentIndex = (currentIndex + direction + totalItems) % totalItems;
                    updateCarousel();
                }
                
                function jumpToItem(index) {
                    currentIndex = index;
                    updateCarousel();
                }
                
                function updateCarousel() {
                    const items = document.querySelectorAll('.carousel-item');
                    const indicators = document.querySelectorAll('.indicator');
                    
                    items.forEach((item, index) => {
                        item.classList.remove('active', 'prev', 'next');
                        
                        if (index === currentIndex) {
                            item.classList.add('active');
                        } else if (index === (currentIndex - 1 + totalItems) % totalItems) {
                            item.classList.add('prev');
                        } else if (index === (currentIndex + 1) % totalItems) {
                            item.classList.add('next');
                        }
                    });
                    
                    indicators.forEach((indicator, index) => {
                        indicator.classList.toggle('active', index === currentIndex);
                    });
                }
            </script>
        </div>
        
        <div class="footer">
            <p>© 2025 音乐红茶馆 版权所有</p>
        </div>
    </div>
</body>
</html>
