class MusicPlayer {
    constructor() {
        this.currentTrack = null;
        this.playlist = [
            { path: 'music/千与千寻.mp3', title: '千与千寻' },
            { path: 'music/alone.mp3', title: 'Alone' },
            { path: 'music/autumn leaves.mp3', title: 'Autumn Leaves' },
            { path: 'music/magnolia.mp3', title: 'Magnolia' },
            { path: 'music/LoveStory.mp3', title: 'Love Story' }
        ];
        this.currentIndex = 0;
        this.isPlaying = false;
        this.isShuffleMode = false;
        
        // 创建并配置音频对象
        this.audio = new Audio();
        this.audio.volume = 1.0; // 设置为最大音量确保能听到
        this.audio.autoplay = false; // 默认不自动播放
        this.audio.onended = () => this.playNext();
        
        // 尝试解决外放问题
        try {
            // 尝试启用外放 - 仅在支持的浏览器中
            if (typeof this.audio.sinkId !== 'undefined') {
                navigator.mediaDevices.enumerateDevices()
                    .then(devices => {
                        const audioOutputs = devices.filter(device => device.kind === 'audiooutput');
                        if (audioOutputs.length > 0) {
                            // 默认使用系统默认扬声器
                            this.audio.setSinkId(audioOutputs[0].deviceId)
                                .catch(e => console.log('无法设置音频输出设备:', e));
                        }
                    })
                    .catch(e => console.log('无法枚举设备:', e));
            }
        } catch(e) {
            console.log('此浏览器不支持选择音频输出设备');
        }
        
        this.baseUrl = this.getBaseUrl();
        this.initPlayer();
        
        // 移除页面可见性变化对音乐播放的影响
        document.addEventListener('visibilitychange', () => {
            // 不再做任何操作，让音乐继续播放
        });
    }

    initPlayer() {
        // 添加 Font Awesome 图标库
        if (!document.getElementById('font-awesome-css')) {
            const fontAwesomeLink = document.createElement('link');
            fontAwesomeLink.id = 'font-awesome-css';
            fontAwesomeLink.rel = 'stylesheet';
            fontAwesomeLink.href = 'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css';
            document.head.appendChild(fontAwesomeLink);
        }

        // 添加播放器样式
        const styleEl = document.createElement('style');
        styleEl.textContent = `
            .music-player {
                background: linear-gradient(145deg, #f0f4f8, #d7e3f1);
                color: #333;
                padding: 15px;
                border-radius: 10px;
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
                width: 240px;
                height: 240px;
                position: fixed;
                right: 10px;
                bottom: 30px;
                text-align: center;
                font-family: 'Arial', sans-serif;
                z-index: 1000;
                overflow-y: auto;
                transition: all 0.3s ease;
                display: flex;
                flex-direction: column;
                justify-content: space-between;
            }
            
            /* 调整内部元素的布局 */
            #player-controls {
                margin: 8px 0;
            }
            
            #track-info {
                margin: 8px 0;
                max-height: 50px;
                display: flex;
                align-items: center;
                justify-content: center;
                color: #444;
                background: rgba(0, 0, 0, 0.05);
                font-size: 14px;
            }
            
            .volume-container {
                margin: 8px 0;
                position: relative;
            }
            
            #player-title {
                font-size: 15px;
                margin-bottom: 10px;
                font-weight: bold;
                color: #444;
                text-shadow: 1px 1px 3px rgba(255, 255, 255, 0.5);
            }
            
            #track-info {
                margin: 10px 0;
                padding: 8px;
                background: rgba(0, 0, 0, 0.05);
                border-radius: 5px;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
                font-size: 14px;
            }
            
            #player-controls {
                display: flex;
                justify-content: center;
                margin: 15px 0;
                gap: 15px;
            }
            
            .control-btn {
                background: rgba(0, 0, 0, 0.1);
                border: none;
                color: #444;
                width: 40px;
                height: 40px;
                border-radius: 50%;
                cursor: pointer;
                display: flex;
                align-items: center;
                justify-content: center;
                transition: all 0.2s ease;
            }
            
            .control-btn:hover {
                background: rgba(0, 0, 0, 0.2);
                transform: scale(1.1);
            }
            
            .control-btn:active {
                transform: scale(0.95);
            }
            
            .volume-container {
                display: flex;
                align-items: center;
                justify-content: center;
                margin-top: 15px;
                gap: 10px;
                color: #555;
            }
            
            #volume-control {
                width: 100px;
                height: 5px;
                -webkit-appearance: none;
                background: linear-gradient(to right, #4e8cff 0%, #4e8cff 100%);
                border-radius: 5px;
                outline: none;
                position: relative;
            }
            
            #volume-control::-webkit-slider-thumb {
                -webkit-appearance: none;
                width: 15px;
                height: 15px;
                background: #3a7bd5;
                border-radius: 50%;
                cursor: pointer;
                box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
            }
            
            /* 添加音量进度条渐变色效果 */
            #volume-control::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                width: var(--volume-percent, 70%);
                height: 100%;
                background: linear-gradient(to right, #3a7bd5 0%, #6fb1fc 100%);
                border-radius: 5px;
                z-index: -1;
            }
            
            .control-btn.active {
                background: rgba(65, 105, 225, 0.3);
            }

            .playing .fa-play {
                display: none;
            }
            
            .paused .fa-pause {
                display: none;
            }
        `;
        document.head.appendChild(styleEl);

        const playerDiv = document.createElement('div');
        playerDiv.className = 'music-player';
        playerDiv.innerHTML = `
            <div id="player-title">音乐播放器</div>
            <div class="player-row">
                <div id="track-info">未播放</div>
            </div>
            <div id="player-controls">
                <button id="prev-btn" class="control-btn" title="上一首">
                    <i class="fas fa-step-backward"></i>
                </button>
                <button id="play-btn" class="control-btn paused" title="播放/暂停">
                    <i class="fas fa-play"></i>
                    <i class="fas fa-pause"></i>
                </button>
                <button id="next-btn" class="control-btn" title="下一首">
                    <i class="fas fa-step-forward"></i>
                </button>
                <button id="shuffle-btn" class="control-btn" title="随机播放">
                    <i class="fas fa-random"></i>
                </button>
            </div>
            <div class="volume-container">
                <i class="fas fa-volume-down"></i>
                <input type="range" id="volume-control" min="0" max="1" step="0.1" value="1.0">
                <i class="fas fa-volume-up"></i>
            </div>
        `;
        document.body.appendChild(playerDiv);

        document.getElementById('play-btn').addEventListener('click', () => this.togglePlay());
        document.getElementById('next-btn').addEventListener('click', () => this.playNext());
        document.getElementById('prev-btn').addEventListener('click', () => this.playPrevious());
        
        document.getElementById('volume-control').addEventListener('input', (e) => {
            this.audio.volume = e.target.value;
            // 更新音量条颜色
            const volumePercent = e.target.value * 100;
            e.target.style.setProperty('--volume-percent', `${volumePercent}%`);
            e.target.style.background = `linear-gradient(to right, #3a7bd5 0%, #6fb1fc ${volumePercent}%, #d7d7d7 ${volumePercent}%, #d7d7d7 100%)`;
            this.savePlayerState();
        });
        
        // 初始化音量条颜色
        this.audio.volume = document.getElementById('volume-control').value;
        const volumeControl = document.getElementById('volume-control');
        const initialVolume = volumeControl.value * 100;
        volumeControl.style.setProperty('--volume-percent', `${initialVolume}%`);
        volumeControl.style.background = `linear-gradient(to right, #3a7bd5 0%, #6fb1fc ${initialVolume}%, #d7d7d7 ${initialVolume}%, #d7d7d7 100%)`;
        
        document.getElementById('shuffle-btn').addEventListener('click', () => this.toggleShuffleMode());

        this.loadTrack(0);
        
        // 尝试在页面加载后解锁音频上下文
        this.unlockAudioContext();
    }
    
    // 尝试解锁音频上下文
    unlockAudioContext() {
        // 创建一个临时的AudioContext以解锁音频
        try {
            const AudioContext = window.AudioContext || window.webkitAudioContext;
            if (AudioContext) {
                const audioContext = new AudioContext();
                
                // 创建一个短暂的静音音频缓冲区
                const buffer = audioContext.createBuffer(1, 1, 22050);
                const source = audioContext.createBufferSource();
                source.buffer = buffer;
                source.connect(audioContext.destination);
                
                // 立即播放以解锁
                if (typeof source.start === 'function') {
                    source.start(0);
                } else {
                    source.noteOn(0);
                }
                
                // 如果被挂起，尝试恢复
                if (audioContext.state === 'suspended') {
                    audioContext.resume();
                }
            }
        } catch (e) {
            console.log('无法初始化音频上下文:', e);
        }
    }

    loadTrack(index) {
        if (index < 0) index = this.playlist.length - 1;
        if (index >= this.playlist.length) index = 0;
        
        this.currentIndex = index;
        this.currentTrack = this.playlist[index];
        this.audio.src = this.currentTrack.path;
        document.getElementById('track-info').textContent = this.currentTrack.title;
    }

    togglePlay() {
        if (this.isPlaying) {
            this.audio.pause();
            document.getElementById('play-btn').classList.replace('playing', 'paused');
        } else {
            // 再次确保音量设置正确
            this.audio.volume = document.getElementById('volume-control').value;
            
            // 强制解锁音频
            const playPromise = this.audio.play();
            
            if (playPromise !== undefined) {
                playPromise.then(() => {
                    this.isPlaying = true;
                    document.getElementById('play-btn').classList.replace('paused', 'playing');
                }).catch(error => {
                    console.error("播放失败:", error);
                    
                    // 在遇到问题时，尝试提高音量确保能听到
                    this.audio.volume = 1.0;
                    document.getElementById('volume-control').value = 1.0;
                    
                    // 尝试使用用户交互解锁音频
                    const unlockAudio = () => {
                        this.audio.play()
                            .then(() => {
                                document.removeEventListener('click', unlockAudio);
                                document.getElementById('play-btn').classList.replace('paused', 'playing');
                                this.isPlaying = true;
                            })
                            .catch(console.error);
                    };
                    document.addEventListener('click', unlockAudio, { once: true });
                    alert("请点击屏幕任意位置以启用音频播放");
                    return;
                });
            }
            
            document.getElementById('play-btn').classList.replace('paused', 'playing');
        }
        this.isPlaying = !this.isPlaying;
        this.savePlayerState();
    }

    playNext() {
        if (this.isShuffleMode) {
            let randomIndex;
            do {
                randomIndex = Math.floor(Math.random() * this.playlist.length);
            } while (randomIndex === this.currentIndex && this.playlist.length > 1);
            
            this.loadTrack(randomIndex);
        } else {
            this.loadTrack(this.currentIndex + 1);
        }
        
        if (this.isPlaying) this.audio.play();
    }

    playPrevious() {
        if (this.isShuffleMode) {
            let randomIndex;
            do {
                randomIndex = Math.floor(Math.random() * this.playlist.length);
            } while (randomIndex === this.currentIndex && this.playlist.length > 1);
            
            this.loadTrack(randomIndex);
        } else {
            this.loadTrack(this.currentIndex - 1);
        }
        
        if (this.isPlaying) this.audio.play();
    }

    // 获取基础URL路径
    getBaseUrl() {
        const pathSegments = window.location.pathname.split('/');
        const webAppIndex = pathSegments.indexOf('web4');
        let baseUrl = '';
        
        if (webAppIndex !== -1) {
            baseUrl = pathSegments.slice(0, webAppIndex + 1).join('/') + '/';
        }
        
        return baseUrl;
    }
    
    // 路径规范化处理
    normalizePath(path) {
        // 如果已经是绝对路径或完整的URL，则直接返回
        if (path.startsWith('http') || path.startsWith('/')) {
            return path;
        }
        
        // 如果以 '../' 开头，则处理相对路径
        if (path.startsWith('../')) {
            // 计算当前页面相对于web4根目录的深度
            const currentPath = window.location.pathname;
            const pathSegments = currentPath.split('/');
            const webAppIndex = pathSegments.indexOf('web4');
            
            // 计算要返回的目录层级数
            let upCount = 0;
            let pathCopy = path;
            while(pathCopy.startsWith('../')) {
                upCount++;
                pathCopy = pathCopy.substring(3);
            }
            
            // 构建新路径 (从web4开始，然后向下走到目标文件)
            const targetPath = pathSegments.slice(0, webAppIndex + 1 + (pathSegments.length - webAppIndex - 1 - upCount)).join('/') + '/' + pathCopy;
            return targetPath;
        }
        
        // 如果是简单的相对路径（如 'music/song.mp3'），拼接到基础目录
        return this.baseUrl + path;
    }
    
    // 从路径中提取标题
    extractTitleFromPath(path) {
        // 从路径中获取文件名并去除扩展名
        const fileName = path.split('/').pop();
        return fileName.replace(/\.[^/.]+$/, ""); // 移除扩展名
    }

    playSpecificTrack(trackPath) {
        // 规范化路径，确保路径格式正确
        const normalizedPath = this.normalizePath(trackPath);
        
        // 查找是否已经存在于播放列表中
        let index = this.playlist.findIndex(track => track.path === normalizedPath);
        
        // 如果不存在于播放列表，则添加到播放列表中
        if (index === -1) {
            // 从路径中提取标题
            const title = this.extractTitleFromPath(normalizedPath);
            this.playlist.push({ path: normalizedPath, title: title });
            index = this.playlist.length - 1;
        }
        
        // 加载并播放轨道
        this.loadTrack(index);
        
        // 预先设置音量确保有声音
        this.audio.volume = document.getElementById('volume-control').value;
        
        const playPromise = this.audio.play();
        if (playPromise !== undefined) {
            playPromise
                .then(() => {
                    this.isPlaying = true;
                    document.getElementById('play-btn').classList.replace('paused', 'playing');
                    this.savePlayerState();
                })
                .catch(err => {
                    console.error('播放失败:', err);
                    
                    // 尝试使用用户交互解锁音频
                    const unlockAudio = () => {
                        this.audio.play()
                            .then(() => {
                                document.removeEventListener('click', unlockAudio);
                                document.getElementById('play-btn').classList.replace('paused', 'playing');
                                this.isPlaying = true;
                                this.savePlayerState();
                            })
                            .catch(e => {
                                console.error('二次尝试失败:', e);
                                alert('无法播放音乐，请检查文件路径是否正确: ' + normalizedPath);
                            });
                    };
                    document.addEventListener('click', unlockAudio, { once: true });
                    alert("点击屏幕任意位置以启用音频播放");
                });
        }
    }
    
    // 切换随机播放模式
    toggleShuffleMode() {
        this.isShuffleMode = !this.isShuffleMode;
        const shuffleBtn = document.getElementById('shuffle-btn');
        
        if (this.isShuffleMode) {
            shuffleBtn.classList.add('active');
        } else {
            shuffleBtn.classList.remove('active');
        }
        
        this.savePlayerState();
    }

    // 保存播放器状态到localStorage
    savePlayerState() {
        const playerState = {
            currentIndex: this.currentIndex,
            isPlaying: this.isPlaying,
            currentTime: this.audio.currentTime,
            volume: this.audio.volume,
            isShuffleMode: this.isShuffleMode,
            playlist: this.playlist
        };
        localStorage.setItem('musicPlayerState', JSON.stringify(playerState));
    }
    
    // 修改: 从localStorage加载播放器状态
    loadPlayerState() {
        const savedState = localStorage.getItem('musicPlayerState');
        if (savedState) {
            const playerState = JSON.parse(savedState);
            
            // 恢复播放列表
            if (playerState.playlist) {
                this.playlist = playerState.playlist;
            }
            
            // 先设置正确的音量
            this.audio.volume = playerState.volume || 1.0; // 默认为最大音量
            const volumeControl = document.getElementById('volume-control');
            volumeControl.value = playerState.volume || 1.0;
            
            // 更新音量条颜色
            const volumePercent = volumeControl.value * 100;
            volumeControl.style.setProperty('--volume-percent', `${volumePercent}%`);
            volumeControl.style.background = `linear-gradient(to right, #3a7bd5 0%, #6fb1fc ${volumePercent}%, #d7d7d7 ${volumePercent}%, #d7d7d7 100%)`;
            
            // 恢复随机播放模式
            this.isShuffleMode = playerState.isShuffleMode;
            const shuffleBtn = document.getElementById('shuffle-btn');
            if (this.isShuffleMode) {
                shuffleBtn.classList.add('active');
            }
            
            // 恢复播放曲目和位置
            this.loadTrack(playerState.currentIndex);
            
            // 必须先设置音频时间，然后才能播放
            this.audio.addEventListener('loadedmetadata', () => {
                // 设置播放位置
                this.audio.currentTime = playerState.currentTime;
                
                // 如果之前正在播放，则恢复播放
                if (playerState.isPlaying) {
                    // 使用自动播放策略 - 首先尝试播放
                    this.audio.play()
                        .then(() => {
                            this.isPlaying = true;
                            document.getElementById('play-btn').classList.replace('paused', 'playing');
                        })
                        .catch(err => {
                            console.log('需要用户交互才能自动播放音频，等待用户操作', err);
                            // 由于无法自动播放，将播放状态记录但不实际启动播放
                            this.isPlaying = false;
                        });
                }
            }, { once: true }); // 只执行一次
        }
    }
}

document.addEventListener('DOMContentLoaded', function() {
    window.musicPlayer = new MusicPlayer();
    
    // 监听音频播放进度变化，定期保存状态
    window.musicPlayer.audio.addEventListener('timeupdate', () => {
        // 每5秒保存一次(或者根据需要调整频率)
        if (Math.floor(window.musicPlayer.audio.currentTime) % 5 === 0) {
            window.musicPlayer.savePlayerState();
        }
    });
    
    // 加载保存的状态 - 确保在DOM完全加载后再执行
    window.musicPlayer.loadPlayerState();
});
