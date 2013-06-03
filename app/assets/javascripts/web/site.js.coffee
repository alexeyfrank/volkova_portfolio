$(document).ready ->

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


$ ->
  #scrollpane parts
  #build slider
  #append icon to handle
  #change overflow to hidden now that slider handles the scrolling

  winW = parseInt($('body').width())
  $(".scroll-pane").css
    width: winW + 'px'
    left: Math.round(-1 * (winW - 660) / 2) + 'px'
  $('.scroll-bar-wrap-wrap').css
    width: '660px'
    left: Math.round((winW - 660) / 2) + 'px'

  #size scrollbar and handle proportionally to scroll distance
  sizeScrollbar = ->
    # remainder = scrollContent.width() - scrollPane.width()
    # remainder = scrollContent.width() - 614
    # proportion = remainder / scrollContent.width()
    # handleSize = scrollPane.width() - (proportion * scrollPane.width())
    proportion = winW / scrollContent.width()
    handleSize = 614 - (proportion * 614)
    scrollbar.find(".ui-slider-handle").css
      width: handleSize
      "margin-left": -handleSize / 2

    handleHelper.width("").width scrollbar.width() - handleSize

  #reset slider value based on scroll content position
  resetValue = ->
    remainder = scrollPane.width() - scrollContent.width()
    leftVal = (if scrollContent.css("margin-left") is "auto" then 0 else parseInt(scrollContent.css("margin-left")))
    percentage = Math.round(leftVal / remainder * 100)
    scrollbar.slider "value", percentage

  #if the slider is 100% and window gets larger, reveal content
  reflowContent = ->
    showing = scrollContent.width() + parseInt(scrollContent.css("margin-left"), 10)
    gap = scrollPane.width() - showing
    scrollContent.css "margin-left", parseInt(scrollContent.css("margin-left"), 10) + gap  if gap > 0
  scrollPane = $(".scroll-pane")
  scrollContent = $(".scroll-content")
  scrollbar = $(".scroll-bar").slider(slide: (event, ui) ->
    if scrollContent.width() > scrollPane.width()
      scrollContent.css "margin-left", Math.round(ui.value / 100 * (scrollPane.width() - scrollContent.width())) + "px"
    else
      scrollContent.css "margin-left", 0
  )
  handleHelper = scrollbar.find(".ui-slider-handle").mousedown(->
    scrollbar.width handleHelper.width()
  ).mouseup(->
    scrollbar.width "100%"
  ).append("<span class='ui-icon ui-icon-grip-dotted-vertical'></span>").wrap("<div class='ui-handle-helper-parent'></div>").parent()
  scrollPane.css "overflow", "hidden"

  #change handle position on window resize
  $(window).resize ->
    resetValue()
    sizeScrollbar()
    reflowContent()


  #init scrollbar size
  setTimeout sizeScrollbar, 10 #safari wants a timeout

  window.onload = ->
    totalWidth = 0
    $('.scroll-content-item').each ->
      totalWidth += $(this).width() + 10
    $('.scroll-content').css
      width: totalWidth + 'px'
    resetValue()
    sizeScrollbar()
    reflowContent()
