
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

					if (path.indexOf('ung-dung-nang-suat') !== -1 && (text.indexOf('ứng dụng') !== -1 || text.indexOf('ung dung') !== -1))
						$opener.addClass('active');
				});
			})();

		// Openers.
			$menu_openers.each(function() {

				var $this = $(this);

				$this.on('click', function(event) {
					var isActive = $this.hasClass('active');

					// First click opens the submenu. Second click follows the link.
						if (!isActive) {
							event.preventDefault();
							$menu_openers.not($this).removeClass('active');
							$this.addClass('active');
							$window.triggerHandler('resize.sidebar-lock');
							return;
						}

					// Trigger resize (sidebar lock).
						$window.triggerHandler('resize.sidebar-lock');

				});

			});

	// Sidebar quote.
		(function() {
			var quoteSection = document.getElementById('sidebar-quote');

			if (!quoteSection)
				return;

			var quotesRoot = quoteSection.getAttribute('data-quotes-root');
			var quoteBody = quoteSection.querySelector('.sidebar-quote-body');
			var statusEl = quoteSection.querySelector('.sidebar-quote-status');

			if (!quotesRoot || !quoteBody || !statusEl)
				return;

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

			function hasNonAscii(text) {
				return /[^\x00-\x7F]/.test(text || '');
			}

			function pickDailyFile(files) {
				var seed = xmur3(getDateKey() + '|sidebar-quote')();

				if (!files.length)
					return '';

				return files[seed % files.length];
			}

			function parseQuote(text) {
				var lines = String(text || '')
					.split(/\r?\n/)
					.map(function(line) {
						return line.trim();
					})
					.filter(Boolean);
				var line1;
				var line2;
				var author;
				var vietnamese;
				var english;

				if (lines.length < 2)
					return null;

				line1 = lines[0] || '';
				line2 = lines[1] || '';
				author = lines[2] || '';
				vietnamese = line1;
				english = line2;

				if (!hasNonAscii(line1) && hasNonAscii(line2)) {
					vietnamese = line2;
					english = line1;
				}
				else if (hasNonAscii(line1) && !hasNonAscii(line2)) {
					vietnamese = line1;
					english = line2;
				}

				author = author.replace(/^--\s*/, '').replace(/\s*--$/, '').trim();

				return {
					vietnamese: vietnamese
				};
			}

			function renderQuote(quote) {
				var fragments = [];

				if (quote.vietnamese)
					fragments.push('<p class="sidebar-quote-text">"' + quote.vietnamese + '"</p>');

				quoteBody.innerHTML = fragments.join('');
			}

			fetch(quotesRoot + '/manifest.json')
				.then(function(res) {
					if (!res.ok)
						throw new Error('Manifest not found');

					return res.json();
				})
				.then(function(files) {
					var file = pickDailyFile((files || []).filter(Boolean));

					if (!file)
						throw new Error('No quote files');

					return fetch(quotesRoot + '/' + encodeURIComponent(file));
				})
				.then(function(res) {
					if (!res.ok)
						throw new Error('Quote file not found');

					return res.text();
				})
				.then(function(text) {
					var quote = parseQuote(text);

					if (!quote)
						throw new Error('Invalid quote format');

					renderQuote(quote);
				})
				.catch(function() {
					statusEl.textContent = 'Chưa tải được trích dẫn hôm nay.';
				});
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
