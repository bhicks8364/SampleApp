{"filter":false,"title":"static_pages_controller_test.rb","tooltip":"/test/controllers/static_pages_controller_test.rb","undoManager":{"mark":1,"position":1,"stack":[[{"group":"doc","deltas":[{"start":{"row":0,"column":0},"end":{"row":14,"column":0},"action":"remove","lines":["require 'test_helper'","","class StaticPagesControllerTest < ActionController::TestCase","  test \"should get home\" do","    get :home","    assert_response :success","  end","","  test \"should get help\" do","    get :help","    assert_response :success","  end","","end",""]},{"start":{"row":0,"column":0},"end":{"row":18,"column":3},"action":"insert","lines":["require 'test_helper'","","class StaticPagesControllerTest < ActionController::TestCase","","  test \"should get home\" do","    get :home","    assert_response :success","  end","","  test \"should get help\" do","    get :help","    assert_response :success","  end","","  test \"should get about\" do","    get :about","    assert_response :success","  end","end"]}]}],[{"group":"doc","deltas":[{"start":{"row":0,"column":0},"end":{"row":18,"column":3},"action":"remove","lines":["require 'test_helper'","","class StaticPagesControllerTest < ActionController::TestCase","","  test \"should get home\" do","    get :home","    assert_response :success","  end","","  test \"should get help\" do","    get :help","    assert_response :success","  end","","  test \"should get about\" do","    get :about","    assert_response :success","  end","end"]},{"start":{"row":0,"column":0},"end":{"row":21,"column":3},"action":"insert","lines":["require 'test_helper'","","class StaticPagesControllerTest < ActionController::TestCase","","  test \"should get home\" do","    get :home","    assert_response :success","    assert_select \"title\", \"Home | Ruby on Rails Tutorial Sample App\"","  end","","  test \"should get help\" do","    get :help","    assert_response :success","    assert_select \"title\", \"Help | Ruby on Rails Tutorial Sample App\"","  end","","  test \"should get about\" do","    get :about","    assert_response :success","    assert_select \"title\", \"About | Ruby on Rails Tutorial Sample App\"","  end","end"]}]}]]},"ace":{"folds":[],"scrolltop":45,"scrollleft":0,"selection":{"start":{"row":21,"column":3},"end":{"row":21,"column":3},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":{"row":2,"state":"start","mode":"ace/mode/ruby"}},"timestamp":1425414440414,"hash":"d7a8a25e786c174953a9d58d84ff53331c23ff1c"}