


getLeftOffset = (galleryName, currentEl) ->
  currentIndex = parseInt currentEl.attr('data-id')
  total = 0
  currentActiveIndex = parseInt $(window.currentEl).attr('data-id')
  collection = $(galleryName).find("li").filter (index) ->
    (index <= currentActiveIndex) && (index >= currentIndex)

  $.each collection, (index, el) -> 
    total += parseInt($(el).attr('data-small-width')) + 20

  total

getRightOffset = (galleryName, currentEl) ->
  currentIndex = parseInt currentEl.attr('data-id')
  total = 0
  currentActiveIndex = parseInt $(window.currentEl).attr('data-id')
  collection = $(galleryName).find("li").filter (index) ->
    (index <= currentActiveIndex) && (index >= currentIndex)

  $.each collection, (index, el) -> 
    total += parseInt($(el).attr('data-small-width')) + 20

  total
$(window).load -> 
  $('#flip').find('img').each (i, el) ->
    $(el).closest('li').attr('data-small-width', $(el).width())
  $('#flip').jcoverflip
    beforeCss: (el, container, offset) ->
      if offset == 0 then window.currentEl = el
      leftOffset = getLeftOffset '#flip', el
      [$.jcoverflip.animationElement(el,
        left: (container.width() / 2 - 330) - leftOffset + "px"
        top: "0"
      , ), $.jcoverflip.animationElement(el.find("img"),
        height: "150px"
      , {})]
    afterCss: (el, container, offset) ->
      console.log "#{offset}: #{$(el).attr('data-id')}"

      leftOffset = getRightOffset '#flip', el
      [$.jcoverflip.animationElement(el,
        right: (container.width() / 2 + 330) - leftOffset + "px"
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
  
$ ->
  $('#big_wrapper').css
    width: $('body').width()
    left: -1 * ($('body').width() / 2 - 330) + 'px'

  
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
