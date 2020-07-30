sendFile = (file, toSummernote) ->
  data = new FormData
  data.append 'article_image[image]', file
  $.ajax
    data: data
    type: 'POST'
    url: '/admin_page/article_images'
    cache: false
    contentType: false
    processData: false
    success: (data) ->
      img = document.createElement('IMG')
      img.src = data.url
      console.log data
      img.setAttribute('id', "sn-image-#{data.article_image_id}")
      toSummernote.summernote 'insertNode', img
      toSummernote[0].oldValue = $('.note-editable.card-block')[0].innerHTML
      # console.log $('.note-editable.card-block')[0].innerHTML

deleteFile = (file_id) ->
  $.ajax
    type: 'DELETE'
    url: "/admin_page/article_images/#{file_id}"
    cache: false
    contentType: false
    processData: false

Array::diff = (a) ->
  @filter (i) ->
    a.indexOf(i) < 0

$(document).on 'turbolinks:load', ->
  $('[data-provider="summernote"]').each ->
    $(this).summernote
      inheritPlaceholder: true
      addclass: {
                 debug: false,
                 classTags: [{title:"Button",value:"btn btn-success"},"jumbotron", "lead","img-rounded","img-circle", "img-responsive","btn", "btn btn-success","btn btn-danger","text-muted", "text-primary", "text-warning", "text-danger", "text-success", "table-bordered", "table-responsive", "alert", "alert alert-success", "alert alert-info", "alert alert-warning", "alert alert-danger", "visible-sm", "hidden-xs", "hidden-md", "hidden-lg", "hidden-print"]
                }
      toolbar: [
                ['fontsize', ['fontsize']],
                ['custom',['caseConverter']],
                ['color',['color']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['fontstyleextra', ['strikethrough', 'underline', 'hr', 'superscript', 'subscript']],
                ['table', ['table']],
                ['insert', ['link', 'picture', 'video','tableofcontent','nugget']],
                ['style', ['style','bold', 'italic', 'add-text-tags', 'clear', 'addclass']]
               ]
      nugget: {
                list: [ 
                       '[[code nugget 1]]',
                        '[[code nugget 2]]',
                        '[[code nugget 2]]'
                      ]
              }
      popover: {
                 image: [
                         ['custom', ['imageShapes']],
                         ['custom', ['imageTitle']],
                         ['custom', ['captionIt']],
                         ['custom', ['imageAttributes']],
                         ['imagesize', ['imageSize100', 'imageSize50', 'imageSize25']],
                         ['float', ['floatLeft', 'floatRight', 'floatNone']],
                         ['remove', ['removeMedia']]
                        ] 
                }
      lang: 'en-US', 
      imageAttributes:{
                        icon:'<i class="note-icon-pencil"/>',
                        removeEmpty:false, 
                        disableUpload: false 
                      }
      captionIt:{
                 figureClass:'{figure-class/es}',
                 figcaptionClass:'{figcapture-class/es}',
                 captionText:'{Default Caption Editable Placeholder Text if Title or Alt are empty}'
                }
      callbacks:
        onInit: ->
          console.log('Summernote is launched');
          @oldValue = this.value
        onImageUpload: (files, e) ->
          console.log "Files were uploaded: "
          console.log files
          sendFile files[0], $(this)
        onMediaDelete: (target, editor, editable) ->
          console.log target
          console.log "File was deleted : #{target}"
          upload_id = target[0].id.split('-').slice(-1)[0]
          console.log upload_id
          if !!upload_id
            deleteFile upload_id
            @oldValue = $('.note-editable.card-block')[0].innerHTML
          target.remove()
        onKeyup: (e) ->
          if e.keyCode == 8 || e.keyCode == 46
            newValue = e.target.innerHTML
            oldImages = @oldValue.match(/<img\s(?:.+?)>/g)
            oldImages = if oldImages then oldImages else []
            newImages = newValue.match(/<img\s(?:.+?)>/g)
            newImages = if newImages then newImages else []
            # console.log @oldValue
            # console.log newValue
            # console.log oldImages
            # console.log newImages
            @oldValue = newValue
            deletedImages = if newImages then oldImages.diff(newImages) else []
            if deletedImages.length > 0
              # console.log "deleted images :"
              # console.log deletedImages
              for deletedImage in deletedImages
                myRegexp = /\/uploads\/upload\/image\/(.+?)\/(.+?)\"/g
                # console.log deletedImage
                matches = myRegexp.exec deletedImage
                # console.log matches
                if confirm("Are you sure?\nYou can't revert if images have been deleted.")
                  deleteFile matches[1]
                  console.log "* Permanently removed : #{matches[1]}: #{matches[2]}"