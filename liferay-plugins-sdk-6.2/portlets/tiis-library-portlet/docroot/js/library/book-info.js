function initBookInfo(_portletNamespace, _updateBookTitleURL, _updateBookDescriptionURL, _updateBookLogoURL, _updateBookCategoriesURL, _deleteBookURL) {

    var $editBookDescriptionBtn = $('#edit-description-btn'),
        $bookDescriptionBlock = $('#bookDescription'),
        descriptionCkEditorInstanceId = _portletNamespace + 'book-description-editor',
        $bookDescriptionEditor = $('#' + descriptionCkEditorInstanceId),
        $bookDescriptionEditorBlock = $('#book-description-edit-block'),
        $updateDescriptionBtn = $('#update-description-btn'),
        $cancelUpdateDescriptionBtn = $('#cancel-update-description-btn'),
        categoriesFormId = _portletNamespace + 'categoriesForm',
        $categoriesForm = $('#' + categoriesFormId),
        $saveCategoriesBtn = $('#save-categories-btn'),
        $bookTitleHeader = $('#book-title-content'),
        $titleEditBtn = $('#edit-title-btn'),
        $logoEditBtn = $('#edit-logo-btn'),
        $deleteBookBtn = $('#delete-book-btn'),
        $logoPlaceholder = $('#logo-placeholder');

    //Delete book
    $deleteBookBtn.on('click', function(e) {
        swal({
            title: Liferay.Language.get('are-you-sure'),
            text: Liferay.Language.get('you-wont-be-able-to-revert-this'),
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: Liferay.Language.get('yes-delete-it')
        }).then(function() {
            var requestData = {};
            AUI().use('aui-io-request', function(A) {
                A.io.request(_deleteBookURL, {
                    data: requestData,
                    dataType: 'json',
                    on: {
                        complete: function(data, textStatus, jqXHR) {
                        	 try {
                        		 var responseText = jqXHR.responseText;
                                 var responseData = JSON.parse(responseText);
                                 if (responseData.status === 'ok') {
                                     swal({
                                         type: 'success',
                                         title: Liferay.Language.get('book-deleted'),
                                     }).then(function(){
                                    	 window.location.href = "/web/guest/books";
                                     });

                                 } else {
                                     swal({
                                         type: 'error',
                                         title: Liferay.Language.get('book-was-not-deleted'),
                                     });
                                 }
                             } catch (e) {}
                        },
                        failure: function() {
                            //TODO animate
                        }
                    }
                });
            });
        })
    });

    //Logo editor
    $logoEditBtn.on('click', function(e) {
        swal({
            title: Liferay.Language.get('please-add-logo-file'),
            input: 'file',
            inputAttributes: {
                accept: "image/jpeg,image/bmp,image/png"
            },
            showCancelButton: true,
            confirmButtonText: Liferay.Language.get('save'),
            showLoaderOnConfirm: true,
            cancelButtonText: Liferay.Language.get('cancel'),
            preConfirm: function(logo) {
                return new Promise(function(resolve, reject) {
                    setTimeout(function() {
                        if (logo == null) {
                            reject(Liferay.Language.get('please-add-logo-file'));
                        } else {
                            resolve();
                        }
                    }, 2000)
                })
            },
            allowOutsideClick: false
        }).then(function(logo) {
            var formData = new FormData();
            formData.append(_portletNamespace + 'bookLogo', logo);

            $.ajax({
                url: _updateBookLogoURL,
                type: "POST",
                data: formData,
                mimeType: "multipart/form-data",
                contentType: false,
                cache: false,
                processData: false,
                success: function(data, textStatus, jqXHR) {
                    try {
                        var responseData = JSON.parse(data);
                        if (responseData.status === 'ok') {
                            $logoPlaceholder.css('background-image', 'url(' + responseData.message + ')');
                            swal({
                                type: 'success',
                                title: Liferay.Language.get('book-logo-changed'),
                            });

                        } else {
                            swal({
                                type: 'error',
                                title: Liferay.Language.get('book-logo-changed'),
                            });
                        }
                    } catch (e) {}
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    //TODO add handler here

                }
            });
        })
    });

    //Title editor
    $titleEditBtn.on('click', function(e) {
        swal({
            title: Liferay.Language.get('please-enter-new-book-title'),
            input: 'text',
            showCancelButton: true,
            confirmButtonText: Liferay.Language.get('save'),
            showLoaderOnConfirm: true,
            cancelButtonText: Liferay.Language.get('cancel'),
            preConfirm: function(title) {
                return new Promise(function(resolve, reject) {
                    setTimeout(function() {
                        if (title === '') {
                            reject(Liferay.Language.get('title-cant-be-empty'));
                        } else {
                            resolve()
                        }
                    }, 2000)
                })
            },
            allowOutsideClick: false
        }).then(function(title) {
            var requestData = {};
            requestData[_portletNamespace + 'bookTitle'] = title;
            AUI().use('aui-io-request', function(A) {
                A.io.request(_updateBookTitleURL, {
                    data: requestData,
                    dataType: 'json',
                    on: {
                        success: function() {
                            $bookTitleHeader.html(title);
                            swal({
                                type: 'success',
                                title: Liferay.Language.get('book-title-changed'),
                                html: Liferay.Language.get('new-title') + ': ' + title
                            })
                        },
                        failure: function() {
                            //TODO animate
                        }
                    }
                });
            });
        })
    });

    //Description editor
    $editBookDescriptionBtn.on('click', function(e) {
        CKEDITOR.instances[descriptionCkEditorInstanceId].setData($bookDescriptionBlock.html());
        $(this).css('display', 'none');
        $bookDescriptionBlock.css('display', 'none');
        $bookDescriptionEditorBlock.css('display', 'block');
    });

    $updateDescriptionBtn.on('click', function(e) {
        var newDescription = CKEDITOR.instances[descriptionCkEditorInstanceId].getData();
        $bookDescriptionBlock.html(newDescription);
        $bookDescriptionEditorBlock.css('display', 'none');
        $editBookDescriptionBtn.css('display', 'block');
        $bookDescriptionBlock.css('display', 'block');
        //TODO add swall
        var requestData = {};
        requestData[_portletNamespace + 'bookDescription'] = newDescription;
        console.log(requestData);

        AUI().use('aui-io-request', function(A) {
            A.io.request(_updateBookDescriptionURL, {
                data: requestData,
                dataType: 'json',
                on: {
                    success: function() {
                        $('.annotation').effect('highlight', { color: 'rgba(92, 184, 92, 0.53' }, 1000);
                    },
                    failure: function() {
                        //TODO animate
                    }
                }
            });
        });
    });

    $cancelUpdateDescriptionBtn.on('click', function(e) {
        CKEDITOR.instances[descriptionCkEditorInstanceId].setData($bookDescriptionBlock.html());
        $bookDescriptionEditorBlock.css('display', 'none');
        $editBookDescriptionBtn.css('display', 'block');
        $bookDescriptionBlock.css('display', 'block');
    });

    $saveCategoriesBtn.on('click', function(e) {
        e.preventDefault();
        AUI().use('aui-io-request', function(A) {
            A.io.request(_updateBookCategoriesURL, {
                form: {
                    id: categoriesFormId
                },
                dataType: 'json',
                method: 'POST',
                on: {
                    complete: function(event, id, xhr) {
                        var response = xhr.response;
                        try {
                            var responseData = JSON.parse(response);
                            var responseMessage = responseData.message;
                            if (responseData.status !== 'ok') {
                                console.log("Request failed. " + responseMessage);
                            } else {
                                $('#' + categoriesFormId + ' .accordion-heading.toggler-header.toggler-header-expanded')
                                    .effect('highlight', { color: 'rgba(92, 184, 92, 0.53' }, 1000);
                            }
                        } catch (ex) {
                            console.log("Failed to parse response data");
                        }
                    },
                    failure: function(event, id, xhr) {
                        console.log('failure');
                        console.log(event);
                        console.log(id);
                        console.log(xhr);
                    }
                }
            });
        });
    });
}
