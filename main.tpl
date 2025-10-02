<!DOCTYPE html>
<html lang="ru">
<head>
	{headers}
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="theme-color" content="#181d2d">
    <link rel="preload" href="{THEME}/css/common.css" as="style">
    <link rel="preload" href="{THEME}/css/styles.css" as="style">
    <link rel="preload" href="{THEME}/css/engine.css" as="style">

 
    <link rel="icon" type="image/png" href="{THEME}/favicon/favicon-96x96.png" sizes="96x96" />
    <link rel="icon" type="image/svg+xml" href="{THEME}/favicon/favicon.svg" />
    <link rel="shortcut icon" href="{THEME}/favicon/favicon.ico" />
    <link rel="apple-touch-icon" sizes="180x180" href="{THEME}/favicon/apple-touch-icon.png" />
   
    <link href="{THEME}/css/common.css" type="text/css" rel="stylesheet" />
	<link href="{THEME}/css/styles.css" type="text/css" rel="stylesheet" />
	<link href="{THEME}/css/engine.css" type="text/css" rel="stylesheet" />
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.7.2/css/all.min.css">
</head>

<body>

	<script>
		function switchLight() {
			if (localStorage.getItem('theme') === 'light') {
				document.querySelector('body').classList.add('lt-is-active');
			} else {
				document.querySelector('body').classList.remove('lt-is-active');
			};
		};
		switchLight();
	</script>	

	<div class="wrapper [available=main|showfull] add-bg[/available][available=showfull] infull[/available]">

		<div class="wrapper-container wrapper-main">

			<header class="header vw100 anim" id="header">
			
[available=main]
<header class="compact-header">
      <div class="container">
        <div class="compact-header-content fade-in">
          <h1 class="compact-logo">
            <i class="fas fa-book-open compact-logo-icon"></i>
            Цифровая Библиотека
          </h1>
          <p class="compact-subtitle">
            Читайте и слушайте любимые книги онлайн
          </p>

        </div>
      </div>
    </header>
[/available]

[not-available=main]
<div class="header__inner d-flex ai-center anim">
<a href="/" class="back-btn"><i class="fas fa-chevron-left"></i>Назад к библиотеке</a>		
<a href="/" class="logo header__logo">TOOK <span>BOOK </span><i class="fas fa-book-open"></i></a>
</div>
[/not-available]
				
				
				<div class="header__menu">
					<div class="header__menu-inner wrapper-container">{include file="main-menu.tpl"}</div>
				</div>
			</header>

			<!-- END HEADER -->

			<main class="content">

				{info}

				[available=main]{include file="main-page.tpl"}[/available]
				
				[available=main|cat]
				<div class="sect">
					<div class="sect__header sect__header--bordered d-flex ai-center" style="justify-content: center;">
						[available=main]
<h4 style="font-size: 1.5rem;font-weight: 600;margin-bottom: 10px;color: #667ea1;">Доступные книги</h4>
						[/available]
						
					</div>
					<div class="sect__content grid-items">{content}</div>
				</div>
				[/available]

				[not-available=main|cat]
				<div class="sect__content grid-items">{content}</div>
				[/not-available]

				{include file="main-seo.tpl"}

			</main>

			<!-- END CONTENT -->

			<footer class="footer d-flex ai-center vw100">
				<div class="logo footer__logo">TOOK-BOOK.<span>RU</span></div>
				<ul class="footer__menu flex-grow-1 d-flex jc-flex-end">
					<li><a href="#">Главная</a></li>
					<li><a href="#">Контакты</a></li>
				</ul>
			</footer>

			<!-- END FOOTER -->

		</div>

		<!-- END WRAPPER-MAIN -->

	</div>

	<!-- END WRAPPER -->
	
	{jsfiles}
	<script src="{THEME}/js/libs.js"></script>
	{AJAX}

</body>
</html>
