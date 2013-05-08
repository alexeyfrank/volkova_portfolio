$ ->
  
  $('#big_wrapper').css
    width: $('body').width()
    left: (-1) * ($('body').width() / 2 - 330) + 'px'

  $('#flip').jcoverflip
    beforeCss: (el, container, offset) ->
      [$.jcoverflip.animationElement(el,
        left: (container.width() / 2 - 330) + "px"
        top: "0"
      , ), $.jcoverflip.animationElement(el.find("img"),
        height: "150px"
      , {})]
    afterCss: (el, container, offset) ->
      [$.jcoverflip.animationElement(el,
        left: (container.width() / 2 + 330) + "px"
        top: "0"
      , {}), $.jcoverflip.animationElement(el.find("img"),
        height: "150px"
      , {})]
    currentCss: (el, container) ->
      [$.jcoverflip.animationElement(el,
        left: (container.width() / 2 - 330) + "px"
        top: 0
      , {}), $.jcoverflip.animationElement(el.find("img"),
        height: "450px"
      , {})]
    change: (event, ui) ->
      jQuery("#scrollbar").slider "value", ui.to * 25

  jQuery("#scrollbar").slider
    value: 0
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
