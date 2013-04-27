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
