/**
 * Books list UI interaction initialization function.
 * @param _namespace portlet namespace
 * @param _booksNode DOM element, placeholder for rendering the list
 * @param _booksJSON array with book models' data in JSON format
 * @param _defaultCategoryId initial category ID to filter the list by
 * @param _userCanCreateBooks for permission checking
 * @param _userIsContentManager for checking, if user can recommend books from catalog
 * @param _recommendBookURL - url for making books recommended
 * @param _unrecommendBookURL - url for removing "recommended" tag from book
 */
function BooksList(_namespace, _booksNode, _booksJSON, _userIsContentManager, _defaultCategoryId) {
	if (undefined == _userIsContentManager) {
		_userIsContentManager = false;
	}
	if (undefined == _booksNode) {
		console.error('Illegal argument _booksNode:' + _booksNode + ' Aborting initialization.');
	}

	var List = {};
	List.booksNode = _booksNode;
	List.allBooks = _booksJSON;
	List.currentBooks = _booksJSON;
	List.recommendedBooks = getRecommendedBooks();

	var RenderParams = getRenderParams();

	var UI = {};
	UI.viewBy = null;
	UI.sortBy = null;
	UI.categoriesLinks = null;
	UI.filtersLinks = null;
	UI.searchInput = null;
	UI.displayStyleInputs = [];

	var bookFiltersResult = document.getElementById(_namespace + 'bookFiltersResult');

	AUI().ready(function () {
		$(document).scroll(scrollMore);
		
		//
		// Initialization of UI controls
		//

		try {
			UI.displayStyleInputs = document.querySelectorAll('#' + _namespace + 'display-style-control'
					+ ' input[type="radio"]');
			for (var i = 0; i < UI.displayStyleInputs.length; i++) {
				UI.displayStyleInputs[i].onclick = function () {
					var style = this.value;
					if (RenderParams.displayStyle !== style && ('grid' === style || 'list' === style)) {
						RenderParams.displayStyle = style;
						storeRenderParams(RenderParams);
						
						renderBooks(List.currentBooks);
					}
				}
				if (UI.displayStyleInputs[i].value === RenderParams.displayStyle) {
					UI.displayStyleInputs[i].checked = true;
				}
			}
		} catch (e) {
			console.error(e);
		}

		try {
			UI.viewBy = document.getElementById(_namespace + 'viewBy');
			if (RenderParams.viewBy == null) {
				RenderParams.viewBy = 18;
				storeRenderParams(RenderParams);
			}
			
			if (RenderParams.count == null || isNaN(RenderParams.count)) {
				RenderParams.count = RenderParams.viewBy;
				storeRenderParams(RenderParams);
			}

			UI.viewBy.onchange = function (event) {
				RenderParams.count = parseInt(UI.viewBy.value);
				if (RenderParams.count > List.allBooks.length) {
					RenderParams.count = List.allBooks.length;
				}
				storeRenderParams(RenderParams);
				
				renderBooks(List.allBooks);
			}
			
			var options = UI.viewBy.querySelectorAll('option');
			for (var i = 0; i < options.length; i++) {
				var option = options[i];
				
				if (option.value == RenderParams.viewBy) {
					option.selected = true;
				} else {
					option.selected = false;
				}
				
			}
		} catch (e) {
			console.error(e);
		}

		try {
			UI.sortBy = document.getElementById(_namespace + 'sortBy');

			UI.sortBy.onchange = function () {
				RenderParams.comparator = this.value;
				storeRenderParams(RenderParams);
				renderBooks(List.currentBooks);
			};

			UI.sortBy.querySelector('option[value="' + RenderParams.comparator + '"]').selected = true;
			
		} catch (e) {
			console.error(e);
		}

		try {
			UI.categoriesLinks = document.getElementsByClassName('category-link');
			for (i in UI.categoriesLinks) {
				UI.categoriesLinks[i].onclick = function () {

					var thisCategory = this.dataset['catId'];

					var catIndex = RenderParams.currentCategories.indexOf(thisCategory);
					if (-1 == catIndex) {
						RenderParams.currentCategories.push(thisCategory);
						addClass(this, 'active');
					} else {
						RenderParams.currentCategories.splice(catIndex, 1);
						removeClass(this, 'active');
					}
					
					storeRenderParams(RenderParams);
					renderBooks(List.allBooks);

					return false; //to prevent href
				};
			}
			
			for (var i = 0; i < RenderParams.currentCategories.length; i++) {
				var categoryId = RenderParams.currentCategories[i];
				document.querySelector('.category-link[data-cat-id="' + categoryId + '"]')
						.classList.add('active');
			}
			
		} catch (e) {
			console.error(e);
		}

		// wtf?
		try {
			UI.filtersLinks = document.getElementsByClassName('filter-link');
			for (i in UI.filtersLinks) {
				UI.filtersLinks[i].onclick = function () {
					var catId = parseInt(this.dataset['catId']);
					var vocabId = parseInt(this.dataset['vocabId']);
					var vocab = RenderParams.currentFilters[vocabId];
					if (typeof vocab == 'undefined') {
						vocab = [];
					}
					var catIndex = vocab.indexOf(catId);

					if (catIndex == -1 && this.checked == true){
						vocab.push(catId);
					} else if (catIndex != -1 && this.checked == false) {
						vocab.splice(catIndex, 1);
					}
					RenderParams.currentFilters[vocabId] = vocab;
					storeRenderParams(RenderParams);
					renderBooks(List.allBooks);
				}
				if (UI.filtersLinks[i].type == "checkbox") {
					RenderParams.filtersCount++;
				}
			}
			for ( var vocabularyId in RenderParams.currentFilters) {
				var selectedFilters = RenderParams.currentFilters[vocabularyId];
				for (var index = 0; index < selectedFilters.length; index++) {
					var categoryId = selectedFilters[index];
					document.querySelector('.filter-link[data-vocab-id="' + vocabularyId + '"]'
							+ '[data-cat-id="' + categoryId + '"]').checked = true;
				}
			}
			
			
			storeRenderParams(RenderParams);
		} catch (e) {
			console.error(e);
		}

		try {
			UI.searchInput = document.getElementById(_namespace + 'searchInput');
			UI.searchInput.value = RenderParams.searchString;
			if (RenderParams.searchString == null) {
				RenderParams.searchString == '';
			}
			storeRenderParams(RenderParams);

			UI.searchInput.onkeyup = function() {
				RenderParams.searchString = Liferay.Util.escapeHTML(UI.searchInput.value);
				if (RenderParams.searchString == null) {
					RenderParams.searchString == '';
				}
				storeRenderParams(RenderParams);
				renderBooks(List.allBooks);
			};
		} catch (e) {
			console.error('Text search filtering failed.' + e);
		}

		try {
			UI.filterResetLink = document.getElementById(_namespace + 'clearFilters');
			if (undefined != UI.filterResetLink) {
				UI.filterResetLink.onclick = function() {

					RenderParams.currentFilters = {};
					for (var i = 0; i < UI.filtersLinks.length; i++) {
						UI.filtersLinks[i].checked = false
					}

					RenderParams.currentCategories = [];
					for (var i = 0; i < UI.categoriesLinks.length; i++) {
						removeClass(UI.categoriesLinks[i], 'active');
					}

					RenderParams.searchString = '';
					UI.searchInput.value = '';
					
					storeRenderParams(RenderParams);
					
					renderBooks(List.allBooks);
				};
			}
		} catch (e) {
			console.error('Filter reset failed.' + e);
		}
		
		renderBooks(List.allBooks);

	});

	function getRenderParams() {
		if (sessionStorage.bookListRenderParameters === undefined) {
			storeDefaultRenderParams();
		}

		return JSON.parse(sessionStorage.bookListRenderParameters)
	}
	
	function storeRenderParams(renderParams) {
		sessionStorage.bookListRenderParameters = JSON.stringify(renderParams)
	}
	
	function storeDefaultRenderParams() {
		var renderParams = {};
		renderParams.currentFilters = {}; //categoryIds of current filters
		renderParams.currentCategories = (0 == _defaultCategoryId) ? [] : [_defaultCategoryId];
		renderParams.filtersCount = 0;
		renderParams.filteredBooksSize = _booksJSON.length;
		renderParams.count;
		renderParams.comparator = 'by-date-desc';
		renderParams.searchString = '';
		renderParams.displayStyle = 'grid';
		
		storeRenderParams(renderParams);
	}
	
	/*
	 * Rendering books list
	 */

	renderBooks = function renderBooks(books) {

		//
		// Filter books; order is important

		var filteredBooks = [];
		filteredBooks = filterByFilters(books, RenderParams.currentFilters);

		renderCategoriesCounts(filteredBooks);

		filteredBooks = filterByCategory(filteredBooks, RenderParams.currentCategories);
		filteredBooks = search(filteredBooks, RenderParams.searchString);

		//
		// Sort and cut the filtered list

		filteredBooks = qsort(filteredBooks, getComparator(RenderParams.comparator));

		filteredBooksSize = filteredBooks.length;
		filteredBooks = filteredBooks.slice(0, RenderParams.count);

		//
		// Render books grid/list

		var dataObject = {books: filteredBooks, userIsContentManager : _userIsContentManager};

		var template = 'tpl_books_grid';
		List.booksNode.innerHTML = renderTemplate(template, dataObject);
		//
		// Render supplementary elements
		if (undefined != bookFiltersResult) {
			bookFiltersResult.innerHTML = filteredBooksSize;
		}

		//
		// Resize rendered books' logo images

		/*for (var i = 0; i < filteredBooks.length; i++) {
			var book = filteredBooks[i];

			var bookLogo = document.querySelector('img[bookId="' + book.bookId + '"]');
			var cropperProps;
			book.logoCroppSettings
			if (book.logoCroppSettings !== undefined
					&& book.logoCroppSettings !== null
					&& book.logoCroppSettings !== '') {
				cropperProps = JSON.parse(book.logoCroppSettings);
			} else {
				cropperProps = {};
			}
			bookLogo.cropperProps = cropperProps;
			bookLogo.onload = function () {
				//crop image
			}

		}*/

	}
	
	/*
	 * Event handlers for book recommendations
	 */
	
	function recommendBook(bookId) {
		if(_recommendBookURL === "") {
			console.warn("Recommend book url is not defined.")
			return;
		}
		
		var $button = $('a[bookId=' + bookId + ']');
		
		var requestData = {};
		requestData[_namespace + 'bookId'] = bookId;
		
		AUI().use('aui-io-request', function(A) {
			A.io.request(_recommendBookURL, {
				data: requestData,
				dataType : 'json',
				on : {
					success : function(responseData) {
						//redraw recommendation button

						var response = this.get('responseData');
						if (response.status === "ok") {
							var currentBook = findBook(bookId);
							if (currentBook != undefined) {
								currentBook.isRecommended = true;
							}
							enableUnrecommendBtn($button);
						}
					},
					failure : function() {
						console.error("Failed");
						window.location.reload(true);
					}
				}
			});
		});
	}
	
	function unrecommendBook(bookId) {
		if(_unrecommendBookURL === "") {
			console.warn("Recommend book url is not defined.")
			return;
		}
		var $button = $('a[bookId='+ bookId + ']');
		
		var requestData = {};
		requestData[_namespace + 'bookId'] = bookId;
		
		AUI().use('aui-io-request', function(A) {
			A.io.request(_unrecommendBookURL, {
				data: requestData,
				dataType : 'json',
				on : {
					success : function(responseData) {
						var response = this.get('responseData');
						if (response.status === "ok") {
							var currentBook = findBook(bookId);
							if (currentBook != undefined) {
								currentBook.isRecommended = false;
							}
							
							enableRecommendBtn($button);
						}
					},
					failure : function() {
						console.error("Failed");
						window.location.reload(true);
					}
				}
			});
		});
	}
	
	function enableUnrecommendBtn( $buttonObject) {
		$buttonObject.removeClass('btn-green');
		$buttonObject.removeClass('recommend-btn');
		$buttonObject.addClass('btn-red');
		$buttonObject.addClass('unrecommend-btn');
		$buttonObject.text(Liferay.Language.get('unrecommend-book'));
		$buttonObject.off('click');
		$buttonObject.on('click', function(e) {
			e.preventDefault();
			$buttonObject.hide('fast').delay(500);
			unrecommendBook($(this).attr('bookId'));
		});
		$buttonObject.fadeIn(900);
	}
	
	function enableRecommendBtn( $buttonObject) {
		$buttonObject.removeClass('btn-red');
		$buttonObject.removeClass('unrecommend-btn');
		$buttonObject.addClass('btn-green');
		$buttonObject.addClass('recommend-btn');
		$buttonObject.text(Liferay.Language.get('recommend-book'));
		$buttonObject.off('click');
		$buttonObject.on('click', function(e) {
			e.preventDefault();
			$buttonObject.hide('fast').delay(500);
			recommendBook($(this).attr('bookId'));
		});
		$buttonObject.fadeIn(900);
	}
	
	// will return undefined if not found; or JSON object of book
	function findBook(bookId) {
		var allBooks = _booksJSON;
		for (var counter = 0; counter < allBooks.length; counter++) {
			if (allBooks[counter]["bookId"] == bookId) {
				return allBooks[counter];
			}
		}
	}
	
	function getRecommendedBooks() {
		var allBooks = _booksJSON;
		var recommendedBooks = [];
		for (var counter = 0; counter < allBooks.length; counter++) {
			if (allBooks[counter]["isRecommended"] == true) {
				recommendedBooks.push(allBooks[counter]);
			}
		}
		return recommendedBooks;
	}

	/*
	 * Sorting
	 */

	function qsort(a, comparator) {
	    if (a.length == 0) {
			return [];
		}
	    var left = [], right = [], pivot = a[0];
	    for (var i = 1; i < a.length; i++) {
	        comparator(a[i], pivot) ? left.push(a[i]) : right.push(a[i]);
	    }
	    return qsort(left, comparator).concat(pivot, qsort(right, comparator));
	}

	function byNameAsc(bookA, bookB) {
		return bookA.title.toLowerCase() <= bookB.title.toLowerCase();
	}
	function byNameDesc(bookA, bookB) {
		return bookA.title.toLowerCase() > bookB.title.toLowerCase();
	}
	function byDateAsc(bookA, bookB) {
		return bookA.date <= bookB.date;
	}
	function byDateDesc(bookA, bookB) {
		return bookA.date > bookB.date;
	}
	function byStudentCountAsc(bookA, bookB) {
		return bookA.studentCount <= bookB.studentCount;
	}
	function byStudentCountDesc(bookA, bookB) {
		return bookA.studentCount > bookB.studentCount;
	}
	function byLessonCountAsc(bookA, bookB) {
		return bookA.lessonCount <= bookB.lessonCount;
	}
	function byLessonCountDesc(bookA, bookB) {
		return bookA.lessonCount > bookB.lessonCount;
	}
	function byPriceAsc(bookA, bookB) {
		return bookA.registrationPrice <= bookB.registrationPrice;
	}
	function byPriceDesc(bookA, bookB) {
		return bookA.registrationPrice > bookB.registrationPrice;
	}

	var comparatorsMap = {
		'by-date-asc' : byDateAsc,
		'by-date-desc' : byDateDesc,
		'by-name-asc' : byNameAsc,
		'by-name-desc' : byNameDesc,
		'by-lesson-count-asc' : byLessonCountAsc,
		'by-lesson-count-desc' : byLessonCountDesc,
		'by-student-count-asc' : byStudentCountAsc,
		'by-student-count-desc' : byStudentCountDesc,
		'by-price-asc' : byPriceAsc,
		'by-price-desc' : byPriceDesc,
	};
	
	
	function getComparator(name) {
		return (comparatorsMap[name] === undefined) ? byDateDesc : comparatorsMap[name];
	}

	/*
	 * Filtering
	 */

	search = function search(_books, _searchQuery) {
		var books = _books.slice();
		_searchQuery = _searchQuery.toLowerCase();
		var searchArray = _searchQuery.split(' ');

		for (var k = books.length - 1; k >= 0; k--) {

			var bookData = books[k].title + ' ' + books[k].description
					+ ' ' + books[k].authorFullName;
			bookData = bookData.toLowerCase();

			var matches = true;
			for (var i = 0; i < searchArray.length; i++) {

				var searchWord = searchArray[i];
				if ('' === searchWord) continue;

				var matchIndex = bookData.indexOf(searchWord);
				if (-1 != matchIndex) {

					// If search query contains X duplicate space-delimited substrings,
					// X matches must be made in the book's fields.
					bookData = bookData.slice(0, matchIndex) + ''
							+ bookData.slice(matchIndex + searchWord.length, bookData.length);
				} else {
					matches = false;
					break;
				}
			}
			if (!matches) {
				books.splice(k, 1);
			}
		}
		return books;
	}

	filterByCategory = function filterByCategory(books, categoryIds) {

		if (!Array.isArray(categoryIds) || 0 == categoryIds.length) {
			return books;
		}

		var categoryMap = {};
		for (i = 0, j = categoryIds.length; i < j; i++) {
			categoryId = categoryIds[i];
	        categoryMap[categoryId] = true; //value for checking in other arrays
	    }

		var filteredBooks = [];
		for (var i = 0; i < books.length; i++) {

			var found = false;
			var bookCategories = books[i].categories;
			
			for (j = 0; j < bookCategories.length; j++) {
		        var bookCategory = bookCategories[j];

		        found = !!categoryMap[bookCategory]; // !! to convert undefined->true->false
				if (found) { // disjunction
					filteredBooks.push(books[i]);
					break;
				}
		    }
		}
		return filteredBooks;
	}

	filterByFilters = function filterByFilters(books, filters) {
		// no filtering if all are unchecked
		var checkedCount = 0;
		for (i in filters) {
			checkedCount = checkedCount + filters[i].length;
		}
		if (checkedCount == 0 || checkedCount == RenderParams.filtersCount) {
			return books;
		}

		var filteredBooks = [];
		//for each book object
		for (var i = 0; i < books.length; i++) {
			var bookMatch = true;
			//for each vocabulary
			vocabulariesLoop:
			for (k in filters) {
				var vocab = filters[k];

				//if none of categories in a vocab are checked, no filtering by it
				if (0 == filters[k].length) {
					continue vocabulariesLoop;
				}
				//for each category in a vocabulary
				var vocabMatch = false;
				vocabCategoriesLoop:
				for (j in vocab) {
					if (-1 != (books[i].categories).indexOf(vocab[j])) {
						vocabMatch = true;
						break vocabCategoriesLoop;
					}
				}
				if (!vocabMatch) {
					bookMatch = false;
					break vocabulariesLoop;
				}
			}
			if (bookMatch) {
				filteredBooks.push(books[i]);
			}
		}
		return filteredBooks;
	}

	function renderCategoriesCounts(books) {

		for (var i = 0; i < UI.categoriesLinks.length; i++) {

			var category = UI.categoriesLinks[i];
			var categoryId = parseInt(category.getAttribute('data-cat-id'), 10);
			var counterNode = category.querySelector('[data-cat-count]');

			if (undefined != counterNode) {
				var booksCount = 0;
				for (var j = 0; j < books.length; j++) {
					var catIndex = books[j].categories.indexOf(categoryId);
					if (-1 != catIndex) {
						booksCount++;
					}
				}

				counterNode.innerHTML = '(' + booksCount + ')';
			}

		}
	}

	function addClass(element, className){
		var re = new RegExp("(^|\\s)" + className + "(\\s|$)", "g");
		if (re.test(element.className)) {
			return;
		}
		element.className = (element.className + " " + className).replace(/\s+/g, " ").replace(/(^ | $)/g, "");
	}

	function removeClass(element, className){
		var re = new RegExp("(^|\\s)" + className + "(\\s|$)", "g");
		element.className = element.className.replace(re, "$1").replace(/\s+/g, " ").replace(/(^ | $)/g, "");
	}
	
	function showMore() {
		RenderParams.count += parseInt(UI.viewBy.value);
		renderBooks(List.allBooks);
		storeRenderParams(RenderParams);
	}
	
	function scrollMore() {
	    if($(window).scrollTop() == $(document).height() - $(window).height()) {
	           showMore();
	    }
	}
}