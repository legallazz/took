<!-- Подключение шрифтов и Font Awesome -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<article class="page ignore-select pmovie">
  <div class="pmovie__flex-container">
    <div class="pmovie__main-section">
      <div class="pmovie__content-wrapper">
        <div class="pmovie__left">
          <div class="pmovie__img img-fit-cover img-mask">
            <div class="age-restriction-badge"><span>[xfvalue_age-limit]</span></div>
            [xfvalue_image]
          </div>
          <div class="pmovie__button">
            <a href="#" class="js-read-button" data-book-url="[xfvalue_book]">
              <div class="pmovie__fav btn">
                <i class="fas fa-book-open" style="margin-right: 12px"></i>
                <span>Читать</span>
              </div>
            </a>
            <div class="pmovie__fav btn">
              <i class="fas fa-headphones" style="margin-right: 12px"></i>
              <span>Слушать</span>
            </div>
          </div>
          <a href="[xfvalue_book]" target="_blank">
            <div class="pmovie__fav btn download-btn">
              <i class="fas fa-download" style="margin-right: 12px"></i>
              <span>Скачать книгу .fb2</span>
            </div>
          </a>
        </div>
        <div class="pmovie__main">
          <div class="pmovie__header-main">
            <h1>{title}[edit]<span class="fas fa-cog"></span>[/edit]</h1>
          </div>
          <div class="pmovie__original">[xfvalue_autor]</div>
          <ul class="pmovie__list">
            <li><span>Год издания: </span> <a href="">[xfvalue_year]</a></li>
            <li><span>Язык оригинала: </span>[xfvalue_country]</li>
            <li><span>Возрастное ограничение: </span>[xfvalue_age-limit]</li>
            <li><span>Жанры: </span>{link-category}</li>
            <li><span>Среднее время чтения: </span>[xfvalue_reading-time]</li>
          </ul>
          <div class="pmovie__text full-text" style="border-bottom: 1px solid rgba(255, 255, 255, 0.1);">{full-story}</div>
          <div class="reading-progress" style="margin-top: 20px;">
            <div class="progress-section" id="reading-progress-section">
              <div class="progress-info">
                <i class="fas fa-book-open" style="margin-right: 12px;"></i>
                <span class="progress-label">Прогресс чтения</span>
              </div>
              <div class="progress-bar">
                <div class="progress-fill" id="reading-progress-fill" style="width: 0%"></div>
              </div>
              <span class="progress-text" id="reading-progress-text">0%</span>
            </div>
            <div class="progress-section" id="audio-progress-section">
              <div class="progress-info" style="margin-top: 10px;">
                <i class="fas fa-headphones" style="margin-right: 12px;"></i>
                <span class="progress-label">Прогресс аудиокниги</span>
              </div>
              <div class="progress-bar">
                <div class="progress-fill" id="audio-main-progress-fill" style="width: 0%"></div>
              </div>
              <span class="progress-text" id="audio-main-progress-text">0%</span>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="pmovie__player-section">
      <div class="wrapper-container">
        <!-- Контейнер для извлечения треков из DLE -->
        <div id="dle-audio-container" style="display:none;">[xfvalue_audio]</div>
        <!-- Контейнер для кастомных названий глав -->
        <div id="dle-audio-titles" style="display:none;">[xfvalue_audio_titles]</div>

        <!-- АУДИОПЛЕЕР — КАК НА КАРТИНКЕ -->
        <div style="padding-top: 30px;" id="audio-open"</div>
        <div class="container">
          <h4 style="margin-bottom: 10px;">Аудиокнига: {title}</h4>
          <div class="audio-player-icons" id="audio-player">
            <div class="player-main-panel">
              <!-- Левая группа: навигация -->
              <div class="control-group">
                <button style="border:none;" id="prev-chapter" class="icon-btn nav-btn" title="Предыдущая глава">
                  <i class="fas fa-step-backward"></i>
                </button>
                <button id="play-pause-btn" class="icon-btn play-pause main-btn" title="Воспроизвести / Пауза">
                  <i class="fas fa-play play-icon"></i>
                  <i class="fas fa-pause pause-icon" style="display: none;"></i>
                </button>
                <button style="border:none;" id="next-chapter" class="icon-btn nav-btn" title="Следующая глава">
                  <i class="fas fa-step-forward"></i>
                </button>
              </div>

              <!-- Центр: информация и прогресс -->
              <div class="track-display">
                <div class="track-info-compact">
                  <h4 id="audio-title">Для воспроизведения нажмите play</h4>
                  <div class="audio-stats">
                    <span id="current-chapter-info">Загрузка...</span>
                    <span class="stats-separator">•</span>
                    <span id="listened-counter">Прослушано 0 из 0 аудиофайлов</span>
                  </div>
                </div>
                <div class="progress-compact">
                  <div class="time-stamps">
                    <span id="current-time">0:00</span>
                    <span id="total-time">0:00</span>
                  </div>
                  <input type="range" id="audio-progress-bar" min="0" max="100" value="0" class="compact-progress-slider">
                </div>
              </div>

              <!-- Правая группа: громкость -->
              <div class="control-group right-group">
                <div class="volume-control-compact">
                  <button id="mute-btn" class="icon-btn volume-btn" title="Звук">
                    <i class="fas fa-volume-up volume-icon"></i>
                    <i class="fas fa-volume-mute mute-icon" style="display: none;"></i>
                  </button>
                  <div class="volume-slider-container">
                    <input type="range" id="volume-control" min="0" max="100" value="40" class="compact-volume-slider">
                  </div>
                </div>
              </div>
            </div>
            <div id="audio-stop-message" class="audio-message"></div>
          </div>

          <!-- Список глав -->
          <div class="chapters-list" id="chapters-list">
            <h4>Главы аудиокниги</h4>
            <div class="chapters-grid" id="chapters-grid">
              <!-- Главы будут добавлены динамически -->
            </div>
          </div>
        </div>

        <!-- Комментарии -->
        <div class="page__comments">
          <div class="page__comments-header d-flex">
            <div class="page__comments-title flex-grow-1 sect__title">Комментарии</div>
            <button class="js-show-comments-form">Добавить комментарий</button>
          </div>
          {addcomments}
          <div class="page__comments-list [not-comments]page__comments-list--not-comments[/not-comments]" id="page__comments-list">
            {comments}{navigation}
          </div>
        </div>
      </div>    
    </div>   
  </div>
</article>

<!-- Панель настроек чтения -->
<div class="rh-settings-panel" id="rhSettingsPanel">
  <div class="rh-settings-header">
    <h3><i class="fas fa-sliders-h" style="margin-right: 10px;"></i>Настройки чтения</h3>
    <button class="rh-btn" id="rhCloseSettings" title="Закрыть"><i class="fas fa-times"></i></button>
  </div>
  <div class="setting-row">
    <i class="fas fa-text-height"></i>
    <div class="setting-content">
      <label>Размер шрифта: <span id="rhFontSizeValue">18px</span></label>
      <input type="range" id="rhFontSize" min="14" max="30" value="18" step="1">
    </div>
  </div>
  <div class="setting-row">
    <i class="fas fa-align-left"></i>
    <div class="setting-content">
      <label>Межстрочный интервал: <span id="rhLineHeightValue">1.8</span></label>
      <input type="range" id="rhLineHeight" min="1.2" max="2.5" value="1.8" step="0.1">
    </div>
  </div>
  <div class="setting-row">
    <i class="fas fa-columns"></i>
    <div class="setting-content">
      <label>Ширина контейнера: <span id="rhContainerWidthValue">60%</span></label>
      <input type="range" id="rhContainerWidth" min="40" max="100" value="60" step="5">
    </div>
  </div>
  <div class="setting-row">
    <i class="fas fa-font"></i>
    <div class="setting-content">
      <label>Шрифт:</label>
      <select id="rhFontFamily">
        <option value="'Inter', sans-serif">Inter</option>
        <option value="'Roboto', sans-serif">Roboto</option>
        <option value="Arial, sans-serif">Arial</option>
        <option value="'Times New Roman', serif">Times New Roman</option>
        <option value="Georgia, serif">Georgia</option>
        <option value="Verdana, sans-serif">Verdana</option>
        <option value="'Kazimir', serif">Kazimir</option>
      </select>
    </div>
  </div>
  <div class="setting-row">
    <i class="fas fa-palette"></i>
    <div class="setting-content">
      <label>Тема:</label>
      <select id="rhTheme">
        <option value="theme-night-sky">Ночное небо</option>
        <option value="theme-asphalt">Асфальт</option>
        <option value="theme-dark-coffee">Тёмный кофе</option>
        <option value="theme-fog">Туман</option>
        <option value="theme-classic">Классический</option>
        <option value="theme-vintage">Винтаж</option>
        <option value="theme-modern-ui">Современный UI</option>
        <option value="theme-old-book">Старая книга</option>
      </select>
    </div>
  </div>
  <div class="setting-row">
    <i class="fas fa-expand"></i>
    <div class="setting-content">
      <div class="toggle-setting">
        <span>Растянуть фон</span>
        <label class="rh-toggle-switch">
          <input type="checkbox" id="rhUnifiedBackground">
          <span class="rh-toggle-slider"></span>
        </label>
      </div>
    </div>
  </div>
  <div class="setting-row">
    <i class="fas fa-sun"></i>
    <div class="setting-content">
      <label>Яркость: <span id="rhBrightnessValue">100%</span></label>
      <input type="range" id="rhBrightness" min="30" max="100" value="100" step="5">
    </div>
  </div>
  <div class="setting-row">
    <i class="fas fa-align-justify"></i>
    <div class="setting-content">
      <label>Выравнивание:</label>
      <select id="rhTextAlign">
        <option value="justify">По ширине</option>
        <option value="left">По левому краю</option>
      </select>
    </div>
  </div>
  <button class="rh-btn reset-btn" id="rhResetSettings">
    <i class="fas fa-undo" style="margin-right: 8px;"></i> Сбросить настройки
  </button>
</div>

<!-- Модальное окно "Читальный зал" -->
<div id="readingHall" class="reading-hall theme-night-sky">
  <div class="rh-header" id="rhHeader">
    <div class="rh-title-section">
      <div class="rh-book-title">Загрузка...</div>
      <div class="rh-progress-top" id="rhProgressTop">0%</div>
    </div>
    <div class="rh-controls">
      <button class="rh-btn" id="rhFullscreen" title="Полный экран"><i class="fas fa-expand"></i></button>
      <button class="rh-btn" id="rhMinimize" title="Скрыть шапку"><i class="fas fa-chevron-up"></i></button>
      <button class="rh-btn" id="rhSettingsToggle" title="Настройки"><i class="fas fa-cog"></i></button>
      <button class="rh-btn" id="rhExit" title="Выйти"><i class="fas fa-times"></i></button>
    </div>
  </div>
  <div id="settingsOverlay" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; z-index: 10000; display: none;"></div>
  <button class="rh-minimize-btn" id="rhExpandHeader" title="Показать шапку">
    <i class="fas fa-chevron-down"></i>
  </button>
  <div class="rh-full-content" id="rhFullContent">
    <div class="rh-progress-bar" id="rhProgressBar"></div>
        <!-- ДОБАВЛЯЕМ ПОСТЕР КНИГИ -->
    <div class="book-poster-container" id="bookPosterContainer">
        [xfvalue_image]
    </div>
    <div class="rh-text" id="rhText"></div>
  </div>
</div>

<!-- Мини-аудиоплеер -->
<div class="mini-audio-player" id="mini-audio-player">
  <div class="mini-controls">
    <button id="mini-prev-chapter" class="mini-control-btn" title="Предыдущая глава">
      <i class="fas fa-step-backward"></i>
    </button>
    <button id="mini-play-pause-btn" class="mini-control-btn" title="Воспроизвести / Пауза">
      <i class="fas fa-play"></i>
      <i class="fas fa-pause" style="display: none;"></i>
    </button>
    <button id="mini-next-chapter" class="mini-control-btn" title="Следующая глава">
      <i class="fas fa-step-forward"></i>
    </button>
    <div class="mini-info">
      <span id="mini-audio-title">Для воспроизведения нажмите play</span>
      <div class="mini-timeline">
        <span id="mini-current-time">0:00</span>
        <input type="range" id="mini-audio-progress-bar" min="0" max="100" value="0" class="mini-progress-slider">
        <span id="mini-total-time">0:00</span>
      </div>
    </div>
    <div class="mini-volume">
      <button id="mini-mute-btn" class="mini-volume-btn" title="Звук">
        <i class="fas fa-volume-up"></i>
        <i class="fas fa-volume-mute" style="display: none;"></i>
      </button>
      <input type="range" id="mini-volume-control" min="0" max="100" value="40" class="mini-volume-slider">
    </div>
    <button id="mini-close-btn" class="mini-control-btn mini-close" title="Скрыть">
      <i class="fas fa-times"></i>
    </button>
  </div>
</div>

<style>
/* === СТИЛИ ДЛЯ КНИГИ === */
.rh-header {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 80px;
  z-index: 101;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0 20px;
  color: white;
  transition: transform 0.3s ease;
  background-color: #5a4fcf;
  background-image: linear-gradient(315deg, #5a4fcf 0%, #1e243b 74%);
  box-shadow: 0 2px 10px rgba(0,0,0,0.3);
}
.rh-header.hidden { transform: translateY(-100%); }
.rh-book-title {
  font-weight: bold;
  font-size: 1.3em;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  margin-bottom: 5px;
}

.rh-controls {
    display: flex;
    gap: 8px; 
}

.rh-progress-top { font-size: 0.95em; opacity: 0.9; }
.rh-btn {
    width: 40px;
    height: 40px;
  background: rgba(255,255,255,0.15);
  border: none;
  font-size: 1.1em;
  cursor: pointer;
  color: white;
  padding: 10px;
  border-radius: 8px;
  transition: background 0.2s;
}
.rh-btn:hover { background: rgba(255,255,255,0.25); }
.rh-minimize-btn {
  position: absolute;
  top: 20px;
  right: 70px;
  width: 44px;
  height: 44px;
  border: none;
  border-radius: 8px;
  font-size: 1.3em;
  cursor: pointer;
  z-index: 99;
  display: none;
  align-items: center;
  justify-content: center;
  background: #5a4fcf;
  color: white;
  box-shadow: 0 2px 8px rgba(0,0,0,0.3);
}
.rh-minimize-btn.visible { display: flex; margin-right: 44px; }

/* === ПАНЕЛЬ НАСТРОЕК === */
.rh-settings-panel {
  position: fixed;
  top: 90px;
  right: 35px;
  width: 355px;
  max-height: 80vh;
  padding: 20px;
  border-radius: 12px;
  box-shadow: 0 6px 20px rgba(0,0,0,0.4);
  z-index: 100010 !important;
  overflow-y: auto;
  display: none;
  background: linear-gradient(160deg, #574fb4, #1f2541);
  color: #e0e0ff;
  border: 1px solid rgba(90, 79, 207, 0.4);
}
.rh-settings-panel.active { display: block; }
.rh-settings-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}
.rh-settings-header h3 {
  margin: 0;
  font-size: 1.3em;
  color: #ffffff;
  font-weight: 600;
}
.setting-row {
  display: flex;
  align-items: center;
  margin: 18px 0;
}
.setting-row i {
  width: 32px;
  font-size: 18px;
  color: #7a70ff;
  margin-right: 12px;
}
.setting-content { flex: 1; }
.rh-settings-panel label {
  display: block;
  margin-bottom: 8px;
  font-weight: 600;
  color: #e0e0ff;
  font-size: 0.95em;
}
.rh-settings-panel input[type="range"] {
  width: 100%;
  -webkit-appearance: none;
  height: 6px;
  border-radius: 3px;
  outline: none;
  background: rgba(255,255,255,0.1);
}
.rh-settings-panel input[type="range"]::-webkit-slider-thumb {
  -webkit-appearance: none;
  width: 18px;
  height: 18px;
  background: #5a4fcf;
  border-radius: 50%;
  cursor: pointer;
  box-shadow: 0 0 4px rgba(0,0,0,0.4);
}
.rh-settings-panel select {
  width: 100%;
  padding: 10px;
  border-radius: 8px;
  margin: 5px 0 15px 0;
  font-size: 0.95em;
  background: rgba(30, 35, 59, 0.7);
  color: #ffffff;
  border: 1px solid rgba(90, 79, 207, 0.5);
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='%237a70ff'%3e%3cpath d='M7 10l5 5 5-5z'/%3e%3c/svg%3e");
  background-repeat: no-repeat;
  background-position: right 12px center;
  background-size: 14px 10px;
  padding-right: 36px;
  cursor: pointer;
}
.rh-settings-panel select:hover { background: rgba(40, 45, 70, 0.8); }
.toggle-setting {
  display: flex;
  justify-content: space-between;
  align-items: center;
  font-weight: 600;
}
.rh-toggle-switch {
  position: relative;
  display: inline-block;
  width: 50px;
  height: 26px;
}
.rh-toggle-switch input { opacity: 0; width: 0; height: 0; }
.rh-toggle-slider {
  position: absolute;
  cursor: pointer;
  top: 0; left: 0;
  right: 0; bottom: 0;
  background: rgba(30, 35, 59, 0.8);
  transition: .3s;
  border-radius: 34px;
}
.rh-toggle-slider:before {
  position: absolute;
  content: "";
  height: 20px;
  width: 20px;
  left: 3px;
  bottom: 3px;
  background-color: #7a70ff;
  transition: .3s;
  border-radius: 50%;
}
.rh-toggle-switch input:checked + .rh-toggle-slider {
  background: rgba(90, 79, 207, 0.4);
}
.rh-toggle-switch input:checked + .rh-toggle-slider:before {
  transform: translateX(24px);
  background-color: #5a4fcf;
}
.reset-btn {
  background: linear-gradient(135deg, #5a4fcf, #3a32a0);
  color: white;
  width: 100%;
  font-size: 18px;
  margin-top: 20px;
  padding: 12px;
  font-weight: 600;
  border: none;
  border-radius: 8px;
  cursor: pointer;
  transition: all 0.2s;
}
.reset-btn:hover {
  background: linear-gradient(135deg, #6a5fdf, #4a42b0);
  transform: translateY(-1px);
}

/* === ЧИТАЛЬНЫЙ ЗАЛ === */
.reading-hall {
  position: fixed;
  top: 0; left: 0;
  width: 100%; height: 100%;
  z-index: 10000;
  display: none;
}
.reading-hall.active { display: block; }
.reading-hall.theme-night-sky { --bg: #111827; --page: #1e293b; --text: #f8fafc; --border: #111827; }
.reading-hall.theme-asphalt { --bg: #171717; --page: #202124; --text: #f1f5f9; --border: #171717; }
.reading-hall.theme-dark-coffee { --bg: #1c1917; --page: #292524; --text: #e7e5e4; --border: #1c1917; }
.reading-hall.theme-fog { --bg: #7e7e8f; --page: #c6c6d5; --text: #202020; --border: #7e7e8f; }
.reading-hall.theme-classic { --bg: #f4f3f2; --page: #ffffff; --text: #1f2937; --border: #e5e7eb; }
.reading-hall.theme-vintage { --bg: #f5e6d3; --page: #fdf6e3; --text: #644339; --border: #f5e6d3; }
.reading-hall.theme-modern-ui { --bg: #f4f9ff; --page: #e2e8f0; --text: #2d3748; --border: #bdc4c8; }
.reading-hall.theme-old-book { --bg: #eae9e9; --page: #faf8f2; --text: #302d27; --border: #e6e7e0; }
.rh-full-content {
  position: absolute;
  top: 80px;
  left: 0;
  right: 0;
  bottom: 0;
  overflow-y: auto;
  padding: 0;
  scroll-behavior: smooth;
  filter: brightness(100%);
  background: var(--bg);
  color: var(--text);
  transition: top 0.3s ease;
}
.reading-hall.header-hidden .rh-full-content { top: 0; }
.rh-progress-bar,
#reading-progress-fill,
#audio-main-progress-fill {
  background: linear-gradient(90deg, #4ade80, #22c55e);
  height: 100%;
  border-radius: 3px;
}
.rh-progress-bar {
  position: sticky;
  top: 0;
  left: 0;
  height: 5px;
  width: 0%;
  transition: width 0.3s ease;
  z-index: 10;
}
.rh-text {
  width: 60%;
  margin: 0 auto;
  padding: 32px;
  line-height: 1.8;
  text-align: justify;
  font-size: 18px;
  min-height: 100vh;
  box-sizing: border-box;
  font-family: 'Inter', sans-serif;
  background: var(--page);
  color: var(--text);
}
.rh-text p { margin: 0 0 1em 0; }
.rh-text h1, .rh-text h2, .rh-text h3, .rh-text h4, .rh-text h5, .rh-text h6 {
  font-weight: bold;
  margin: 1.5em 0 1em 0;
  color: var(--text);
}
.rh-text h1 { font-size: 1.8em; }
.rh-text h2 { font-size: 1.6em; }
.rh-text h3 { font-size: 1.4em; }
.rh-text h4 { font-size: 1.2em; }
.rh-text subtitle, .rh-text .subtitle {
  display: block;
  font-size: 22px;
  text-align: center;
  color: var(--text);
  margin: 0.8em 0 1.2em 0;
  font-weight: bold;
}
.rh-text ul, .rh-text ol { margin: 1em 0; padding-left: 2em; }
.rh-text li { margin-bottom: 0.5em; }
.rh-text strong, .rh-text b { font-weight: bold; }
.rh-text em, .rh-text i { font-style: italic; }
.rh-text a { color: #4a86e8; text-decoration: underline; }
.rh-text a:hover { color: #6aa0f0; }
.fb2-image {
  display: block;
  margin: 20px auto;
  max-width: 100%;
  height: auto;
}
.fb2-image + * { clear: both; margin-top: 1em; }

/* === СТИЛИ ДЛЯ АУДИОПЛЕЕРА (КАК НА КАРТИНКЕ) === */
.audio-player-icons {
    border-radius: 16px;
    background: linear-gradient(9deg, #4f74cf, #1a213c);
    padding: 20px;
    box-shadow: 0px 8px 20px -5px rgba(0, 0, 0, 0.3), inset 0 1px 0 rgba(255, 255, 255, 0.1);
    color: #f8fafc;
    margin-bottom: 30px;
    backdrop-filter: blur(20px);
    position: relative;
    overflow: hidden;
}
.audio-player-icons::after {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  height: 1px;
  background: linear-gradient(90deg, transparent, rgb(101 103 223 / 60%), rgb(94 125 235 / 60%), transparent);
}
.player-main-panel {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 20px;
  min-height: 60px;
}
.control-group {
  display: flex;
  align-items: center;
  gap: 12px;
  flex-shrink: 0;
}
.right-group { justify-content: flex-end; }



.icon-btn {
  border: none;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  position: relative;
  background: transparent;
  color: #cbd5e1;
}
.icon-btn::before {
  content: '';
  position: absolute;
  top: 50%;
  left: 50%;
  width: 0;
  height: 0;
  background: rgba(99, 102, 241, 0.1);
  border-radius: 50%;
  transform: translate(-50%, -50%);
  transition: all 0.3s ease;
}
.icon-btn:hover::before {
  width: 100%;
  height: 100%;
}
.nav-btn {
  width: 40px;
  height: 40px;
  border-radius: 12px;
  background: rgba(255, 255, 255, 0.05);
  border: 1px solid rgba(255, 255, 255, 0.1);
  font-size: 14px;
}
.nav-btn:hover {
  color: white;
  transform: translateY(-2px);
  box-shadow: 0 6px 16px rgba(99, 102, 241, 0.3);
  border-color: rgba(99, 102, 241, 0.4);
}
.main-btn {
  width: 52px;
  height: 52px;
  border-radius: 16px;
  background: #6d7dd4;
  color: white;
  font-size: 18px;
  box-shadow: 0 8px 20px rgb(24 86 187 / 40%);
  border: none;
  position: relative;
  z-index: 2;
}
.main-btn:hover {
  transform: scale(1.1) translateY(-2px);
  background: linear-gradient(135deg, #7376f1, #9b69f7);
}
.main-btn:active { transform: scale(1.05) translateY(0); }
.track-display {
  flex: 1;
  min-width: 0;
  display: flex;
  flex-direction: column;
  gap: 8px;
  padding: 0 20px;
}
.track-info-compact h4 {
  margin: 0;
  font-size: 1.1rem;
  font-weight: 700;
  color: #f1f5f9;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  line-height: 1.2;
}
.audio-stats {
  display: flex;
  align-items: center;
  gap: 8px;
  font-size: 0.8rem;
  color: #94a3b8;
  flex-wrap: wrap;
}
.stats-separator { color: #6366f1; font-weight: bold; }
#listened-counter, #current-chapter-info { font-size: 0.8rem; }
#current-chapter-info { color: #cbd5e1; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }
.progress-compact {
  display: flex;
  flex-direction: column;
  gap: 6px;
}

.time-stamps {
    display: flex;
    justify-content: space-between;
    font-size: 0.75rem;
    color: #cdd8e8;
    font-weight: 500;
}

.compact-progress-slider {
  width: 100%;
  height: 4px;
  background: rgba(255, 255, 255, 0.1);
  border-radius: 2px;
  outline: none;
  -webkit-appearance: none;
  cursor: pointer;
  transition: all 0.2s ease;
}


.volume-control-compact {
  display: flex;
  align-items: center;
  gap: 8px;
  padding: 6px 12px;
  border-radius: 12px;
  transition: all 0.2s ease;
}

.volume-btn {
  width: 40px;
  height: 40px;
  border-radius: 10px;
  background: rgba(255, 255, 255, 0.08);
  font-size: 13px;
  color: #cbd5e1;
}
.volume-btn:hover {
  background: rgba(99, 102, 241, 0.3);
  color: white;
  transform: scale(1.1);
}
.volume-slider-container { width: 70px; }

.compact-volume-slider {
  width: 100%;
  height: 4px;
  background: rgba(255, 255, 255, 0.15);
  border-radius: 2px;
  outline: none;
  -webkit-appearance: none;
  cursor: pointer;
  transition: height 0.2s ease;
}

.audio-message {
  margin-top: 16px;
  padding: 12px;
  background: rgba(99, 102, 241, 0.15);
  border-radius: 10px;
  color: #e2e8f0;
  display: none;
  font-size: 0.85rem;
  text-align: center;
  border: 1px solid rgba(99, 102, 241, 0.2);
  backdrop-filter: blur(10px);
}
.audio-message.show { display: block; }
.audio-message button {
  margin-left: 10px;
  background: #6366f1;
  color: white;
  border: none;
  padding: 6px 12px;
  border-radius: 6px;
  cursor: pointer;
  font-weight: 600;
  transition: all 0.2s ease;
}
.audio-message button:hover {
  background: #818cf8;
  transform: translateY(-1px);
}

/* === СПИСОК ГЛАВ === */
.chapters-list h4 {
  font-size: 1.1rem;
  margin-bottom: 16px;
  color: #e2e8f0;
  font-weight: 600;
}
.chapters-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(230px, 1fr));
  gap: 10px;
  margin-top: 16px;
}
.chapter-item {
    display: flex;
    align-items: center;
    padding: 10px 14px;
    background: rgba(255, 255, 255, 0.05);
    cursor: pointer;
    border-radius: 0.75rem;
    border: 1px solid #374151;
    transition: all 0.2s ease;
}
.chapter-item:hover {
  transform: translateY(-1px);
  box-shadow: 0 10px 15px -3px rgb(0 0 0 / 0.3), 0 4px 6px -4px rgb(0 0 0 / 0.3);
  border-color: #60a5fa;
}
.chapter-item.active {
border-color: #60a5fa;
    background-color: rgba(59, 130, 246, 0.1);
}
.chapter-item.listened {
background: rgba(16, 185, 129, 0.1);
    border-color: #34d399;
}
.chapter-item.listened .chapter-number::before {
  content: "✓ ";
  color: #34d399;
  font-weight: bold;
}
.chapter-number {
  flex: 1;
  font-weight: 500;
  color: #f8fafc;
  font-size: 0.9rem;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}
.chapter-play-btn {
    border: none;
    background-color: #679ff9;
    color: white;
    border-radius: 0.5rem;
    width: 32px;
    height: 32px;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    transition: all 0.2s ease;
    font-size: 12px;
    margin-left: 10px;
    flex-shrink: 0;
}
.chapter-play-btn:hover {
  background-color: #3b82f6;
  transform: scale(1.1);
}
.chapter-item.active .chapter-play-btn {
  background: rgba(255, 255, 255, 0.2);
}
.chapter-item.active .chapter-play-btn:hover {
  background: rgba(255, 255, 255, 0.3);
}









.icon-btn {
    border: none;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
    position: relative;
    background: transparent;
    color: #6b7280;
}

.nav-btn {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    font-size: 14px;
    background: #f8fafc;
    border: 1px solid #e2e8f0;
}

.nav-btn:hover {
    background: #3b82f6;
    color: white;
    transform: scale(1.05);
    border-color: #3b82f6;
    box-shadow: 0 4px 12px rgba(59, 130, 246, 0.3);
}

.main-btn {
    width: 56px;
    height: 56px;
    border-radius: 50%;
    background: #7fb0ff;
    color: white;
    font-size: 18px;
    border: none;
    box-shadow: 0 8px 20px rgb(24 86 187 / 40%);
}

.main-btn:hover {
    background: #243353;
    transform: scale(1.08);
    
}

.volume-btn {
    top: 4px;
    width: 40px;
    height: 40px;
    border-radius: 50%;
    font-size: 16px;
    background: #f8fafc;
    border: none;
}

.volume-btn:hover {
    background: #243353;
    color: white;
}

/* Для темной темы */
.audio-player-icons .nav-btn,
.audio-player-icons .volume-btn {
    background: rgb(168 176 246 / 25%);
    color: #fff;
    box-shadow: 0 2px 6px rgb(33 46 102 / 19%);
}

.audio-player-icons .nav-btn:hover {
    background: #30384a;
    color: white;
}

.volume-btn:hover {
    background: #5d79cf;
    color: white;
}



/* === МИНИ-ПЛЕЕР === */
.mini-audio-player {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 70px;
  background: linear-gradient(9deg, #4f74cf, #1a213c);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
  color: white;
  z-index: 10005;
  display: none;
  padding: 0 16px;
  align-items: center;
}
.mini-audio-player.visible {
  display: flex;
  justify-content: center;
}
.mini-controls {
  display: flex;
  align-items: center;
  width: 1125px;
  gap: 10px;
}
.mini-control-btn {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  background: rgba(255, 255, 255, 0.12);
  border: none;
  color: white;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  transition: all 0.25s ease;
  font-size: 14px;
  box-shadow: 0 2px 6px rgb(33 46 102 / 19%);
}
.mini-control-btn:hover {
  background: #30384a;
  transform: scale(1.05);
}
.mini-info {
  flex: 1;
  overflow: hidden;
}

.mini-close {
    background: rgba(255, 255, 255, 0.15);
    border: none;
    font-size: 1.1em;
    cursor: pointer;
    color: white;
    padding: 10px;
    transition: background 0.2s;
}

.mini-close:hover {
    background: rgba(255, 255, 255, 0.25);
}

#mini-audio-title {
  display: block;
  font-size: 0.95rem;
  font-weight: 500;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  margin-bottom: 2px;
  color: #e2e8f0;
}
.mini-timeline {
  display: flex;
  align-items: center;
  gap: 8px;
}
.mini-timeline span {
  font-size: 0.8rem;
  color: #a0aec0;
  min-width: 32px;
  text-align: center;
}
.mini-progress-slider {
  flex: 1;
  height: 4px;
  background: rgba(255, 255, 255, 0.15);
  border-radius: 3px;
  outline: none;
  -webkit-appearance: none;
}

.mini-volume {
  display: flex;
  align-items: center;
  gap: 8px;
}
.mini-volume-btn {
  width: 38px;
  height: 38px;
  border-radius: 50%;
  background: rgba(255, 255, 255, 0.1);
  border: none;
  color: #fff;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  transition: all 0.2s ease;
}
.mini-volume-btn:hover {
    background: rgba(255, 255, 255, 0.25);
    color: white;
}
.mini-volume-slider {
  width: 60px;
  height: 4px;
  background: rgba(255, 255, 255, 0.12);
  border-radius: 3px;
  outline: none;
  -webkit-appearance: none;
}


/* === АДАПТИВНОСТЬ === */
@media (max-width: 768px) {
  .audio-player-icons { padding: 16px; }
  .player-main-panel {
    flex-direction: column;
    gap: 16px;
    align-items: stretch;
  }
  .control-group { justify-content: center; }
  .right-group { justify-content: space-between; }
  .track-display { padding: 0; order: -1; }
  .volume-control-compact { flex: 1; max-width: 150px; }
  .volume-slider-container { flex: 1; max-width: 100px; }
  .audio-stats { flex-direction: column; align-items: flex-start; gap: 4px; }
  .stats-separator { display: none; }
  .chapters-grid { grid-template-columns: 1fr; gap: 8px; }
  .chapter-item { padding: 8px 12px; }
  .chapter-number { font-size: 0.85rem; }
  .chapter-play-btn { width: 30px; height: 30px; font-size: 11px; }
}
@media (max-width: 480px) {
  .audio-player-icons {
    padding: 14px;
    border-radius: 14px;
  }
  .nav-btn {
    width: 36px;
    height: 36px;
    border-radius: 10px;
    font-size: 12px;
  }
  .main-btn {
    width: 48px;
    height: 48px;
    border-radius: 14px;
    font-size: 16px;
  }
  .track-info-compact h4 { font-size: 1rem; }
  .audio-stats { font-size: 0.75rem; }
  .volume-control-compact { padding: 4px 10px; }
  .volume-btn {
    width: 28px;
    height: 28px;
    font-size: 12px;
  }
}


/* Исправления для иконок Play/Pause */
.play-icon,
.pause-icon,
.volume-icon,
.mute-icon {
    transition: opacity 0.2s ease;
}

/* Гарантируем, что скрытые иконки действительно скрыты */
[style*="display: none"] {
    display: none !important;
}

/* Анимации для плавной смены иконок */
.icon-btn i,
.mini-control-btn i,
.mini-volume-btn i {
    transition: all 0.2s ease;
}



/* Новый стиль для бегунка прогресса */
.compact-progress-slider::-webkit-slider-thumb {
  -webkit-appearance: none;
  width: 15px;
  height: 15px;
  cursor: pointer;
  border-radius: 50%;
  background: #60a5fa;
  border: 2px solid #ffffff;
}

/* Новый стиль для бегунка громкости */
.compact-volume-slider::-webkit-slider-thumb {
  -webkit-appearance: none;
  width: 15px;
  height: 15px;
  cursor: pointer;
    border-radius: 50%;
  background: #60a5fa;
  border: 2px solid #ffffff;
}

/* Для мини-плеера */
.mini-progress-slider::-webkit-slider-thumb {
  -webkit-appearance: none;
  width: 15px;
  height: 15px;
  cursor: pointer;
    border-radius: 50%;
  background: #60a5fa;
  border: 2px solid #ffffff;
}

.mini-volume-slider::-webkit-slider-thumb {
  -webkit-appearance: none;
  width: 15px;
  height: 15px;
  cursor: pointer;
    border-radius: 50%;
  background: #60a5fa;
  border: 2px solid #ffffff;
}

</style>

<script>
document.addEventListener('DOMContentLoaded', function () {
// ============ ЧИТАЛЬНЫЙ ЗАЛ ============
const readButton = document.querySelector('.js-read-button');
const modal = document.getElementById('readingHall');
const settingsOverlay = document.getElementById('settingsOverlay');
const settingsPanel = document.getElementById('rhSettingsPanel');

if (readButton && modal) {
    const fullContent = document.getElementById('rhFullContent');
    const textElement = document.getElementById('rhText');
    const header = document.getElementById('rhHeader');
    const progressTopElem = document.getElementById('rhProgressTop');
    const progressBar = document.getElementById('rhProgressBar');
    const bookTitleElem = document.querySelector('.rh-book-title');
    const exitBtn = document.getElementById('rhExit');
    const fullscreenBtn = document.getElementById('rhFullscreen');
    const minimizeBtn = document.getElementById('rhMinimize');
    const expandHeaderBtn = document.getElementById('rhExpandHeader');
    const settingsToggleBtn = document.getElementById('rhSettingsToggle');
    const closeSettingsBtn = document.getElementById('rhCloseSettings');
    const resetSettingsBtn = document.getElementById('rhResetSettings');
    const fontSizeSlider = document.getElementById('rhFontSize');
    const lineHeightSlider = document.getElementById('rhLineHeight');
    const containerWidthSlider = document.getElementById('rhContainerWidth');
    const fontFamilySelect = document.getElementById('rhFontFamily');
    const themeSelect = document.getElementById('rhTheme');
    const brightnessSlider = document.getElementById('rhBrightness');
    const textAlignSelect = document.getElementById('rhTextAlign');
    const unifiedBackgroundCheckbox = document.getElementById('rhUnifiedBackground');
    const fontSizeValue = document.getElementById('rhFontSizeValue');
    const lineHeightValue = document.getElementById('rhLineHeightValue');
    const containerWidthValue = document.getElementById('rhContainerWidthValue');
    const brightnessValue = document.getElementById('rhBrightnessValue');
    const pageProgressFill = document.getElementById('reading-progress-fill');
    const pageProgressText = document.getElementById('reading-progress-text');

    let currentBookKey = '';
    let isHeaderHidden = false;
    let isFullscreen = false;
    let scrollInterval = null;

    // Создаем ключ для книги сразу при загрузке страницы
    function initBookKey() {
        const bookUrl = readButton.getAttribute('data-book-url');
        if (bookUrl && bookUrl !== '#') {
            currentBookKey = 'book_progress_' + btoa(bookUrl).replace(/[^a-zA-Z0-9]/g, '').substring(0, 32);
            console.log('Ключ книги создан:', currentBookKey);
            return true;
        }
        return false;
    }

    // Функция для обновления прогресса на главной странице
    function updateMainPageProgress(percent) {
        console.log('Обновляем прогресс на главной странице:', percent + '%');
        if (pageProgressFill) {
            pageProgressFill.style.width = `${percent}%`;
        }
        if (pageProgressText) {
            pageProgressText.textContent = `${percent}%`;
        }
    }

    // Функция для сохранения прогресса
    function saveReadingProgress(pos, percent) {
        if (currentBookKey) {
            const progressData = {
                scrollPosition: pos, 
                progressPercent: percent,
                timestamp: Date.now()
            };
            localStorage.setItem(currentBookKey, JSON.stringify(progressData));
            console.log('Прогресс сохранен:', progressData);
            
            // Также обновляем прогресс на главной странице
            updateMainPageProgress(percent);
        }
    }

    // Функция для восстановления прогресса
    function restoreReadingProgress() {
        if (!currentBookKey) {
            console.log('Ключ книги не установлен');
            return;
        }
        
        try {
            const saved = localStorage.getItem(currentBookKey);
            if (saved) {
                const data = JSON.parse(saved);
                console.log('Восстанавливаем прогресс чтения:', data);
                
                // Восстанавливаем прогресс на главной странице сразу
                if (data.progressPercent !== undefined) {
                    updateMainPageProgress(data.progressPercent);
                }
                
                // Если читальный зал открыт, восстанавливаем скролл
                if (modal.classList.contains('active') && fullContent) {
                    console.log('Восстанавливаем скролл в читальном зале');
                    setTimeout(() => {
                        if (data.scrollPosition) {
                            fullContent.scrollTop = data.scrollPosition;
                        }
                        const scrollHeight = fullContent.scrollHeight - fullContent.clientHeight;
                        const progress = data.progressPercent || (scrollHeight > 0 ? Math.round((data.scrollPosition / scrollHeight) * 100) : 0);
                        updateProgress(progress);
                    }, 500);
                }
            } else {
                console.log('Сохраненный прогресс не найден для ключа:', currentBookKey);
                updateMainPageProgress(0);
            }
        } catch (e) {
            console.warn('Не удалось восстановить прогресс чтения:', e);
            updateMainPageProgress(0);
        }
    }

    // Восстанавливаем прогресс при загрузке страницы
    document.addEventListener('DOMContentLoaded', function() {
        console.log('DOM загружен, инициализируем прогресс чтения...');
        if (initBookKey()) {
            restoreReadingProgress();
        }
    });

    readButton.addEventListener('click', function (e) {
        e.preventDefault();
        const bookUrl = this.getAttribute('data-book-url');
        if (!bookUrl || bookUrl === '#') {
            alert('Файл книги недоступен');
            return;
        }
        
        // Убеждаемся, что ключ установлен
        if (!currentBookKey) {
            currentBookKey = 'book_progress_' + btoa(bookUrl).replace(/[^a-zA-Z0-9]/g, '').substring(0, 32);
        }
        
        modal.classList.add('active');
        document.body.style.overflow = 'hidden';
        textElement.innerHTML = '<div style="text-align:center;padding:80px;color:#ccc;"><i class="fas fa-spinner fa-spin" style="font-size:48px;margin-bottom:20px;"></i><br>📖 Загружаем книгу...</div>';
        loadAndParseBook(bookUrl);
    });

 function loadAndParseBook(url) {
    fetch(url)
        .then(response => {
            if (!response.ok) throw new Error('Сеть ответила с ошибкой: ' + response.status);
            return response.text();
        })
        .then(fbxContent => {
            const parser = new DOMParser();
            const xmlDoc = parser.parseFromString(fbxContent, 'application/xml');
            const parserError = xmlDoc.querySelector('parsererror');
            if (parserError) throw new Error('Некорректный формат FB2');

            const binaries = new Map();
            xmlDoc.querySelectorAll('binary').forEach(el => {
                const id = el.getAttribute('id');
                if (id) {
                    binaries.set(id, `data:image/jpeg;base64,${el.textContent.trim()}`);
                }
            });

            const body = xmlDoc.querySelector('body');
            if (!body) throw new Error('В FB2 отсутствует тело книги');

            const processedContent = cleanFB2Content(body, binaries, url);
            textElement.innerHTML = '';
            textElement.appendChild(processedContent);
            
            restoreTheme();
            applySettings();

            setTimeout(() => {
                restoreReadingProgress();
                setupScrollTracking();
            }, 200);

            const titleInfo = xmlDoc.querySelector('title-info > title');
            bookTitleElem.textContent = titleInfo ? titleInfo.textContent.trim() : '{title}';
        })
        .catch(error => {
            console.error('Ошибка загрузки книги:', error);
            textElement.innerHTML = `<div style="text-align:center;padding:50px;color:#f5222d;">
                ❌ Не удалось загрузить книгу<br>
                <small>${error.message}</small>
            </div>`;
        });
}

    function cleanFB2Content(bodyNode, binariesMap, bookUrl) {
        const clonedNode = bodyNode.cloneNode(true);
        let htmlString = new XMLSerializer().serializeToString(clonedNode);
        htmlString = htmlString
            .replace(/<fb2:/g, '<')
            .replace(/<\/fb2:/g, '</')
            .replace(/<empty-line[^>]*\/?>/g, '<br>')
            .replace(/<subtitle[^>]*>/g, '<subtitle>')
            .replace(/<\/subtitle>/g, '</subtitle>')
            .replace(/<image[^>]+l:href="([^"]+)"[^>]*\/?>/g, (_, src) => `<div class="fb2-image-placeholder" data-src="${src}"></div>`)
            .replace(/<image[^>]+href="([^"]+)"[^>]*\/?>/g, (_, src) => `<div class="fb2-image-placeholder" data-src="${src}"></div>`);
        const tempContainer = document.createElement('div');
        tempContainer.innerHTML = htmlString;
        tempContainer.querySelectorAll('script, link, style').forEach(el => el.remove());
        tempContainer.querySelectorAll('.fb2-image-placeholder').forEach(placeholder => {
            const imageSrc = placeholder.getAttribute('data-src');
            if (!imageSrc) return;
            if (imageSrc.startsWith('#')) {
                const imageId = imageSrc.slice(1);
                if (binariesMap.has(imageId)) {
                    const img = document.createElement('img');
                    img.src = binariesMap.get(imageId);
                    img.className = 'fb2-image';
                    img.alt = 'Изображение';
                    placeholder.replaceWith(img);
                } else {
                    placeholder.remove();
                }
            } else {
                try {
                    const baseUrl = new URL(bookUrl).origin;
                    const finalUrl = new URL(imageSrc, baseUrl).href;
                    const img = document.createElement('img');
                    img.src = finalUrl;
                    img.className = 'fb2-image';
                    img.alt = 'Изображение';
                    img.onerror = () => { img.style.opacity = '0.3'; };
                    placeholder.replaceWith(img);
                } catch (e) {
                    placeholder.remove();
                }
            }
        });
        return tempContainer;
    }

    function setupScrollTracking() {
        if (scrollInterval) clearInterval(scrollInterval);
        scrollInterval = setInterval(() => {
            if (!fullContent) return;
            
            const scrollTop = fullContent.scrollTop;
            const scrollHeight = fullContent.scrollHeight - fullContent.clientHeight;
            const progress = scrollHeight > 0 ? Math.round((scrollTop / scrollHeight) * 100) : 0;
            
            updateProgress(progress);
            saveReadingProgress(scrollTop, progress);
        }, 1000);
    }

    function updateProgress(percent) {
        const p = Math.max(0, Math.min(100, percent));
        if (progressTopElem) progressTopElem.textContent = p + '%';
        if (progressBar) progressBar.style.width = p + '%';
        updateMainPageProgress(p);
    }

    // Остальные функции читального зала (настройки, управление и т.д.)
    function initSettings() {
        applySettings();
        if (fontSizeSlider) fontSizeSlider.addEventListener('input', updateFontSize);
        if (lineHeightSlider) lineHeightSlider.addEventListener('input', updateLineHeight);
        if (containerWidthSlider) containerWidthSlider.addEventListener('input', updateContainerWidth);
        if (fontFamilySelect) fontFamilySelect.addEventListener('change', updateFontFamily);
        if (textAlignSelect) textAlignSelect.addEventListener('change', updateTextAlign);
        if (themeSelect) themeSelect.addEventListener('change', updateTheme);
        if (brightnessSlider) brightnessSlider.addEventListener('input', updateBrightness);
        if (unifiedBackgroundCheckbox) unifiedBackgroundCheckbox.addEventListener('change', toggleUnifiedBackground);
        if (resetSettingsBtn) resetSettingsBtn.addEventListener('click', resetSettings);
    }

    function updateFontSize() { 
        if (textElement) textElement.style.fontSize = `${this.value}px`; 
        if (fontSizeValue) fontSizeValue.textContent = `${this.value}px`; 
        saveSettings(); 
    }
    
    function updateLineHeight() { 
        if (textElement) textElement.style.lineHeight = this.value; 
        if (lineHeightValue) lineHeightValue.textContent = this.value; 
        saveSettings(); 
    }
    
    function updateContainerWidth() { 
        if (textElement) textElement.style.width = `${this.value}%`; 
        if (containerWidthValue) containerWidthValue.textContent = `${this.value}%`; 
        saveSettings(); 
    }
    
    function updateFontFamily() { 
        if (textElement) textElement.style.fontFamily = this.value; 
        saveSettings(); 
    }
    
    function updateTextAlign() { 
        if (textElement) textElement.style.textAlign = this.value; 
        saveSettings(); 
    }
    
    function updateBrightness() { 
        const value = this.value; 
        if (fullContent) fullContent.style.filter = `brightness(${value}%)`; 
        if (brightnessValue) brightnessValue.textContent = value + '%'; 
        saveSettings(); 
    }
    
    function toggleUnifiedBackground() {
        if (this.checked) {
            const page = getComputedStyle(modal).getPropertyValue('--page').trim();
            modal.style.setProperty('--bg', page);
        } else {
            modal.style.removeProperty('--bg');
        }
        saveSettings();
    }
    
    function updateTheme() {
        const newTheme = this.value;
        const allThemes = ['theme-night-sky','theme-asphalt','theme-dark-coffee','theme-fog','theme-classic','theme-vintage','theme-modern-ui','theme-old-book'];
        allThemes.forEach(c => modal.classList.remove(c));
        modal.classList.add(newTheme);
        modal.style.removeProperty('--bg');
        if (unifiedBackgroundCheckbox && unifiedBackgroundCheckbox.checked) unifiedBackgroundCheckbox.checked = false;
        saveSettings();
    }
    
    function restoreTheme() {
        const allThemes = ['theme-night-sky','theme-asphalt','theme-dark-coffee','theme-fog','theme-classic','theme-vintage','theme-modern-ui','theme-old-book'];
        allThemes.forEach(c => modal.classList.remove(c));
        let theme = 'theme-night-sky';
        try {
            const saved = localStorage.getItem('reader_settings');
            if (saved) {
                const settings = JSON.parse(saved);
                if (allThemes.includes(settings.theme)) theme = settings.theme;
            }
        } catch (e) { console.warn('Ошибка при чтении темы'); }
        modal.classList.add(theme);
        if (themeSelect) themeSelect.value = theme;
    }
    
    function applySettings() {
        const saved = getSavedSettings();
        if (textElement) {
            textElement.style.fontSize = (saved.fontSize || 18) + 'px';
            textElement.style.lineHeight = saved.lineHeight || 1.8;
            textElement.style.width = (saved.containerWidth || 60) + '%';
            textElement.style.fontFamily = saved.fontFamily || "'Inter', sans-serif";
            textElement.style.textAlign = saved.textAlign || 'justify';
        }
        if (fontSizeSlider) fontSizeSlider.value = saved.fontSize || 18;
        if (lineHeightSlider) lineHeightSlider.value = saved.lineHeight || 1.8;
        if (containerWidthSlider) containerWidthSlider.value = saved.containerWidth || 60;
        if (fontFamilySelect) fontFamilySelect.value = saved.fontFamily || "'Inter', sans-serif";
        if (textAlignSelect) textAlignSelect.value = saved.textAlign || 'justify';
        const brightness = saved.brightness || 100;
        if (fullContent) fullContent.style.filter = `brightness(${brightness}%)`;
        if (brightnessSlider) brightnessSlider.value = brightness;
        if (brightnessValue) brightnessValue.textContent = brightness + '%';
        if (saved.theme && themeSelect) themeSelect.value = saved.theme;
        const isUnified = saved.unifiedBackground || false;
        if (unifiedBackgroundCheckbox) unifiedBackgroundCheckbox.checked = isUnified;
        if (isUnified) {
            const page = getComputedStyle(modal).getPropertyValue('--page').trim();
            modal.style.setProperty('--bg', page);
        }
        updateSliderValues();
    }
    
    function updateSliderValues() {
        if (fontSizeValue) fontSizeValue.textContent = (fontSizeSlider ? fontSizeSlider.value : 18) + 'px';
        if (lineHeightValue) lineHeightValue.textContent = lineHeightSlider ? lineHeightSlider.value : 1.8;
        if (containerWidthValue) containerWidthValue.textContent = (containerWidthSlider ? containerWidthSlider.value : 60) + '%';
    }
    
    function saveSettings() {
        const settings = {
            fontSize: fontSizeSlider ? parseInt(fontSizeSlider.value) : 18,
            lineHeight: lineHeightSlider ? parseFloat(lineHeightSlider.value) : 1.8,
            containerWidth: containerWidthSlider ? parseInt(containerWidthSlider.value) : 60,
            fontFamily: fontFamilySelect ? fontFamilySelect.value : "'Inter', sans-serif",
            textAlign: textAlignSelect ? textAlignSelect.value : 'justify',
            theme: themeSelect ? themeSelect.value : 'theme-night-sky',
            brightness: brightnessSlider ? parseInt(brightnessSlider.value) : 100,
            unifiedBackground: unifiedBackgroundCheckbox ? unifiedBackgroundCheckbox.checked : false
        };
        localStorage.setItem('reader_settings', JSON.stringify(settings));
    }
    
    function getSavedSettings() {
        try { return JSON.parse(localStorage.getItem('reader_settings')) || {}; } catch (e) { return {}; }
    }
    
    function resetSettings() {
        localStorage.removeItem('reader_settings');
        if (textElement) {
            textElement.style.fontSize = '18px';
            textElement.style.lineHeight = '1.8';
            textElement.style.width = '60%';
            textElement.style.fontFamily = "'Inter', sans-serif";
            textElement.style.textAlign = 'justify';
        }
        if (fullContent) fullContent.style.filter = 'brightness(100%)';
        modal.style.removeProperty('--bg');
        const allThemes = ['theme-night-sky','theme-asphalt','theme-dark-coffee','theme-fog','theme-classic','theme-vintage','theme-modern-ui','theme-old-book'];
        allThemes.forEach(c => modal.classList.remove(c)); 
        modal.classList.add('theme-night-sky');
        if (fontSizeSlider) fontSizeSlider.value = 18;
        if (lineHeightSlider) lineHeightSlider.value = 1.8;
        if (containerWidthSlider) containerWidthSlider.value = 60;
        if (fontFamilySelect) fontFamilySelect.value = "'Inter', sans-serif";
        if (textAlignSelect) textAlignSelect.value = 'justify';
        if (themeSelect) themeSelect.value = 'theme-night-sky';
        if (brightnessSlider) brightnessSlider.value = 100;
        if (unifiedBackgroundCheckbox) unifiedBackgroundCheckbox.checked = false;
        updateSliderValues();
    }

    if (exitBtn) exitBtn.addEventListener('click', closeReader);
    function closeReader() {
        modal.classList.remove('active');
        document.body.style.overflow = '';
        if (isFullscreen && document.fullscreenElement) document.exitFullscreen().catch(console.error);
        if (scrollInterval) clearInterval(scrollInterval);
    }
    
    if (fullscreenBtn) fullscreenBtn.addEventListener('click', toggleFullscreen);
    function toggleFullscreen() {
        if (!isFullscreen) document.documentElement.requestFullscreen().catch(console.error);
        else document.exitFullscreen().catch(console.error);
    }
    
    function handleFullscreenChange() {
        isFullscreen = !!(
            document.fullscreenElement ||
            document.webkitFullscreenElement ||
            document.mozFullScreenElement ||
            document.msFullscreenElement
        );
        const icon = fullscreenBtn ? fullscreenBtn.querySelector('i') : null;
        if (icon) icon.className = isFullscreen ? 'fas fa-compress' : 'fas fa-expand';
        if (fullscreenBtn) fullscreenBtn.title = isFullscreen ? 'Выйти из полного экрана' : 'Полный экран';
    }
    
    document.addEventListener('fullscreenchange', handleFullscreenChange);
    document.addEventListener('webkitfullscreenchange', handleFullscreenChange);
    document.addEventListener('mozfullscreenchange', handleFullscreenChange);
    document.addEventListener('MSFullscreenChange', handleFullscreenChange);
    
    if (minimizeBtn) minimizeBtn.addEventListener('click', () => toggleHeader(true));
    if (expandHeaderBtn) expandHeaderBtn.addEventListener('click', () => toggleHeader(false));
    
    function toggleHeader(hide) {
        isHeaderHidden = hide;
        if (hide) {
            if (header) header.classList.add('hidden');
            if (expandHeaderBtn) expandHeaderBtn.classList.add('visible');
            modal.classList.add('header-hidden');
        } else {
            if (header) header.classList.remove('hidden');
            if (expandHeaderBtn) expandHeaderBtn.classList.remove('visible');
            modal.classList.remove('header-hidden');
        }
    }
    
    if (settingsToggleBtn) settingsToggleBtn.addEventListener('click', (e) => {
        e.stopPropagation();
        if (settingsPanel) settingsPanel.classList.toggle('active');
        if (settingsOverlay) settingsOverlay.style.display = settingsPanel.classList.contains('active') ? 'block' : 'none';
    });
    
    if (closeSettingsBtn) closeSettingsBtn.addEventListener('click', () => {
        if (settingsPanel) settingsPanel.classList.remove('active');
        if (settingsOverlay) settingsOverlay.style.display = 'none';
    });
    
    if (settingsOverlay) settingsOverlay.addEventListener('click', () => {
        if (settingsPanel) settingsPanel.classList.remove('active');
        if (settingsOverlay) settingsOverlay.style.display = 'none';
    });
    
    document.addEventListener('keydown', e => {
        if (!modal.classList.contains('active')) return;
        if (e.key === 'Escape') {
            if (settingsPanel && settingsPanel.classList.contains('active')) {
                if (closeSettingsBtn) closeSettingsBtn.click();
            } else {
                closeReader();
            }
        }
    });
    
    initSettings();
}


    // ============ АУДИОПЛЕЕР — ИСПРАВЛЕННЫЙ ============
// ============ АУДИОПЛЕЕР — ПОЛНЫЙ ИСПРАВЛЕННЫЙ КОД ============
function initAudioPlayer() {
    const dleContainer = document.getElementById('dle-audio-container');
    if (!dleContainer) {
        console.log('Аудиоконтейнер не найден');
        return;
    }

    const audioTracks = [];
    const temp = document.createElement('div');
    temp.innerHTML = dleContainer.innerHTML;
    const audios = temp.querySelectorAll('audio');
    
    console.log(`Найдено аудио элементов: ${audios.length}`);
    
    audios.forEach((el, i) => {
        let src = el.src || el.querySelector('source')?.src;
        const fallbackTitle = el.title || el.getAttribute('title') || `Глава ${i + 1}`;
        if (src) {
            audioTracks.push({ 
                src, 
                title: fallbackTitle, 
                duration: '0:00',
                index: i
            });
            console.log(`Добавлен трек ${i}: ${fallbackTitle} - ${src}`);
        }
    });

    const titlesContainer = document.getElementById('dle-audio-titles');
    if (titlesContainer) {
        const rawText = titlesContainer.textContent.trim();
        if (rawText) {
            const customTitles = rawText
                .split('\n')
                .map(t => t.trim())
                .filter(t => t);
            if (customTitles.length === audioTracks.length) {
                audioTracks.forEach((track, i) => {
                    track.title = customTitles[i];
                    console.log(`Установлено кастомное название для трека ${i}: ${customTitles[i]}`);
                });
            }
        }
    }

    if (audioTracks.length === 0) {
        const player = document.getElementById('audio-player');
        if (player) {
            player.style.display = 'none';
            console.log('Аудиотреки не найдены, скрываем плеер');
        }
        return;
    }

    // Элементы управления
    const audioPlayer = document.getElementById('audio-player');
    const miniPlayer = document.getElementById('mini-audio-player');
    const playBtn = document.getElementById('play-pause-btn');
    const miniPlayBtn = document.getElementById('mini-play-pause-btn');
    const prevBtn = document.getElementById('prev-chapter');
    const nextBtn = document.getElementById('next-chapter');
    const miniPrevBtn = document.getElementById('mini-prev-chapter');
    const miniNextBtn = document.getElementById('mini-next-chapter');
    const progressBar = document.getElementById('audio-progress-bar');
    const miniProgressBar = document.getElementById('mini-audio-progress-bar');
    const currentTimeEl = document.getElementById('current-time');
    const totalTimeEl = document.getElementById('total-time');
    const miniCurrentTime = document.getElementById('mini-current-time');
    const miniTotalTime = document.getElementById('mini-total-time');
    const titleEl = document.getElementById('audio-title');
    const miniTitle = document.getElementById('mini-audio-title');
    const chapterInfo = document.getElementById('current-chapter-info');
    const listenedCounter = document.getElementById('listened-counter');
    const chaptersGrid = document.getElementById('chapters-grid');
    const muteBtn = document.getElementById('mute-btn');
    const miniMuteBtn = document.getElementById('mini-mute-btn');
    const volumeSlider = document.getElementById('volume-control');
    const miniVolumeSlider = document.getElementById('mini-volume-control');
    const audioMainProgressFill = document.getElementById('audio-main-progress-fill');
    const audioMainProgressText = document.getElementById('audio-main-progress-text');
    const miniCloseBtn = document.getElementById('mini-close-btn');

    const audioElement = new Audio();
    let currentTrackIndex = 0;
    let isPlaying = false;
    let totalDuration = 0;
    let trackDurations = {};
    let listenedChapters = new Set();

    // Ключ для сохранения прогресса
    const progressKey = 'audio_progress_' + btoa(window.location.href).replace(/[^a-zA-Z0-9]/g, '').substring(0, 32);
    console.log('Ключ прогресса:', progressKey);

    // Инициализация громкости
    const savedVolume = localStorage.getItem('audio_volume');
    const initialVolume = savedVolume ? parseFloat(savedVolume) : 0.4;
    audioElement.volume = initialVolume;
    if (volumeSlider) volumeSlider.value = initialVolume * 100;
    if (miniVolumeSlider) miniVolumeSlider.value = initialVolume * 100;

    // Обновляем информацию о доступных файлах
    if (chapterInfo) {
        chapterInfo.textContent = `Доступно ${audioTracks.length} аудиофайлов`;
    }

    // СРАЗУ загружаем и восстанавливаем прогресс
    function loadAndRestoreProgress() {
        console.log('Начинаем загрузку прогресса и треков...');
        
        // Восстанавливаем прогресс ДО загрузки треков
        restoreProgress();
        
        // Загружаем длительности треков
        let loaded = 0;
        audioTracks.forEach((track, i) => {
            const tmp = new Audio();
            tmp.src = track.src;
            
            tmp.addEventListener('loadedmetadata', () => {
                trackDurations[i] = tmp.duration || 0;
                totalDuration += tmp.duration || 0;
                audioTracks[i].duration = formatTime(tmp.duration);
                loaded++;
                console.log(`Загружена длительность трека ${i}: ${audioTracks[i].duration}`);
                
                if (loaded === audioTracks.length) {
                    console.log('Все длительности загружены, рендерим главы');
                    renderChapters();
                    updateGlobalProgressUI();
                    updateListenedCounter();
                }
            });
            
            tmp.addEventListener('error', (e) => {
                console.warn(`Ошибка загрузки трека ${i}:`, e);
                audioTracks[i].duration = '0:00';
                loaded++;
                if (loaded === audioTracks.length) {
                    renderChapters();
                    updateGlobalProgressUI();
                    updateListenedCounter();
                }
            });
            
            // Запускаем загрузку
            tmp.load();
        });

        // На случай, если некоторые треки не загрузятся
        setTimeout(() => {
            if (loaded < audioTracks.length) {
                console.log(`Таймаут: загружено ${loaded} из ${audioTracks.length} треков`);
                renderChapters();
                updateGlobalProgressUI();
                updateListenedCounter();
            }
        }, 5000);
    }

    // === ОСНОВНЫЕ ФУНКЦИИ ===

    function renderChapters() {
        if (!chaptersGrid) {
            console.log('Контейнер глав не найден');
            return;
        }
        
        console.log('Рендерим главы, прослушано:', Array.from(listenedChapters));
        
        chaptersGrid.innerHTML = '';
        audioTracks.forEach((track, i) => {
            const div = document.createElement('div');
            div.className = 'chapter-item';
            if (i === currentTrackIndex) div.classList.add('active');
            if (listenedChapters.has(i)) div.classList.add('listened');
            
            div.innerHTML = `
                <div class="chapter-info">
                    <div class="chapter-number">${track.title}</div>
                    <div class="chapter-duration">${track.duration}</div>
                </div>
                <button class="chapter-play-btn" data-index="${i}">
                    <i class="fas fa-play"></i>
                </button>
            `;
            
            div.addEventListener('click', () => playTrack(i));
            div.querySelector('.chapter-play-btn').addEventListener('click', e => {
                e.stopPropagation();
                playTrack(i);
            });
            
            chaptersGrid.appendChild(div);
        });
        
        updateListenedCounter();
    }

    function updateListenedCounter() {
        const listenedCount = listenedChapters.size;
        const totalCount = audioTracks.length;
        
        console.log(`Обновляем счетчик: ${listenedCount} из ${totalCount}`);
        
        if (listenedCounter) {
            listenedCounter.textContent = `Прослушано ${listenedCount} из ${totalCount} аудиофайлов`;
        }
        
        updateGlobalProgressUI();
    }

    function updateGlobalProgressUI() {
        let listenedSec = 0;
        listenedChapters.forEach(i => {
            listenedSec += trackDurations[i] || 0;
        });
        const percent = totalDuration > 0 ? Math.round((listenedSec / totalDuration) * 100) : 0;
        
        console.log(`Общий прогресс: ${percent}% (${listenedSec}сек из ${totalDuration}сек)`);
        
        if (audioMainProgressFill) {
            audioMainProgressFill.style.width = `${percent}%`;
        }
        if (audioMainProgressText) {
            audioMainProgressText.textContent = `${percent}%`;
        }
    }

    function playTrack(index) {
        if (index < 0 || index >= audioTracks.length) {
            console.warn(`Неверный индекс трека: ${index}`);
            return;
        }
        
        console.log(`Воспроизводим трек ${index}: ${audioTracks[index].title}`);
        
        currentTrackIndex = index;
        audioElement.src = audioTracks[index].src;
        
        // Обновляем заголовки
        if (titleEl) titleEl.textContent = `${audioTracks[index].title}`;
        if (miniTitle) miniTitle.textContent = `${audioTracks[index].title}`;
        
        renderChapters();
        
        audioElement.play()
            .then(() => {
                isPlaying = true;
                updatePlayButtonUI();
                console.log('Воспроизведение началось');
            })
            .catch(e => {
                console.warn('Ошибка воспроизведения:', e);
                isPlaying = false;
                updatePlayButtonUI();
            });
    }

    function updatePlayButtonUI() {
        console.log(`Обновляем кнопки воспроизведения: ${isPlaying ? 'playing' : 'paused'}`);
        
        // Основной плеер
        const playIcon = playBtn?.querySelector('.play-icon');
        const pauseIcon = playBtn?.querySelector('.pause-icon');
        
        if (isPlaying) {
            if (playIcon) playIcon.style.display = 'none';
            if (pauseIcon) pauseIcon.style.display = 'block';
        } else {
            if (playIcon) playIcon.style.display = 'block';
            if (pauseIcon) pauseIcon.style.display = 'none';
        }

        // Мини-плеер
        const miniPlayIcon = miniPlayBtn?.querySelector('.fa-play');
        const miniPauseIcon = miniPlayBtn?.querySelector('.fa-pause');
        
        if (isPlaying) {
            if (miniPlayIcon) miniPlayIcon.style.display = 'none';
            if (miniPauseIcon) miniPauseIcon.style.display = 'block';
        } else {
            if (miniPlayIcon) miniPlayIcon.style.display = 'block';
            if (miniPauseIcon) miniPauseIcon.style.display = 'none';
        }
    }

    function updateMuteIcon() {
        const isMuted = audioElement.volume === 0;
        console.log(`Обновляем иконку звука: ${isMuted ? 'muted' : 'unmuted'}`);
        
        // Основной плеер
        const volumeIcon = muteBtn?.querySelector('.volume-icon');
        const muteIcon = muteBtn?.querySelector('.mute-icon');
        
        if (isMuted) {
            if (volumeIcon) volumeIcon.style.display = 'none';
            if (muteIcon) muteIcon.style.display = 'block';
        } else {
            if (volumeIcon) volumeIcon.style.display = 'block';
            if (muteIcon) muteIcon.style.display = 'none';
        }

        // Мини-плеер
        const miniVolumeIcon = miniMuteBtn?.querySelector('.fa-volume-up');
        const miniMuteIcon = miniMuteBtn?.querySelector('.fa-volume-mute');
        
        if (isMuted) {
            if (miniVolumeIcon) miniVolumeIcon.style.display = 'none';
            if (miniMuteIcon) miniMuteIcon.style.display = 'block';
        } else {
            if (miniVolumeIcon) miniVolumeIcon.style.display = 'block';
            if (miniMuteIcon) miniMuteIcon.style.display = 'none';
        }
    }

    function togglePlayPause() {
        console.log(`Переключаем воспроизведение: ${isPlaying ? 'pause' : 'play'}`);
        
        if (isPlaying) {
            audioElement.pause();
            isPlaying = false;
        } else {
            // Если это первое воспроизведение, загружаем текущий трек
            if (!audioElement.src && audioTracks.length > 0) {
                audioElement.src = audioTracks[currentTrackIndex].src;
            }
            
            audioElement.play().then(() => {
                isPlaying = true;
                console.log('Воспроизведение запущено');
            }).catch(e => {
                console.warn('Ошибка воспроизведения:', e);
                isPlaying = false;
            });
        }
        updatePlayButtonUI();
        saveProgress();
    }

    function formatTime(seconds) {
        if (isNaN(seconds) || !isFinite(seconds)) return '0:00';
        const min = Math.floor(seconds / 60);
        const sec = Math.floor(seconds % 60);
        return `${min}:${sec < 10 ? '0' : ''}${sec}`;
    }

    // === СОХРАНЕНИЕ И ВОССТАНОВЛЕНИЕ ПРОГРЕССА ===

    function saveProgress() {
        const progressData = {
            currentTrackIndex,
            currentTime: audioElement.currentTime || 0,
            isPlaying,
            listenedChapters: Array.from(listenedChapters),
            volume: audioElement.volume,
            timestamp: Date.now()
        };
        
        localStorage.setItem(progressKey, JSON.stringify(progressData));
        localStorage.setItem('audio_volume', audioElement.volume.toString());
        
        console.log('Прогресс сохранен:', {
            track: currentTrackIndex,
            time: audioElement.currentTime,
            listened: Array.from(listenedChapters)
        });
    }

    function restoreProgress() {
        try {
            const saved = localStorage.getItem(progressKey);
            if (saved) {
                const data = JSON.parse(saved);
                console.log('Восстанавливаем прогресс:', data);
                
                currentTrackIndex = data.currentTrackIndex || 0;
                isPlaying = data.isPlaying || false;
                
                if (Array.isArray(data.listenedChapters)) {
                    listenedChapters = new Set(data.listenedChapters);
                    console.log('Восстановлены прослушанные главы:', Array.from(listenedChapters));
                }
                
                // Восстанавливаем громкость
                const savedVolume = localStorage.getItem('audio_volume');
                if (savedVolume) {
                    const volume = parseFloat(savedVolume);
                    audioElement.volume = volume;
                    if (volumeSlider) volumeSlider.value = volume * 100;
                    if (miniVolumeSlider) miniVolumeSlider.value = volume * 100;
                }
                
                // СРАЗУ обновляем интерфейс с прослушанными главами
                updateListenedCounter();
                updateGlobalProgressUI();
                
                // Если есть текущий трек, обновляем заголовок
                if (audioTracks[currentTrackIndex]) {
                    if (titleEl) titleEl.textContent = `${audioTracks[currentTrackIndex].title}`;
                    if (miniTitle) miniTitle.textContent = `${audioTracks[currentTrackIndex].title}`;
                }
                
                updateMuteIcon();
                updatePlayButtonUI();
                
                console.log('Прогресс успешно восстановлен');
            } else {
                console.log('Сохраненный прогресс не найден');
            }
        } catch (e) {
            console.warn('Не удалось восстановить прогресс аудио:', e);
        }
    }

    // === СЛУШАТЕЛИ СОБЫТИЙ ===

    // Управление воспроизведением
    if (playBtn) {
        playBtn.addEventListener('click', togglePlayPause);
    } else {
        console.warn('Кнопка playBtn не найдена');
    }

    if (miniPlayBtn) {
        miniPlayBtn.addEventListener('click', togglePlayPause);
    }

    // Навигация по главам
    if (prevBtn) {
        prevBtn.addEventListener('click', () => {
            if (currentTrackIndex > 0) {
                playTrack(currentTrackIndex - 1);
            }
        });
    }
    
    if (nextBtn) {
        nextBtn.addEventListener('click', () => {
            if (currentTrackIndex < audioTracks.length - 1) {
                playTrack(currentTrackIndex + 1);
            }
        });
    }
    
    if (miniPrevBtn) {
        miniPrevBtn.addEventListener('click', () => {
            if (currentTrackIndex > 0) {
                playTrack(currentTrackIndex - 1);
            }
        });
    }
    
    if (miniNextBtn) {
        miniNextBtn.addEventListener('click', () => {
            if (currentTrackIndex < audioTracks.length - 1) {
                playTrack(currentTrackIndex + 1);
            }
        });
    }

    // Прогресс воспроизведения
    audioElement.addEventListener('timeupdate', () => {
        if (!audioElement.duration || isNaN(audioElement.duration)) return;
        
        const percent = (audioElement.currentTime / audioElement.duration) * 100;
        if (progressBar) progressBar.value = percent;
        if (miniProgressBar) miniProgressBar.value = percent;
        
        if (currentTimeEl) currentTimeEl.textContent = formatTime(audioElement.currentTime);
        if (miniCurrentTime) miniCurrentTime.textContent = formatTime(audioElement.currentTime);
        
        saveProgress();
    });

    audioElement.addEventListener('loadedmetadata', () => {
        if (audioElement.duration && !isNaN(audioElement.duration)) {
            if (totalTimeEl) totalTimeEl.textContent = formatTime(audioElement.duration);
            if (miniTotalTime) miniTotalTime.textContent = formatTime(audioElement.duration);
        }
    });

    audioElement.addEventListener('play', () => {
        isPlaying = true;
        updatePlayButtonUI();
    });

    audioElement.addEventListener('pause', () => {
        isPlaying = false;
        updatePlayButtonUI();
    });

    audioElement.addEventListener('ended', () => {
        console.log(`Трек ${currentTrackIndex} завершен`);
        isPlaying = false;
        updatePlayButtonUI();
        listenedChapters.add(currentTrackIndex);
        console.log('Добавлена прослушанная глава:', currentTrackIndex);
        renderChapters();
        saveProgress();
        
        // Автопереход к следующей главе
        if (currentTrackIndex + 1 < audioTracks.length) {
            console.log('Автопереход к следующей главе:', currentTrackIndex + 1);
            setTimeout(() => playTrack(currentTrackIndex + 1), 300);
        }
    });

    // Управление прогресс-баром
    if (progressBar) {
        progressBar.addEventListener('input', () => {
            if (audioElement.duration && !isNaN(audioElement.duration)) {
                audioElement.currentTime = (progressBar.value / 100) * audioElement.duration;
            }
        });
    }
    
    if (miniProgressBar) {
        miniProgressBar.addEventListener('input', () => {
            if (audioElement.duration && !isNaN(audioElement.duration)) {
                audioElement.currentTime = (miniProgressBar.value / 100) * audioElement.duration;
            }
        });
    }

    // Управление громкостью
    if (volumeSlider) {
        volumeSlider.addEventListener('input', () => {
            const vol = volumeSlider.value / 100;
            audioElement.volume = vol;
            if (miniVolumeSlider) miniVolumeSlider.value = volumeSlider.value;
            updateMuteIcon();
            localStorage.setItem('audio_volume', vol.toString());
            saveProgress();
        });
    }
    
    if (miniVolumeSlider) {
        miniVolumeSlider.addEventListener('input', () => {
            const vol = miniVolumeSlider.value / 100;
            audioElement.volume = vol;
            if (volumeSlider) volumeSlider.value = miniVolumeSlider.value;
            updateMuteIcon();
            localStorage.setItem('audio_volume', vol.toString());
            saveProgress();
        });
    }

    // Кнопка mute
    if (muteBtn) {
        muteBtn.addEventListener('click', () => {
            if (audioElement.volume > 0) {
                audioElement.volume = 0;
                if (volumeSlider) volumeSlider.value = 0;
                if (miniVolumeSlider) miniVolumeSlider.value = 0;
            } else {
                const savedVolume = localStorage.getItem('audio_volume');
                const volume = savedVolume ? parseFloat(savedVolume) : 0.4;
                audioElement.volume = volume;
                if (volumeSlider) volumeSlider.value = volume * 100;
                if (miniVolumeSlider) miniVolumeSlider.value = volume * 100;
            }
            updateMuteIcon();
            localStorage.setItem('audio_volume', audioElement.volume.toString());
            saveProgress();
        });
    }
    
    if (miniMuteBtn) {
        miniMuteBtn.addEventListener('click', () => {
            if (muteBtn) muteBtn.click();
        });
    }

    // Закрытие мини-плеера
    if (miniCloseBtn) {
        miniCloseBtn.addEventListener('click', () => {
            miniPlayer.classList.remove('visible');
        });
    }

    // === МИНИ-ПЛЕЕР: ПОЯВЛЕНИЕ КОГДА ОСНОВНОЙ НЕ ВИДЕН ===
// === МИНИ-ПЛЕЕР: ПОЛНОСТЬЮ ИСПРАВЛЕННЫЙ КОД ===
let isMiniPlayerManuallyClosed = false;

function updateMiniPlayerVisibility() {
    if (!audioPlayer || !miniPlayer) return;
    
    // Если плеер был закрыт вручную, не показываем его автоматически
    if (isMiniPlayerManuallyClosed) {
        console.log('Мини-плеер закрыт вручную, не показываем');
        return;
    }
    
    const audioPlayerRect = audioPlayer.getBoundingClientRect();
    const triggerPoint = 100;
    
    const audioPlayerTop = audioPlayerRect.top + window.pageYOffset;
    const currentScroll = window.pageYOffset;
    
    // Показываем мини-плеер только когда основной скрылся из виду
    // и мы прокрутили достаточно далеко вниз
    if (currentScroll > audioPlayerTop + triggerPoint) {
        miniPlayer.classList.add('visible');
        console.log('Показываем мини-плеер (автоматически)');
    } else {
        miniPlayer.classList.remove('visible');
        console.log('Скрываем мини-плеер (автоматически)');
    }
}

// Обновляем обработчик закрытия мини-плеера
if (miniCloseBtn) {
    miniCloseBtn.addEventListener('click', (e) => {
        e.stopPropagation();
        isMiniPlayerManuallyClosed = true;
        miniPlayer.classList.remove('visible');
        console.log('Мини-плеер закрыт вручную');
        
        
        setTimeout(() => {
            if (message.parentNode) {
                message.parentNode.removeChild(message);
            }
        }, 3000);
    });
}

// Сбрасываем флаг при скролле вверх
window.addEventListener('scroll', () => {
    if (isMiniPlayerManuallyClosed) {
        const audioPlayerRect = audioPlayer.getBoundingClientRect();
        const audioPlayerTop = audioPlayerRect.top + window.pageYOffset;
        const currentScroll = window.pageYOffset;
        
        // Если пользователь прокрутил выше основного плеера, разрешаем показ мини-плеера
        if (currentScroll <= audioPlayerTop) {
            isMiniPlayerManuallyClosed = false;
            console.log('Прокрутили выше основного плеера, разрешаем показ мини-плеера');
        }
    }
    updateMiniPlayerVisibility();
});

// Также сбрасываем флаг при клике на элементы управления основным плеером
if (playBtn) {
    playBtn.addEventListener('click', () => {
        if (isMiniPlayerManuallyClosed) {
            const audioPlayerRect = audioPlayer.getBoundingClientRect();
            const audioPlayerTop = audioPlayerRect.top + window.pageYOffset;
            const currentScroll = window.pageYOffset;
            
            // Если основной плеер виден, сбрасываем флаг
            if (currentScroll <= audioPlayerTop + 200) {
                isMiniPlayerManuallyClosed = false;
                updateMiniPlayerVisibility();
            }
        }
    });
}

    if (window.addEventListener) {
        window.addEventListener('scroll', updateMiniPlayerVisibility);
        window.addEventListener('resize', updateMiniPlayerVisibility);
    }

    // === ЗАПУСК ИНИЦИАЛИЗАЦИИ ===
    console.log('Запускаем инициализацию аудиоплеера...');
    loadAndRestoreProgress();
    
    // Инициализация видимости мини-плеера
    setTimeout(updateMiniPlayerVisibility, 100);
    setInterval(updateMiniPlayerVisibility, 1000);
    
    console.log('Аудиоплеер инициализирован успешно');
}

// Запускаем инициализацию аудиоплеера
initAudioPlayer();
});




// ============ ФИКС ПРОГРЕССА ЧТЕНИЯ ============
function fixReadingProgress() {
    console.log('Инициализация фикса прогресса чтения...');
    
    // Находим кнопку чтения и элементы прогресса
    const readButton = document.querySelector('.js-read-button');
    const pageProgressFill = document.getElementById('reading-progress-fill');
    const pageProgressText = document.getElementById('reading-progress-text');
    
    if (!readButton || !pageProgressFill || !pageProgressText) {
        console.log('Не найдены необходимые элементы для прогресса чтения');
        return;
    }
    
    // Создаем уникальный ключ для этой книги
    const bookUrl = readButton.getAttribute('data-book-url');
    if (!bookUrl || bookUrl === '#') {
        console.log('URL книги не найден');
        return;
    }
    
    const bookKey = 'reading_progress_' + btoa(bookUrl).replace(/[^a-zA-Z0-9]/g, '').substring(0, 32);
    console.log('Ключ книги:', bookKey);
    
    // Функция для сохранения прогресса
    function saveProgress(percent) {
        const progressData = {
            percent: percent,
            timestamp: Date.now(),
            bookUrl: bookUrl
        };
        localStorage.setItem(bookKey, JSON.stringify(progressData));
        console.log('Прогресс сохранен:', percent + '%');
    }
    
    // Функция для загрузки прогресса
    function loadProgress() {
        try {
            const saved = localStorage.getItem(bookKey);
            if (saved) {
                const data = JSON.parse(saved);
                console.log('Загружен прогресс:', data.percent + '%');
                return data.percent || 0;
            }
        } catch (e) {
            console.warn('Ошибка загрузки прогресса:', e);
        }
        return 0;
    }
    
    // Функция для обновления отображения прогресса
    function updateProgressDisplay(percent) {
        pageProgressFill.style.width = percent + '%';
        pageProgressText.textContent = percent + '%';
        console.log('Обновлено отображение прогресса:', percent + '%');
    }
    
    // Восстанавливаем прогресс при загрузке страницы
    const savedProgress = loadProgress();
    updateProgressDisplay(savedProgress);
    console.log('Прогресс восстановлен при загрузке:', savedProgress + '%');
    
    // Перехватываем клик на кнопке чтения для обновления прогресса в читальном зале
    const originalClick = readButton.onclick;
    readButton.onclick = function(e) {
        e.preventDefault();
        
        // Сохраняем текущий прогресс перед открытием читального зала
        const currentProgress = loadProgress();
        console.log('Текущий прогресс перед открытием читального зала:', currentProgress + '%');
        
        // Открываем читальный зал
        const modal = document.getElementById('readingHall');
        if (modal) {
            modal.classList.add('active');
            document.body.style.overflow = 'hidden';
            
            // Ждем пока загрузится книга и восстанавливаем прогресс
            setTimeout(() => {
                const fullContent = document.getElementById('rhFullContent');
                const progressBar = document.getElementById('rhProgressBar');
                const progressTopElem = document.getElementById('rhProgressTop');
                
                if (fullContent && progressBar && progressTopElem) {
                    // Восстанавливаем позицию скролла
                    const scrollHeight = fullContent.scrollHeight - fullContent.clientHeight;
                    const scrollPosition = (currentProgress / 100) * scrollHeight;
                    fullContent.scrollTop = scrollPosition;
                    
                    // Обновляем прогресс в читальном зале
                    progressBar.style.width = currentProgress + '%';
                    progressTopElem.textContent = currentProgress + '%';
                    
                    console.log('Прогресс восстановлен в читальном зале:', currentProgress + '%');
                    
                    // Запускаем отслеживание скролла
                    let scrollInterval = setInterval(() => {
                        const scrollTop = fullContent.scrollTop;
                        const newScrollHeight = fullContent.scrollHeight - fullContent.clientHeight;
                        const newProgress = newScrollHeight > 0 ? Math.round((scrollTop / newScrollHeight) * 100) : 0;
                        
                        // Сохраняем прогресс
                        saveProgress(newProgress);
                        updateProgressDisplay(newProgress);
                        
                        // Обновляем в читальном зале
                        progressBar.style.width = newProgress + '%';
                        progressTopElem.textContent = newProgress + '%';
                        
                    }, 1000);
                    
                    // Останавливаем отслеживание при закрытии читального зала
                    const exitBtn = document.getElementById('rhExit');
                    if (exitBtn) {
                        const originalExitClick = exitBtn.onclick;
                        exitBtn.onclick = function() {
                            if (scrollInterval) clearInterval(scrollInterval);
                            modal.classList.remove('active');
                            document.body.style.overflow = '';
                            if (originalExitClick) originalExitClick.call(this);
                        };
                    }
                }
            }, 1000);
        }
        
        // Загружаем книгу
        const textElement = document.getElementById('rhText');
        if (textElement) {
            textElement.innerHTML = '<div style="text-align:center;padding:80px;color:#ccc;"><i class="fas fa-spinner fa-spin" style="font-size:48px;margin-bottom:20px;"></i><br>📖 Загружаем книгу...</div>';
            
            fetch(bookUrl)
                .then(response => {
                    if (!response.ok) throw new Error('Сеть ответила с ошибкой: ' + response.status);
                    return response.text();
                })
                .then(fbxContent => {
                    const parser = new DOMParser();
                    const xmlDoc = parser.parseFromString(fbxContent, 'application/xml');
                    const parserError = xmlDoc.querySelector('parsererror');
                    if (parserError) throw new Error('Некорректный формат FB2');
                    
                    const binaries = new Map();
                    xmlDoc.querySelectorAll('binary').forEach(el => {
                        const id = el.getAttribute('id') || el.getAttribute('rdf:id');
                        const contentType = el.getAttribute('content-type') || 'image/jpeg';
                        if (id) binaries.set(id, `data:${contentType};base64,${el.textContent.trim()}`);
                    });
                    
                    const body = xmlDoc.querySelector('body');
                    if (!body) throw new Error('В FB2 отсутствует тело книги');
                    
                    // Обрабатываем контент
                    const processedContent = processFB2Content(body, binaries, bookUrl);
                    textElement.innerHTML = '';
                    textElement.appendChild(processedContent);
                    
                    const titleInfo = xmlDoc.querySelector('title-info > title');
                    const bookTitleElem = document.querySelector('.rh-book-title');
                    if (bookTitleElem) {
                        bookTitleElem.textContent = titleInfo ? titleInfo.textContent.trim() : 'Для воспроизведения нажмите play';
                    }
                })
                .catch(error => {
                    console.error('Ошибка загрузки книги:', error);
                    textElement.innerHTML = `<div style="text-align:center;padding:50px;color:#f5222d;font-size:18px;">
                        ❌ Не удалось загрузить книгу.<br>
                        <small>${error.message}</small>
                    </div>`;
                });
        }
    };
    
    // Вспомогательная функция для обработки FB2 контента
    function processFB2Content(bodyNode, binariesMap, bookUrl) {
        const clonedNode = bodyNode.cloneNode(true);
        let htmlString = new XMLSerializer().serializeToString(clonedNode);
        htmlString = htmlString
            .replace(/<fb2:/g, '<')
            .replace(/<\/fb2:/g, '</')
            .replace(/<empty-line[^>]*\/?>/g, '<br>')
            .replace(/<subtitle[^>]*>/g, '<subtitle>')
            .replace(/<\/subtitle>/g, '</subtitle>')
            .replace(/<image[^>]+l:href="([^"]+)"[^>]*\/?>/g, (_, src) => `<div class="fb2-image-placeholder" data-src="${src}"></div>`)
            .replace(/<image[^>]+href="([^"]+)"[^>]*\/?>/g, (_, src) => `<div class="fb2-image-placeholder" data-src="${src}"></div>`);
        
        const tempContainer = document.createElement('div');
        tempContainer.innerHTML = htmlString;
        tempContainer.querySelectorAll('script, link, style').forEach(el => el.remove());
        
        tempContainer.querySelectorAll('.fb2-image-placeholder').forEach(placeholder => {
            const imageSrc = placeholder.getAttribute('data-src');
            if (!imageSrc) return;
            
            if (imageSrc.startsWith('#')) {
                const imageId = imageSrc.slice(1);
                if (binariesMap.has(imageId)) {
                    const img = document.createElement('img');
                    img.src = binariesMap.get(imageId);
                    img.className = 'fb2-image';
                    img.alt = 'Изображение';
                    placeholder.replaceWith(img);
                } else {
                    placeholder.remove();
                }
            } else {
                try {
                    const baseUrl = new URL(bookUrl).origin;
                    const finalUrl = new URL(imageSrc, baseUrl).href;
                    const img = document.createElement('img');
                    img.src = finalUrl;
                    img.className = 'fb2-image';
                    img.alt = 'Изображение';
                    img.onerror = () => { img.style.opacity = '0.3'; };
                    placeholder.replaceWith(img);
                } catch (e) {
                    placeholder.remove();
                }
            }
        });
        
        return tempContainer;
    }
    
    console.log('Фикс прогресса чтения инициализирован');
}

// Запускаем при загрузке страницы
document.addEventListener('DOMContentLoaded', function() {
    console.log('=== ЗАПУСК ФИКСА ПРОГРЕССА ЧТЕНИЯ ===');
    fixReadingProgress();
});

// Альтернативный запуск
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', fixReadingProgress);
} else {
    fixReadingProgress();
}

// ============ КНОПКА "СЛУШАТЬ" ============
document.addEventListener('DOMContentLoaded', function() {
    const listenBtn = document.querySelector('.fa-headphones').closest('.btn');
    const audioPlayer = document.getElementById('audio-open');
    
    listenBtn.addEventListener('click', function() {
        audioPlayer.scrollIntoView({ behavior: 'smooth' });
        document.getElementById('play-pause-btn').click();
    });
});
</script>