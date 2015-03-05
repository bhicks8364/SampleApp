{"filter":false,"title":"user.rb","tooltip":"/app/models/user.rb","undoManager":{"mark":22,"position":22,"stack":[[{"group":"doc","deltas":[{"start":{"row":45,"column":0},"end":{"row":59,"column":3},"action":"remove","lines":["  # Converts email to all lower-case.","  def downcase_email","    self.email = email.downcase","  end","","  # Creates and assigns the activation token and digest.","  def create_activation_digest","    self.activation_token  = User.new_token","    self.activation_digest = User.digest(activation_token)","  end","","","  ","  ","end"]},{"start":{"row":45,"column":0},"end":{"row":57,"column":3},"action":"insert","lines":["private","","    # Converts email to all lower-case.","    def downcase_email","      self.email = email.downcase","    end","","    # Creates and assigns the activation token and digest.","    def create_activation_digest","      self.activation_token  = User.new_token","      self.activation_digest = User.digest(activation_token)","    end","end"]}]}],[{"group":"doc","deltas":[{"start":{"row":45,"column":0},"end":{"row":45,"column":2},"action":"insert","lines":["  "]},{"start":{"row":46,"column":0},"end":{"row":46,"column":2},"action":"insert","lines":["  "]},{"start":{"row":47,"column":0},"end":{"row":47,"column":2},"action":"insert","lines":["  "]},{"start":{"row":48,"column":0},"end":{"row":48,"column":2},"action":"insert","lines":["  "]},{"start":{"row":49,"column":0},"end":{"row":49,"column":2},"action":"insert","lines":["  "]},{"start":{"row":50,"column":0},"end":{"row":50,"column":2},"action":"insert","lines":["  "]},{"start":{"row":51,"column":0},"end":{"row":51,"column":2},"action":"insert","lines":["  "]},{"start":{"row":52,"column":0},"end":{"row":52,"column":2},"action":"insert","lines":["  "]},{"start":{"row":53,"column":0},"end":{"row":53,"column":2},"action":"insert","lines":["  "]},{"start":{"row":54,"column":0},"end":{"row":54,"column":2},"action":"insert","lines":["  "]},{"start":{"row":55,"column":0},"end":{"row":55,"column":2},"action":"insert","lines":["  "]},{"start":{"row":56,"column":0},"end":{"row":56,"column":2},"action":"insert","lines":["  "]},{"start":{"row":57,"column":0},"end":{"row":57,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":57,"column":5},"end":{"row":58,"column":0},"action":"insert","lines":["",""]},{"start":{"row":58,"column":0},"end":{"row":58,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":58,"column":2},"end":{"row":59,"column":0},"action":"insert","lines":["",""]},{"start":{"row":59,"column":0},"end":{"row":59,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":59,"column":0},"end":{"row":59,"column":2},"action":"remove","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":59,"column":0},"end":{"row":59,"column":1},"action":"insert","lines":["e"]}]}],[{"group":"doc","deltas":[{"start":{"row":59,"column":1},"end":{"row":59,"column":2},"action":"insert","lines":["n"]}]}],[{"group":"doc","deltas":[{"start":{"row":59,"column":2},"end":{"row":59,"column":3},"action":"insert","lines":["d"]}]}],[{"group":"doc","deltas":[{"start":{"row":59,"column":2},"end":{"row":59,"column":3},"action":"remove","lines":["d"]}]}],[{"group":"doc","deltas":[{"start":{"row":59,"column":1},"end":{"row":59,"column":2},"action":"remove","lines":["n"]}]}],[{"group":"doc","deltas":[{"start":{"row":59,"column":0},"end":{"row":59,"column":1},"action":"remove","lines":["e"]}]}],[{"group":"doc","deltas":[{"start":{"row":58,"column":2},"end":{"row":59,"column":0},"action":"remove","lines":["",""]}]}],[{"group":"doc","deltas":[{"start":{"row":57,"column":0},"end":{"row":57,"column":2},"action":"remove","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":44,"column":2},"end":{"row":45,"column":0},"action":"insert","lines":["",""]},{"start":{"row":45,"column":0},"end":{"row":45,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":45,"column":2},"end":{"row":46,"column":0},"action":"insert","lines":["",""]},{"start":{"row":46,"column":0},"end":{"row":46,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":46,"column":2},"end":{"row":47,"column":0},"action":"insert","lines":["",""]},{"start":{"row":47,"column":0},"end":{"row":47,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":45,"column":2},"end":{"row":46,"column":0},"action":"insert","lines":["",""]},{"start":{"row":46,"column":0},"end":{"row":46,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":46,"column":2},"end":{"row":55,"column":5},"action":"insert","lines":["# Activates an account.","  def activate","    update_attribute(:activated,    true)","    update_attribute(:activated_at, Time.zone.now)","  end","","  # Sends activation email.","  def send_activation_email","    UserMailer.account_activation(self).deliver_now","  end"]}]}],[{"group":"doc","deltas":[{"start":{"row":54,"column":50},"end":{"row":54,"column":51},"action":"remove","lines":["w"]}]}],[{"group":"doc","deltas":[{"start":{"row":54,"column":49},"end":{"row":54,"column":50},"action":"remove","lines":["o"]}]}],[{"group":"doc","deltas":[{"start":{"row":54,"column":48},"end":{"row":54,"column":49},"action":"remove","lines":["n"]}]}],[{"group":"doc","deltas":[{"start":{"row":54,"column":47},"end":{"row":54,"column":48},"action":"remove","lines":["_"]}]}],[{"group":"doc","deltas":[{"start":{"row":54,"column":47},"end":{"row":54,"column":48},"action":"insert","lines":["!"]}]}]]},"ace":{"folds":[],"scrolltop":480,"scrollleft":0,"selection":{"start":{"row":54,"column":48},"end":{"row":54,"column":48},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":{"row":32,"state":"start","mode":"ace/mode/ruby"}},"timestamp":1425561345783,"hash":"25707b4415ef4d681209303e65b723d7410acc13"}