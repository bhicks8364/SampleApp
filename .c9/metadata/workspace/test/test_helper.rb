{"filter":false,"title":"test_helper.rb","tooltip":"/test/test_helper.rb","undoManager":{"mark":4,"position":4,"stack":[[{"group":"doc","deltas":[{"start":{"row":8,"column":59},"end":{"row":9,"column":0},"action":"insert","lines":["",""]},{"start":{"row":9,"column":0},"end":{"row":9,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":9,"column":2},"end":{"row":10,"column":0},"action":"insert","lines":["",""]},{"start":{"row":10,"column":0},"end":{"row":10,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":10,"column":2},"end":{"row":11,"column":0},"action":"insert","lines":["",""]},{"start":{"row":11,"column":0},"end":{"row":11,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":4,"column":0},"end":{"row":10,"column":2},"action":"remove","lines":["class ActiveSupport::TestCase","  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.","  fixtures :all","","  # Add more helper methods to be used by all tests here...","  ","  "]},{"start":{"row":4,"column":0},"end":{"row":10,"column":5},"action":"insert","lines":["class ActiveSupport::TestCase","  fixtures :all","","  # Returns true if a test user is logged in.","  def is_logged_in?","    !session[:user_id].nil?","  end"]}]}],[{"group":"doc","deltas":[{"start":{"row":4,"column":0},"end":{"row":13,"column":0},"action":"remove","lines":["class ActiveSupport::TestCase","  fixtures :all","","  # Returns true if a test user is logged in.","  def is_logged_in?","    !session[:user_id].nil?","  end","  ","end",""]},{"start":{"row":4,"column":0},"end":{"row":31,"column":3},"action":"insert","lines":["class ActiveSupport::TestCase","  fixtures :all","","  # Returns true if a test user is logged in.","  def is_logged_in?","    !session[:user_id].nil?","  end","","  # Logs in a test user.","  def log_in_as(user, options = {})","    password    = options[:password]    || 'password'","    remember_me = options[:remember_me] || '1'","    if integration_test?","      post login_path, session: { email:       user.email,","                                  password:    password,","                                  remember_me: remember_me }","    else","      session[:user_id] = user.id","    end","  end","","  private","","    # Returns true inside an integration test.","    def integration_test?","      defined?(post_via_redirect)","    end","end"]}]}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":31,"column":3},"end":{"row":31,"column":3},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":{"row":22,"state":"start","mode":"ace/mode/ruby"}},"timestamp":1425501027540,"hash":"96eb26723a0c68a47bbb87330dc5534da2b8c07c"}