{"filter":false,"title":"user_mailer.rb","tooltip":"/app/mailers/user_mailer.rb","undoManager":{"stack":[[{"start":{"row":8,"column":2},"end":{"row":17,"column":5},"action":"remove","lines":["def account_activation(user)","    @user = user","    mail to: user.email, subject: \"Account activation\"","  end","","  def password_reset","    @greeting = \"Hi\"","","    mail to: \"to@example.org\"","  end"]},{"start":{"row":8,"column":2},"end":{"row":16,"column":5},"action":"insert","lines":["def account_activation(user)","    @user = user","    mail to: user.email, subject: \"Account activation\"","  end","","  def password_reset(user)","    @user = user","    mail to: user.email, subject: \"Password reset\"","  end"]}]],"mark":-1,"position":0},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":16,"column":5},"end":{"row":16,"column":5},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1425562010014,"hash":"68b7b319c510d1def71209f0f1de4938f88f9f06"}