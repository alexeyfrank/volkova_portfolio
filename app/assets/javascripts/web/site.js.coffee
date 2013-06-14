$(document).ready ->

  maxTitle = 0
  $('.project-gallery .title').each ->
    if parseInt($(this).height()) > maxTitle
      maxTitle = parseInt($(this).height())
  $('.project-gallery .title').each ->
    $(this).css
      height: maxTitle + 'px'

  StartGallery = (name) ->
    el = "." + name
    $(el + " .gallery-inner").carouFredSel
      height: "auto"
      infinite: false
      circular: false
      items:
        height: "variable"
      scroll:
        duration: 1000
      auto:
        play: false
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
    left: Math.round(-1 * (winW - 620) / 2) + 'px'
  $('.scroll-bar-wrap-wrap').css
    width: '620px'
    left: Math.round((winW - 620) / 2) + 20 + 'px'

  $('.scroll-content-item.fake').css
    width: Math.round((winW - 620) / 2) + 20 + 'px'
    height: '450px'

  sliderOpts = slide: (event, ui) ->
    if scrollContent.width() > scrollPane.width()
      scrollContent.css "margin-left", Math.round(ui.value / 100 * (scrollPane.width() - scrollContent.width())) + "px"
    else
      scrollContent.css "margin-left", 0

  #size scrollbar and handle proportionally to scroll distance
  sizeScrollbar = ->
    # remainder = scrollContent.width() - scrollPane.width()
    # remainder = scrollContent.width() - 574
    # proportion = remainder / scrollContent.width()
    # handleSize = scrollPane.width() - (proportion * scrollPane.width())
    proportion = winW / scrollContent.width()
    handleSize = 574 - (proportion * 574)
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
  if (parseInt(scrollContent.width()) < winW)
    scrollContent.css
      width: winW + 'px'
  if ($("#project-gallery").size() > 0)
    scrollbar = $("#project-gallery .scroll-bar").slider(sliderOpts)
  else
    scrollbar = $("#bio-gallery .scroll-bar").slider(sliderOpts)
  handleHelper = scrollbar.find(".ui-slider-handle").mousedown(->
    scrollbar.width handleHelper.width()
  ).mouseup(->
    scrollbar.width "100%"
  ).append("<span class='ui-icon ui-icon-grip-dotted-vertical'></span>").wrap("<div class='ui-handle-helper-parent'></div>").parent()
  scrollPane.css "overflow", "hidden"

  takeWidth = ->
    totalWidth = 0
    $('.scroll-content-item').each ->
      totalWidth += $(this).width() + 10
    $('.scroll-content').css
      width: totalWidth + 'px'

  #change handle position on window resize
  $(window).resize ->
    resetValue()
    sizeScrollbar()
    reflowContent()

  $('#gallery-left-arrow, #gallery-right-arrow').click ->
    current = $("#project-gallery .scroll-bar").slider('value')
    to = (if $(this).is("#gallery-left-arrow") then current - 10 else current + 10)
    if (to <= 100) and (to >= 0)
      $("#project-gallery .scroll-bar").slider 'value', to
      sliderOpts.slide null,
        value: to

    takeWidth()
    resetValue()
    sizeScrollbar()
    reflowContent()

  $("#project-gallery .scroll-content-item img").click ->

    $("#project-gallery .scroll-content-item img").attr
        height: 150
    $("#project-gallery .scroll-content-item .summary").hide()

    if ($(this)).hasClass('big')
      $(this).attr
        height: 150
      .removeClass('big')
      $(this).parents('.scroll-content-item').find('.summary').hide()
    else
      $("#project-gallery .scroll-content-item img").removeClass('big')
      $(this).attr
        height: 450
      .addClass('big')
      imgIndex = $("#project-gallery .scroll-content-item").index($(this).parents(".scroll-content-item"))
      slidesNum = $("#project-gallery .scroll-content-item").size()
      if (imgIndex == slidesNum - 2)
        selfWidth = parseInt($(this).width())
        console.log(selfWidth)
        $('.scroll-content-item.fake:last').css
          width: winW - ((Math.round((winW - 620) / 2) + 20) + selfWidth) + 'px'
      else
        $('.scroll-content-item.fake:last').css
          width: Math.round((winW - 620) / 2) + 20 + 'px'

      $(this).parents('.scroll-content-item').find('.summary').show()

      current = $("#project-gallery .scroll-bar").slider('value')
      current_index = $('.scroll-content-item').index($(this).parent('.scroll-content-item'))

      takeWidth()
      resetValue()
      sizeScrollbar()
      reflowContent()

      i = 0
      totalW = 0
      $('.scroll-content-item').each ->
        if (i < current_index)
          totalW += parseInt($(this).width()) + 10
        i++
      to = (totalW / $('.scroll-content').width()) * 100
      if (to <= 100) and (to >= 0)
        $("#project-gallery .scroll-bar").slider 'value', to
        sliderOpts.slide null,
          value: to
      $('.scroll-content').css
        marginLeft: -1 * totalW + Math.round((winW - 620) / 2) + 'px'

    takeWidth()
    resetValue()
    sizeScrollbar()
    reflowContent()

  $('#bio-left-arrow, #bio-right-arrow').click ->
    current = $("#bio-gallery .scroll-bar").slider('value')
    to = (if $(this).is("#bio-left-arrow") then current - 10 else current + 10)
    if (to <= 100) and (to >= 0)
      $("#bio-gallery .scroll-bar").slider 'value', to
      sliderOpts.slide null,
        value: to

    takeWidth()
    resetValue()
    sizeScrollbar()
    reflowContent()

  window.onload = ->
    takeWidth()
    resetValue()
    sizeScrollbar()
    reflowContent()
    $("#project-gallery .scroll-content-item:eq(1) img").attr
      height: 450
    $("#project-gallery .scroll-content-item:eq(1) img").addClass('big')
    $("#project-gallery .scroll-content-item:eq(1)").find('.summary').show()

  #init scrollbar size
  setTimeout sizeScrollbar, 10 #safari wants a timeout
