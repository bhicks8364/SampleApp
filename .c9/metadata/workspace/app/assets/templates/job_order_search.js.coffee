{"filter":false,"title":"job_order_search.js.coffee","tooltip":"/app/assets/templates/job_order_search.js.coffee","undoManager":{"mark":0,"position":0,"stack":[[{"group":"doc","deltas":[{"start":{"row":0,"column":0},"end":{"row":9,"column":26},"action":"insert","lines":["jQuery ->","  $('form').on 'click', '.remove_fields', (event) ->","    $(this).closest('.field').remove()","    event.preventDefault()","","  $('form').on 'click', '.add_fields', (event) ->","    time = new Date().getTime()","    regexp = new RegExp($(this).data('id'), 'g')","    $(this).before($(this).data('fields').replace(regexp, time))","    event.preventDefault()"]}]}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":9,"column":26},"end":{"row":9,"column":26},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1430407416419,"hash":"c6bfbe8a024cd0079c289ad494b3e762415c4ecb"}