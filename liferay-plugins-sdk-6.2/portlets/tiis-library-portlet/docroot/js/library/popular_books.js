function PopularBooks(_portletNamespace, _booksJSON, _containerSelector) {

	var self = this;

	AUI().ready(function () {
		var container = document.querySelector(_containerSelector);

		if (undefined == container) {
			console.error('Cannot find container element. Selector: '
					+ _containerSelector + '\nAborting initialization');
			return;
		}

		var templateData = { books : _booksJSON, userIsContentManager : false};
		container.innerHTML = renderTemplate('tpl_books_grid', templateData);
		renderCourses(_booksJSON);
	});
	
	renderCourses = function(courses) {
		for (var i = 0; i < courses.length; i++) {
			var course = courses[i];
			var courseLogo = $("img[bookId|=" + course.courseId + "]")[0];
			var cropperProps = JSON.parse(course.logoCroppSettings);
			try {
				courseLogo.cropperProps = cropperProps;
				courseLogo.onload = function () {
					cropImage(this, this.cropperProps);
				}
			} catch (e) {
				console.log(e);
			}
		}
	}
}