{"filter":false,"title":"routes.rb","tooltip":"/config/routes.rb","undoManager":{"mark":1,"position":1,"stack":[[{"group":"doc","deltas":[{"start":{"row":0,"column":0},"end":{"row":16,"column":0},"action":"remove","lines":["Rails.application.routes.draw do","  get 'sessions/new'","","  get 'users/new'","","  root             'static_pages#home'","  ","  get 'help'    => 'static_pages#help'","  get 'about'   => 'static_pages#about'","  get 'contact' => 'static_pages#contact'","  ","  get 'signup'  => 'users#new'","  ","  ","  ","end",""]},{"start":{"row":0,"column":0},"end":{"row":10,"column":3},"action":"insert","lines":["Rails.application.routes.draw do","  root                'static_pages#home'","  get    'help'    => 'static_pages#help'","  get    'about'   => 'static_pages#about'","  get    'contact' => 'static_pages#contact'","  get    'signup'  => 'users#new'","  get    'login'   => 'sessions#new'","  post   'login'   => 'sessions#create'","  delete 'logout'  => 'sessions#destroy'","  resources :users","end"]}]}],[{"group":"doc","deltas":[{"start":{"row":0,"column":0},"end":{"row":11,"column":0},"action":"remove","lines":["Rails.application.routes.draw do","  root                'static_pages#home'","  get    'help'    => 'static_pages#help'","  get    'about'   => 'static_pages#about'","  get    'contact' => 'static_pages#contact'","  get    'signup'  => 'users#new'","  get    'login'   => 'sessions#new'","  post   'login'   => 'sessions#create'","  delete 'logout'  => 'sessions#destroy'","  resources :users","end",""]},{"start":{"row":0,"column":0},"end":{"row":11,"column":3},"action":"insert","lines":["Rails.application.routes.draw do","  root                'static_pages#home'","  get    'help'    => 'static_pages#help'","  get    'about'   => 'static_pages#about'","  get    'contact' => 'static_pages#contact'","  get    'signup'  => 'users#new'","  get    'login'   => 'sessions#new'","  post   'login'   => 'sessions#create'","  delete 'logout'  => 'sessions#destroy'","  resources :users","  resources :account_activations, only: [:edit]","end"]}]}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":11,"column":3},"end":{"row":11,"column":3},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1425558413942,"hash":"72e8feefe0d00872988e92882d37fdd96cfdb826"}