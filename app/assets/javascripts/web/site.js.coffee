customTitleCreate = (itemElem) ->
  title = itemElem.find(".my-custom-title-class-name").eq(0)
  cloned = title.clone()
  cloned.data "origin_title", title
  title.hide()
  cloned

customTitleDestroy = (titleElem) ->
  titleElem.data("origin_title").show() # show the original title
  titleElem.remove() # delete the title element 


$(document).ready ->
  
  $('#big_wrapper').css
    width: $('body').width()
    left: (-1) * ($('body').width() / 2 - 330) + 'px'

  $('#flip_projects').jcoverflip
    titles:
      create: customTitleCreate
      destroy: customTitleDestroy
      change: (event, ui) ->
        jQuery("#scrollbar").slider "value", ui.to * 25

  jQuery("#scrollbar").slider
    value: 50
    stop: (event, ui) ->
      if event.originalEvent
        newVal = Math.round(ui.value / 25)
        jQuery("#flip").jcoverflip "current", newVal
        jQuery("#scrollbar").slider "value", newVal * 25

  StartGallery = (name) ->
    el = "." + name
    $(el + " .gallery-inner").carouFredSel
      height: "auto"
      items:
        height: "variable"
      scroll:
        duration: 1000
      prev:
        button: el + " .arrow.prev"
        key: "left"
      next:
        button: el + " .arrow.next"
        key: "right"
      pagination:
        container: el + " ul.gallery-paginator"
        keys: true
        anchorBuilder: (nr) ->
          "<li>" + nr + "</li>"

  StartGallery('project-gallery')
