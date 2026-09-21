(function () {
	'use strict';

	var visualPicker = document.getElementById('visual-picker');
	var mixedPicker = document.getElementById('mixed-picker');
	var picker = visualPicker;
	var stage = document.getElementById('test-stage');
	var activeMode = 'visual';
	var activeTests = [];
	var currentTest;
	var currentIndex = 0;
	var answers = [];
	var timerId;
	var secondsLeft = 0;
	var categoryNames = { mixed: 'Tổng hợp', logical: 'Logic', pattern: 'Quy luật', numerical: 'Số học', spatial: 'Không gian', verbal: 'Ngôn ngữ' };
	var ageNames = { child: '🧒 Trẻ em', teen: '🧑 Thiếu niên', adult: '👨 Người lớn' };

	function escapeHtml(value) {
		return String(value).replace(/[&<>'"]/g, function (character) {
			return { '&': '&amp;', '<': '&lt;', '>': '&gt;', "'": '&#39;', '"': '&quot;' }[character];
		});
	}

	function formatTime(totalSeconds) {
		var minutes = Math.floor(totalSeconds / 60);
		var seconds = totalSeconds % 60;
		return String(minutes).padStart(2, '0') + ':' + String(seconds).padStart(2, '0');
	}

	function symbolSvg(symbol, size) {
		var shape = '';
		var fill = '#0d7774';
		var stroke = '#183b3b';
		if (symbol === 'circle') shape = '<circle cx="50" cy="50" r="25" fill="' + fill + '" stroke="' + stroke + '" stroke-width="5" />';
		else if (symbol === 'square') shape = '<rect x="25" y="25" width="50" height="50" rx="4" fill="' + fill + '" stroke="' + stroke + '" stroke-width="5" />';
		else if (symbol === 'triangle') shape = '<path d="M50 20 L80 78 L20 78 Z" fill="' + fill + '" stroke="' + stroke + '" stroke-width="5" stroke-linejoin="round" />';
		else if (symbol === 'diamond') shape = '<path d="M50 18 L82 50 L50 82 L18 50 Z" fill="#e56f54" stroke="' + stroke + '" stroke-width="5" stroke-linejoin="round" />';
		else if (symbol === 'pentagon') shape = '<path d="M50 16 L82 39 L70 78 L30 78 L18 39 Z" fill="#f5c451" stroke="' + stroke + '" stroke-width="5" stroke-linejoin="round" />';
		else if (symbol === 'hexagon') shape = '<path d="M28 20 L72 20 L84 50 L72 80 L28 80 L16 50 Z" fill="#f5c451" stroke="' + stroke + '" stroke-width="5" stroke-linejoin="round" />';
		else if (symbol === 'missing') shape = '<path d="M50 20 L80 50 L50 80 L20 50 Z" fill="none" stroke="#9ab2ad" stroke-width="5" stroke-dasharray="7 6" />';
		else if (symbol.indexOf('arrow-') === 0) {
			var rotations = { 'arrow-up': 0, 'arrow-right': 90, 'arrow-down': 180, 'arrow-left': 270 };
			shape = '<path d="M50 15 L82 50 L64 50 L64 84 L36 84 L36 50 L18 50 Z" fill="#e56f54" stroke="' + stroke + '" stroke-width="5" stroke-linejoin="round" transform="rotate(' + rotations[symbol] + ' 50 50)" />';
		}
		return '<svg class="iq-visual" width="' + size + '" height="' + size + '" viewBox="0 0 100 100" role="img" aria-label="Hình lựa chọn">' + shape + '</svg>';
	}

	function visualMarkup(visual) {
		if (visual.kind === 'grid') return '<div class="visual-grid">' + visual.items.map(function (item) { return '<div>' + symbolSvg(item, 64) + '</div>'; }).join('') + '</div>';
		return '<div class="visual-sequence">' + visual.items.map(function (item) { return symbolSvg(item, 76); }).join('') + '</div>';
	}

	function renderPicker(tests, target, mode) {
		var groups = ['child', 'teen', 'adult'];
		target.innerHTML = groups.map(function (group) {
			var test = tests.find(function (item) { return item.ageGroup === group; });
			if (!test) return '';
			return '<article class="age-group"><h2>' + ageNames[group] + '</h2><p class="age-range">' + escapeHtml(test.ageRange) + ' tuổi</p>' +
				'<div class="test-card"><h3>' + escapeHtml(test.title) + '</h3><p>' + escapeHtml(test.description) + '</p><div class="test-meta">' + test.questionCount + ' câu · ' + Math.round(test.timeLimit / 60) + ' phút · ' + (mode === 'visual' ? '100% hình ảnh' : '6 nhóm tư duy') + '</div><button class="iq-button start-test" data-test-id="' + escapeHtml(test.id) + '">Bắt đầu bài test</button></div></article>';
		}).join('');
		target.querySelectorAll('.start-test').forEach(function (button) {
			button.addEventListener('click', function () {
				activeMode = mode;
				picker = target;
				startTest(tests.find(function (test) { return test.id === button.dataset.testId; }));
			});
		});
	}

	function startTest(test) {
		currentTest = test;
		currentIndex = 0;
		answers = Array(test.questions.length).fill(null);
		secondsLeft = test.timeLimit;
		picker.hidden = true;
		stage.hidden = false;
		clearInterval(timerId);
		timerId = setInterval(function () {
			secondsLeft -= 1;
			var timer = document.getElementById('iq-timer');
			if (timer) timer.textContent = formatTime(secondsLeft);
			if (secondsLeft <= 0) finishTest();
		}, 1000);
		renderQuestion();
		stage.scrollIntoView({ behavior: 'smooth', block: 'start' });
	}

	function renderQuestion() {
		var question = currentTest.questions[currentIndex];
		var selected = answers[currentIndex];
		stage.innerHTML = '<div class="test-topline"><p class="test-label">' + escapeHtml(currentTest.title) + ' · Câu ' + (currentIndex + 1) + '/' + currentTest.questions.length + '</p><div class="timer" id="iq-timer">' + formatTime(secondsLeft) + '</div></div>' +
			'<div class="progress-track"><div class="progress-bar" style="width:' + (((currentIndex + 1) / currentTest.questions.length) * 100) + '%"></div></div>' +
			'<div class="question-panel"><div class="question-category">' + escapeHtml(categoryNames[question.category] || question.category) + '</div><h2>' + escapeHtml(question.question || question.prompt) + '</h2>' + (question.visual ? visualMarkup(question.visual) : '') + '<div class="options ' + (question.visual ? 'visual-options' : '') + '">' + (question.visual ? question.visual.options : question.options).map(function (option, index) {
				return '<button class="option-button' + (selected === index ? ' selected' : '') + '" data-option="' + index + '">' + (question.visual ? symbolSvg(option, 88) : String.fromCharCode(65 + index) + '. ' + escapeHtml(option)) + '</button>';
			}).join('') + '</div><div class="question-actions"><button class="iq-button secondary-button" id="previous-button"' + (currentIndex === 0 ? ' disabled' : '') + '>Câu trước</button><button class="iq-button" id="next-button">' + (currentIndex === currentTest.questions.length - 1 ? 'Nộp bài' : 'Câu tiếp theo') + '</button></div></div>';
		stage.querySelectorAll('.option-button').forEach(function (button) {
			button.addEventListener('click', function () {
				answers[currentIndex] = Number(button.dataset.option);
				stage.querySelectorAll('.option-button').forEach(function (item) { item.classList.remove('selected'); });
				button.classList.add('selected');
			});
		});
		document.getElementById('previous-button').addEventListener('click', function () { if (currentIndex > 0) { currentIndex -= 1; renderQuestion(); } });
		document.getElementById('next-button').addEventListener('click', function () {
			if (answers[currentIndex] === null) { window.alert('Hãy chọn một đáp án trước khi tiếp tục.'); return; }
			if (currentIndex === currentTest.questions.length - 1) finishTest(); else { currentIndex += 1; renderQuestion(); }
		});
	}

	function finishTest() {
		clearInterval(timerId);
		var score = currentTest.questions.reduce(function (total, question, index) { return total + (answers[index] === question.answer ? 1 : 0); }, 0);
		var percent = Math.round((score / currentTest.questions.length) * 100);
		var message = percent >= 80 ? 'Bạn có khả năng nhận diện quy luật và xử lý thông tin rất tốt.' : percent >= 60 ? 'Bạn có nền tảng tư duy tốt; hãy luyện thêm các nhóm câu còn khó.' : 'Đây là một ảnh chụp nhanh. Bạn có thể thử lại để quan sát cách mình tiến bộ.';
		stage.innerHTML = '<div class="result-panel"><div class="eyebrow">KẾT QUẢ THAM KHẢO</div><h2>' + escapeHtml(currentTest.title) + '</h2><div class="score">' + score + '/' + currentTest.questions.length + '</div><p class="result-copy">' + message + '</p><button class="iq-button" id="retry-button">Làm lại bài này</button> <button class="iq-button secondary-button" id="choose-button">Chọn nhóm khác</button></div>';
		document.getElementById('retry-button').addEventListener('click', function () { startTest(currentTest); });
		document.getElementById('choose-button').addEventListener('click', function () { stage.hidden = true; picker.hidden = false; picker.scrollIntoView({ behavior: 'smooth' }); });
	}

	document.getElementById('visual-tab').addEventListener('click', function () { activeMode = 'visual'; visualPicker.hidden = false; mixedPicker.hidden = true; picker = visualPicker; document.getElementById('visual-tab').classList.add('is-active'); document.getElementById('mixed-tab').classList.remove('is-active'); document.getElementById('visual-tab').setAttribute('aria-selected', 'true'); document.getElementById('mixed-tab').setAttribute('aria-selected', 'false'); });
	document.getElementById('mixed-tab').addEventListener('click', function () { activeMode = 'mixed'; visualPicker.hidden = true; mixedPicker.hidden = false; picker = mixedPicker; document.getElementById('visual-tab').classList.remove('is-active'); document.getElementById('mixed-tab').classList.add('is-active'); document.getElementById('visual-tab').setAttribute('aria-selected', 'false'); document.getElementById('mixed-tab').setAttribute('aria-selected', 'true'); });
	fetch('data/tests.json').then(function (response) { if (!response.ok) throw new Error('Không thể tải dữ liệu bài test.'); return response.json(); }).then(function (data) { activeTests = data.visualTests || []; renderPicker(activeTests, visualPicker, 'visual'); renderPicker(data.tests || [], mixedPicker, 'mixed'); }).catch(function (error) { visualPicker.innerHTML = '<p class="error">' + escapeHtml(error.message) + '</p>'; });
}());
