{"filter":false,"title":"users_helper.rb","tooltip":"/app/helpers/users_helper.rb","undoManager":{"stack":[[{"start":{"row":0,"column":0},"end":{"row":2,"column":0},"action":"remove","lines":["module UsersHelper","end",""]},{"start":{"row":0,"column":0},"end":{"row":8,"column":3},"action":"insert","lines":["module UsersHelper","","  # Returns the Gravatar for the given user.","  def gravatar_for(user)","    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)","    gravatar_url = \"https://secure.gravatar.com/avatar/#{gravatar_id}\"","    image_tag(gravatar_url, alt: user.name, class: \"gravatar\")","  end","end"]}],[{"start":{"row":3,"column":2},"end":{"row":7,"column":5},"action":"remove","lines":["def gravatar_for(user)","    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)","    gravatar_url = \"https://secure.gravatar.com/avatar/#{gravatar_id}\"","    image_tag(gravatar_url, alt: user.name, class: \"gravatar\")","  end"]},{"start":{"row":3,"column":2},"end":{"row":8,"column":3},"action":"insert","lines":["def gravatar_for(user, options = { size: 50 })","  gravatar_id = Digest::MD5::hexdigest(user.email.downcase)","  size = options[:size]","  gravatar_url = \"https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}\"","  image_tag(gravatar_url, alt: user.name, class: \"gravatar\")","end"]}],[{"start":{"row":8,"column":0},"end":{"row":8,"column":2},"action":"insert","lines":["  "]}]],"mark":-1,"position":2},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":9,"column":3},"end":{"row":9,"column":3},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1425556718000,"hash":"a427a9c53c3a7fc7fb7affe578557398b435c1b8"}