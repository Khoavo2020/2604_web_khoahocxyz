
(function($) {

	var	$window = $(window),
		$head = $('head'),
		$body = $('body');

	// Breakpoints.
		breakpoints({
			xlarge:   [ '1281px',  '1680px' ],
			large:    [ '981px',   '1280px' ],
			medium:   [ '737px',   '980px'  ],
			small:    [ '481px',   '736px'  ],
			xsmall:   [ '361px',   '480px'  ],
			xxsmall:  [ null,      '360px'  ],
			'xlarge-to-max':    '(min-width: 1681px)',
			'small-to-xlarge':  '(min-width: 481px) and (max-width: 1680px)'
		});

	// Stops animations/transitions until the page has ...

		// ... loaded.
			$window.on('load', function() {
				window.setTimeout(function() {
					$body.removeClass('is-preload');
				}, 100);
			});

		// ... stopped resizing.
			var resizeTimeout;

			$window.on('resize', function() {

				// Mark as resizing.
					$body.addClass('is-resizing');

				// Unmark after delay.
					clearTimeout(resizeTimeout);

					resizeTimeout = setTimeout(function() {
						$body.removeClass('is-resizing');
					}, 100);

			});

	// Fixes.

		// Object fit images.
			if (!browser.canUse('object-fit')
			||	browser.name == 'safari')
				$('.image.object').each(function() {

					var $this = $(this),
						$img = $this.children('img');

					// Hide original image.
						$img.css('opacity', '0');

					// Set background.
						$this
							.css('background-image', 'url("' + $img.attr('src') + '")')
							.css('background-size', $img.css('object-fit') ? $img.css('object-fit') : 'cover')
							.css('background-position', $img.css('object-position') ? $img.css('object-position') : 'center');

				});

	// Sidebar.
		var $sidebar = $('#sidebar'),
			$sidebar_inner = $sidebar.children('.inner');

		// Inactive by default on <= large.
			breakpoints.on('<=large', function() {
				$sidebar.addClass('inactive');
			});

			breakpoints.on('>large', function() {
				$sidebar.removeClass('inactive');
			});

		// Hack: Workaround for Chrome/Android scrollbar position bug.
			if (browser.os == 'android'
			&&	browser.name == 'chrome')
				$('<style>#sidebar .inner::-webkit-scrollbar { display: none; }</style>')
					.appendTo($head);

		// Toggle.
			$('<a href="#sidebar" class="toggle">Toggle</a>')
				.appendTo($sidebar)
				.on('click', function(event) {

					// Prevent default.
						event.preventDefault();
						event.stopPropagation();

					// Toggle.
						$sidebar.toggleClass('inactive');

				});

		// Events.

			// Link clicks.
				$sidebar.on('click', 'a', function(event) {

					// >large? Bail.
						if (breakpoints.active('>large'))
							return;

					// Vars.
						var $a = $(this),
							href = $a.attr('href'),
							target = $a.attr('target');

					// Prevent default.
						event.preventDefault();
						event.stopPropagation();

					// Check URL.
						if (!href || href == '#' || href == '')
							return;

					// Hide sidebar.
						$sidebar.addClass('inactive');

					// Redirect to href.
						setTimeout(function() {

							if (target == '_blank')
								window.open(href);
							else
								window.location.href = href;

						}, 500);

				});

			// Prevent certain events inside the panel from bubbling.
				$sidebar.on('click touchend touchstart touchmove', function(event) {

					// >large? Bail.
						if (breakpoints.active('>large'))
							return;

					// Prevent propagation.
						event.stopPropagation();

				});

			// Hide panel on body click/tap.
				$body.on('click touchend', function(event) {

					// >large? Bail.
						if (breakpoints.active('>large'))
							return;

					// Deactivate.
						$sidebar.addClass('inactive');

				});

		// Scroll lock.
		// Note: If you do anything to change the height of the sidebar's content, be sure to
		// trigger 'resize.sidebar-lock' on $window so stuff doesn't get out of sync.

			$window.on('load.sidebar-lock', function() {

				var sh, wh, st;

				// Reset scroll position to 0 if it's 1.
					if ($window.scrollTop() == 1)
						$window.scrollTop(0);

				$window
					.on('scroll.sidebar-lock', function() {

						var x, y;

						// <=large? Bail.
							if (breakpoints.active('<=large')) {

								$sidebar_inner
									.data('locked', 0)
									.css('position', '')
									.css('top', '');

								return;

							}

						// Calculate positions.
							x = Math.max(sh - wh, 0);
							y = Math.max(0, $window.scrollTop() - x);

						// Lock/unlock.
							if ($sidebar_inner.data('locked') == 1) {

								if (y <= 0)
									$sidebar_inner
										.data('locked', 0)
										.css('position', '')
										.css('top', '');
								else
									$sidebar_inner
										.css('top', -1 * x);

							}
							else {

								if (y > 0)
									$sidebar_inner
										.data('locked', 1)
										.css('position', 'fixed')
										.css('top', -1 * x);

							}

					})
					.on('resize.sidebar-lock', function() {

						// Calculate heights.
							wh = $window.height();
							sh = $sidebar_inner.outerHeight() + 30;

						// Trigger scroll.
							$window.trigger('scroll.sidebar-lock');

					})
					.trigger('resize.sidebar-lock');

				});

	// Menu.
		var $menu = $('#menu'),
			$menu_openers = $menu.children('ul').find('.opener');

		// Keep "Triết học" submenu open when visiting triết học pages.
			(function() {
				var path = (window.location.pathname || '').toLowerCase();

				$menu_openers.each(function() {
					var $opener = $(this);
					var text = $opener.text().toLowerCase();

					if (path.indexOf('triet-hoc') !== -1 && text.indexOf('triết học') !== -1)
						$opener.addClass('active');

					if (path.indexOf('tu-sach-nen-tang') !== -1 && (text.indexOf('tủ sách') !== -1 || text.indexOf('tu sach') !== -1))
						$opener.addClass('active');
				});
			})();

		// Openers.
			$menu_openers.each(function() {

				var $this = $(this);

				$this.on('click', function(event) {

					// Toggle.
						$menu_openers.not($this).removeClass('active');
						$this.toggleClass('active');

					// If it's a link, navigate.
						if ($this.is('a')) {
							window.location.href = $this.attr('href');
						}

					// Trigger resize (sidebar lock).
						$window.triggerHandler('resize.sidebar-lock');

				});

			});

	// Sidebar search.
		(function() {
			var form = document.querySelector('#search form');
			var input = document.getElementById('query');
			var resultsEl;
			var activeResults = [];
			var searchInitialized = false;

			if (!form || !input)
				return;

			function guessSiteRoot() {
				var scripts = document.getElementsByTagName('script');
				var i;
				var src;

				if (window.siteSearchRoot)
					return window.siteSearchRoot;

				for (i = 0; i < scripts.length; i++) {
					src = scripts[i].src || '';

					if (/assets\/js\/main\.js(?:\?.*)?$/.test(src))
						return src.replace(/assets\/js\/main\.js(?:\?.*)?$/, '');
				}

				return '';
			}

			function normalizeText(value) {
				var text = String(value || '').toLowerCase().trim();

				if (text.normalize)
					text = text.normalize('NFD').replace(/[\u0300-\u036f]/g, '');

				return text.replace(/\s+/g, ' ');
			}

			function escapeHtml(value) {
				return String(value || '')
					.replace(/&/g, '&amp;')
					.replace(/</g, '&lt;')
					.replace(/>/g, '&gt;')
					.replace(/"/g, '&quot;')
					.replace(/'/g, '&#39;');
			}

			function resolveHref(href) {
				var siteRoot = guessSiteRoot();

				if (!href)
					return '#';

				if (/^(?:https?:)?\/\//.test(href))
					return href;

				if (siteRoot)
					return new URL(href, siteRoot).href;

				return href;
			}

			function scoreItem(item, query) {
				var title = normalizeText(item.title);
				var section = normalizeText(item.section);
				var description = normalizeText(item.description);
				var score = 0;

				if (title.indexOf(query) !== -1)
					score += title === query ? 120 : 80;

				if (section.indexOf(query) !== -1)
					score += 30;

				if (description.indexOf(query) !== -1)
					score += 15;

				if (item.type === 'article')
					score += 10;

				return score;
			}

			function search(query) {
				var searchIndex = window.siteSearchIndex || [];

				return searchIndex
					.map(function(item) {
						return {
							title: item.title,
							description: item.description,
							href: resolveHref(item.href),
							section: item.section,
							type: item.type,
							score: scoreItem(item, query)
						};
					})
					.filter(function(item) {
						return item.score > 0;
					})
					.sort(function(a, b) {
						if (b.score !== a.score)
							return b.score - a.score;

						return a.title.localeCompare(b.title);
					})
					.slice(0, 8);
			}

			function ensureResultsEl() {
				if (resultsEl)
					return resultsEl;

				resultsEl = document.createElement('div');
				resultsEl.className = 'search-results';
				resultsEl.hidden = true;
				form.appendChild(resultsEl);
				return resultsEl;
			}

			function hideResults() {
				if (!resultsEl)
					return;

				resultsEl.hidden = true;
				resultsEl.innerHTML = '';
				activeResults = [];
			}

			function renderResults(items, query) {
				var container = ensureResultsEl();

				activeResults = items;

				if (!query) {
					hideResults();
					return;
				}

				if (!items.length) {
					container.innerHTML = '<p class="search-results-empty">Không tìm thấy kết quả phù hợp.</p>';
					container.hidden = false;
					return;
				}

				container.innerHTML = items.map(function(item) {
					var description = item.description ? '<p>' + escapeHtml(item.description) + '</p>' : '';
					return [
						'<a class="search-result" href="', escapeHtml(item.href), '">',
						'<span class="search-result-type">', escapeHtml(item.section || item.type || ''), '</span>',
						'<strong>', escapeHtml(item.title), '</strong>',
						description,
						'</a>'
					].join('');
				}).join('');
				container.hidden = false;
			}

			input.setAttribute('autocomplete', 'off');

			function bindEvents() {
				if (searchInitialized)
					return;

				searchInitialized = true;

				input.addEventListener('input', function() {
					var query = normalizeText(input.value);

					if (query.length < 2) {
						hideResults();
						return;
					}

					renderResults(search(query), query);
				});

				input.addEventListener('focus', function() {
					var query = normalizeText(input.value);

					if (query.length >= 2)
						renderResults(search(query), query);
				});

				input.addEventListener('keydown', function(event) {
					if (event.key === 'Escape') {
						hideResults();
						return;
					}

					if (event.key === 'Enter' && activeResults.length) {
						event.preventDefault();
						window.location.href = activeResults[0].href;
					}
				});

				form.addEventListener('submit', function(event) {
					event.preventDefault();

					if (activeResults.length)
						window.location.href = activeResults[0].href;
				});

				document.addEventListener('click', function(event) {
					if (!form.contains(event.target))
						hideResults();
				});
			}

			function ensureSearchIndex() {
				var searchIndex = window.siteSearchIndex || [];
				var siteRoot = guessSiteRoot();
				var script;

				if (searchIndex.length) {
					bindEvents();
					return;
				}

				if (!siteRoot)
					return;

				script = document.createElement('script');
				script.src = siteRoot + 'assets/js/site-search-index.js';
				script.onload = bindEvents;
				document.body.appendChild(script);
			}

			ensureSearchIndex();
		})();

	// Homepage sections.
		(function() {
			var dataNode = document.getElementById('homepage-sections-data');
			var containers = document.querySelectorAll('[data-home-list]');

			if (!dataNode || !containers.length)
				return;

			function escapeHtml(value) {
				return String(value || '')
					.replace(/&/g, '&amp;')
					.replace(/</g, '&lt;')
					.replace(/>/g, '&gt;')
					.replace(/"/g, '&quot;')
					.replace(/'/g, '&#39;');
			}

			function getDateKey() {
				var formatter = new Intl.DateTimeFormat('en-CA', {
					timeZone: 'Asia/Ho_Chi_Minh',
					year: 'numeric',
					month: '2-digit',
					day: '2-digit'
				});
				var parts = formatter.formatToParts(new Date());
				var values = {};

				parts.forEach(function(part) {
					if (part.type !== 'literal')
						values[part.type] = part.value;
				});

				return [values.year, values.month, values.day].join('-');
			}

			function xmur3(str) {
				var i;
				var h = 1779033703 ^ str.length;
				for (i = 0; i < str.length; i++)
					h = Math.imul(h ^ str.charCodeAt(i), 3432918353);

				return function() {
					h = Math.imul(h ^ (h >>> 16), 2246822507);
					h = Math.imul(h ^ (h >>> 13), 3266489909);
					return (h ^= h >>> 16) >>> 0;
				};
			}

			function mulberry32(seed) {
				return function() {
					var t = seed += 0x6D2B79F5;
					t = Math.imul(t ^ (t >>> 15), t | 1);
					t ^= t + Math.imul(t ^ (t >>> 7), t | 61);
					return ((t ^ (t >>> 14)) >>> 0) / 4294967296;
				};
			}

			function pickDailyArticles(items, count, seedKey) {
				var shuffled = items.slice();
				var rand = mulberry32(xmur3(seedKey)());
				var i, j, temp;

				for (i = shuffled.length - 1; i > 0; i--) {
					j = Math.floor(rand() * (i + 1));
					temp = shuffled[i];
					shuffled[i] = shuffled[j];
					shuffled[j] = temp;
				}

				return shuffled.slice(0, Math.min(count, shuffled.length));
			}

			function renderArticle(article) {
				var href = escapeHtml(article.href);
				var title = escapeHtml(article.title);
				var description = escapeHtml(article.description);
				var image = article.image
					? '<a href="' + href + '" class="image"><img src="' + escapeHtml(article.image) + '" alt="' + title + '"></a>'
					: '';

				return [
					'<article>',
					'<h3><a href="' + href + '">' + title + '</a></h3>',
					'<div class="cover-item-body">',
					image,
					'<p>' + description + '</p>',
					'</div>',
					'</article>'
				].join('');
			}

			try {
				var payload = JSON.parse(dataNode.textContent || '{}');
				var sections = payload.sections || [];
				var dateKey = getDateKey();

				sections.forEach(function(section) {
					var container = document.querySelector('[data-home-list="' + section.slug + '"]');
					var selectedArticles;

					if (!container)
						return;

					selectedArticles = pickDailyArticles(section.articles || [], 2, section.slug + '|' + dateKey);
					container.innerHTML = selectedArticles.map(renderArticle).join('');

					if (selectedArticles.length === 1)
						container.classList.add('keep-divider');
					else
						container.classList.remove('keep-divider');
				});
			}
			catch (error) {
				console.error('Unable to render homepage sections', error);
			}
		})();

})(jQuery);
