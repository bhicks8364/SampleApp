{"filter":false,"title":"sessions_helper.rb","tooltip":"/app/helpers/sessions_helper.rb","undoManager":{"mark":12,"position":12,"stack":[[{"group":"doc","deltas":[{"start":{"row":12,"column":5},"end":{"row":13,"column":0},"action":"insert","lines":["",""]},{"start":{"row":13,"column":0},"end":{"row":13,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":13,"column":2},"end":{"row":14,"column":0},"action":"insert","lines":["",""]},{"start":{"row":14,"column":0},"end":{"row":14,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":14,"column":2},"end":{"row":15,"column":0},"action":"insert","lines":["",""]},{"start":{"row":15,"column":0},"end":{"row":15,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":15,"column":2},"end":{"row":16,"column":0},"action":"insert","lines":["",""]},{"start":{"row":16,"column":0},"end":{"row":16,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":15,"column":2},"end":{"row":18,"column":5},"action":"insert","lines":["# Returns true if the given user is the current user.","  def current_user?(user)","    user == current_user","  end"]}]}],[{"group":"doc","deltas":[{"start":{"row":58,"column":2},"end":{"row":59,"column":0},"action":"insert","lines":["",""]},{"start":{"row":59,"column":0},"end":{"row":59,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":59,"column":2},"end":{"row":60,"column":0},"action":"insert","lines":["",""]},{"start":{"row":60,"column":0},"end":{"row":60,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":60,"column":2},"end":{"row":61,"column":0},"action":"insert","lines":["",""]},{"start":{"row":61,"column":0},"end":{"row":61,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":61,"column":2},"end":{"row":62,"column":0},"action":"insert","lines":["",""]},{"start":{"row":62,"column":0},"end":{"row":62,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":59,"column":2},"end":{"row":68,"column":5},"action":"insert","lines":["# Redirects to stored location (or to the default).","  def redirect_back_or(default)","    redirect_to(session[:forwarding_url] || default)","    session.delete(:forwarding_url)","  end","","  # Stores the URL trying to be accessed.","  def store_location","    session[:forwarding_url] = request.url if request.get?","  end"]}]}],[{"group":"doc","deltas":[{"start":{"row":68,"column":5},"end":{"row":69,"column":0},"action":"insert","lines":["",""]},{"start":{"row":69,"column":0},"end":{"row":69,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":69,"column":2},"end":{"row":70,"column":0},"action":"insert","lines":["",""]},{"start":{"row":70,"column":0},"end":{"row":70,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":70,"column":2},"end":{"row":81,"column":5},"action":"insert","lines":["# Returns the current logged-in user (if any).","  def current_user","    if (user_id = session[:user_id])","      @current_user ||= User.find_by(id: user_id)","    elsif (user_id = cookies.signed[:user_id])","      user = User.find_by(id: user_id)","      if user && user.authenticated?(:remember, cookies[:remember_token])","        log_in user","        @current_user = user","      end","    end","  end"]}]}]]},"ace":{"folds":[],"scrolltop":783.4444618225098,"scrollleft":0,"selection":{"start":{"row":81,"column":5},"end":{"row":81,"column":5},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1425560530487,"hash":"9ef9e29ce54f5a5597f52a68e57aeb2bcb8a8a56"}