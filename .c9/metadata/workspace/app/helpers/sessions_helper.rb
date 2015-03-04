{"filter":false,"title":"sessions_helper.rb","tooltip":"/app/helpers/sessions_helper.rb","undoManager":{"mark":21,"position":21,"stack":[[{"group":"doc","deltas":[{"start":{"row":0,"column":0},"end":{"row":2,"column":0},"action":"remove","lines":["module SessionsHelper","end",""]},{"start":{"row":0,"column":0},"end":{"row":6,"column":3},"action":"insert","lines":["module SessionsHelper","","  # Logs in the given user.","  def log_in(user)","    session[:user_id] = user.id","  end","end"]}]}],[{"group":"doc","deltas":[{"start":{"row":0,"column":0},"end":{"row":6,"column":3},"action":"remove","lines":["module SessionsHelper","","  # Logs in the given user.","  def log_in(user)","    session[:user_id] = user.id","  end","end"]},{"start":{"row":0,"column":0},"end":{"row":11,"column":3},"action":"insert","lines":["module SessionsHelper","","  # Logs in the given user.","  def log_in(user)","    session[:user_id] = user.id","  end","","  # Returns the current logged-in user (if any).","  def current_user","    @current_user ||= User.find_by(id: session[:user_id])","  end","end"]}]}],[{"group":"doc","deltas":[{"start":{"row":0,"column":0},"end":{"row":11,"column":3},"action":"remove","lines":["module SessionsHelper","","  # Logs in the given user.","  def log_in(user)","    session[:user_id] = user.id","  end","","  # Returns the current logged-in user (if any).","  def current_user","    @current_user ||= User.find_by(id: session[:user_id])","  end","end"]},{"start":{"row":0,"column":0},"end":{"row":16,"column":3},"action":"insert","lines":["module SessionsHelper","","  # Logs in the given user.","  def log_in(user)","    session[:user_id] = user.id","  end","","  # Returns the current logged-in user (if any).","  def current_user","    @current_user ||= User.find_by(id: session[:user_id])","  end","","  # Returns true if the user is logged in, false otherwise.","  def logged_in?","    !current_user.nil?","  end","end"]}]}],[{"group":"doc","deltas":[{"start":{"row":15,"column":5},"end":{"row":16,"column":0},"action":"insert","lines":["",""]},{"start":{"row":16,"column":0},"end":{"row":16,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":16,"column":2},"end":{"row":17,"column":0},"action":"insert","lines":["",""]},{"start":{"row":17,"column":0},"end":{"row":17,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":17,"column":2},"end":{"row":18,"column":0},"action":"insert","lines":["",""]},{"start":{"row":18,"column":0},"end":{"row":18,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":17,"column":2},"end":{"row":20,"column":5},"action":"insert","lines":["def log_out","    session.delete(:user_id)","    @current_user = nil","  end"]}]}],[{"group":"doc","deltas":[{"start":{"row":20,"column":5},"end":{"row":21,"column":0},"action":"insert","lines":["",""]},{"start":{"row":21,"column":0},"end":{"row":21,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":21,"column":2},"end":{"row":22,"column":0},"action":"insert","lines":["",""]},{"start":{"row":22,"column":0},"end":{"row":22,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":22,"column":2},"end":{"row":23,"column":0},"action":"insert","lines":["",""]},{"start":{"row":23,"column":0},"end":{"row":23,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":23,"column":2},"end":{"row":24,"column":0},"action":"insert","lines":["",""]},{"start":{"row":24,"column":0},"end":{"row":24,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":22,"column":2},"end":{"row":27,"column":5},"action":"insert","lines":["# Remembers a user in a persistent session.","  def remember(user)","    user.remember","    cookies.permanent.signed[:user_id] = user.id","    cookies.permanent[:remember_token] = user.remember_token","  end"]}]}],[{"group":"doc","deltas":[{"start":{"row":0,"column":0},"end":{"row":31,"column":3},"action":"remove","lines":["module SessionsHelper","","  # Logs in the given user.","  def log_in(user)","    session[:user_id] = user.id","  end","","  # Returns the current logged-in user (if any).","  def current_user","    @current_user ||= User.find_by(id: session[:user_id])","  end","","  # Returns true if the user is logged in, false otherwise.","  def logged_in?","    !current_user.nil?","  end","  ","  def log_out","    session.delete(:user_id)","    @current_user = nil","  end","  ","  # Remembers a user in a persistent session.","  def remember(user)","    user.remember","    cookies.permanent.signed[:user_id] = user.id","    cookies.permanent[:remember_token] = user.remember_token","  end","  ","  ","  ","end"]},{"start":{"row":0,"column":0},"end":{"row":29,"column":3},"action":"insert","lines":["module SessionsHelper","","  # Logs in the given user.","  def log_in(user)","    session[:user_id] = user.id","  end","","  # Remembers a user in a persistent session.","  def remember(user)","    user.remember","    cookies.permanent.signed[:user_id] = user.id","    cookies.permanent[:remember_token] = user.remember_token","  end","","  # Returns the current logged-in user (if any).","  def current_user","    @current_user ||= User.find_by(id: session[:user_id])","  end","","  # Returns true if the user is logged in, false otherwise.","  def logged_in?","    !current_user.nil?","  end","","  # Logs out the current user.","  def log_out","    session.delete(:user_id)","    @current_user = nil","  end","end"]}]}],[{"group":"doc","deltas":[{"start":{"row":0,"column":0},"end":{"row":29,"column":3},"action":"remove","lines":["module SessionsHelper","","  # Logs in the given user.","  def log_in(user)","    session[:user_id] = user.id","  end","","  # Remembers a user in a persistent session.","  def remember(user)","    user.remember","    cookies.permanent.signed[:user_id] = user.id","    cookies.permanent[:remember_token] = user.remember_token","  end","","  # Returns the current logged-in user (if any).","  def current_user","    @current_user ||= User.find_by(id: session[:user_id])","  end","","  # Returns true if the user is logged in, false otherwise.","  def logged_in?","    !current_user.nil?","  end","","  # Logs out the current user.","  def log_out","    session.delete(:user_id)","    @current_user = nil","  end","end"]},{"start":{"row":0,"column":0},"end":{"row":37,"column":3},"action":"insert","lines":["module SessionsHelper","","  # Logs in the given user.","  def log_in(user)","    session[:user_id] = user.id","  end","","  # Remembers a user in a persistent session.","  def remember(user)","    user.remember","    cookies.permanent.signed[:user_id] = user.id","    cookies.permanent[:remember_token] = user.remember_token","  end","","  # Returns the user corresponding to the remember token cookie.","  def current_user","    if (user_id = session[:user_id])","      @current_user ||= User.find_by(id: user_id)","    elsif (user_id = cookies.signed[:user_id])","      user = User.find_by(id: user_id)","      if user && user.authenticated?(cookies[:remember_token])","        log_in user","        @current_user = user","      end","    end","  end","","  # Returns true if the user is logged in, false otherwise.","  def logged_in?","    !current_user.nil?","  end","","  # Logs out the current user.","  def log_out","    session.delete(:user_id)","    @current_user = nil","  end","end"]}]}],[{"group":"doc","deltas":[{"start":{"row":36,"column":5},"end":{"row":37,"column":0},"action":"insert","lines":["",""]},{"start":{"row":37,"column":0},"end":{"row":37,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":37,"column":2},"end":{"row":38,"column":0},"action":"insert","lines":["",""]},{"start":{"row":38,"column":0},"end":{"row":38,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":38,"column":2},"end":{"row":39,"column":0},"action":"insert","lines":["",""]},{"start":{"row":39,"column":0},"end":{"row":39,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":39,"column":2},"end":{"row":40,"column":0},"action":"insert","lines":["",""]},{"start":{"row":40,"column":0},"end":{"row":40,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":40,"column":2},"end":{"row":41,"column":0},"action":"insert","lines":["",""]},{"start":{"row":41,"column":0},"end":{"row":41,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":38,"column":2},"end":{"row":50,"column":5},"action":"insert","lines":[" # Forgets a persistent session.","  def forget(user)","    user.forget","    cookies.delete(:user_id)","    cookies.delete(:remember_token)","  end","","  # Logs out the current user.","  def log_out","    forget(current_user)","    session.delete(:user_id)","    @current_user = nil","  end"]}]}],[{"group":"doc","deltas":[{"start":{"row":15,"column":2},"end":{"row":25,"column":5},"action":"remove","lines":["def current_user","    if (user_id = session[:user_id])","      @current_user ||= User.find_by(id: user_id)","    elsif (user_id = cookies.signed[:user_id])","      user = User.find_by(id: user_id)","      if user && user.authenticated?(cookies[:remember_token])","        log_in user","        @current_user = user","      end","    end","  end"]},{"start":{"row":15,"column":2},"end":{"row":26,"column":5},"action":"insert","lines":["def current_user","    if (user_id = session[:user_id])","      @current_user ||= User.find_by(id: user_id)","    elsif (user_id = cookies.signed[:user_id])","      raise       # The tests still pass, so this branch is currently untested.","      user = User.find_by(id: user_id)","      if user && user.authenticated?(cookies[:remember_token])","        log_in user","        @current_user = user","      end","    end","  end"]}]}],[{"group":"doc","deltas":[{"start":{"row":15,"column":2},"end":{"row":26,"column":5},"action":"remove","lines":["def current_user","    if (user_id = session[:user_id])","      @current_user ||= User.find_by(id: user_id)","    elsif (user_id = cookies.signed[:user_id])","      raise       # The tests still pass, so this branch is currently untested.","      user = User.find_by(id: user_id)","      if user && user.authenticated?(cookies[:remember_token])","        log_in user","        @current_user = user","      end","    end","  end"]},{"start":{"row":15,"column":2},"end":{"row":25,"column":5},"action":"insert","lines":["def current_user","    if (user_id = session[:user_id])","      @current_user ||= User.find_by(id: user_id)","    elsif (user_id = cookies.signed[:user_id])","      user = User.find_by(id: user_id)","      if user && user.authenticated?(cookies[:remember_token])","        log_in user","        @current_user = user","      end","    end","  end"]}]}]]},"ace":{"folds":[],"scrolltop":35,"scrollleft":0,"selection":{"start":{"row":25,"column":5},"end":{"row":25,"column":5},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":{"row":1,"state":"start","mode":"ace/mode/ruby"}},"timestamp":1425501183489,"hash":"070743fd7c1e04b52656b1703ad2542a66f77497"}