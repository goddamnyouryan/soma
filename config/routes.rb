Soma::Application.routes.draw do

  resources :videos do
    match 'play' => 'videos#play'
  end
  resources :backgrounds
  match "/admin" => 'videos#admin'
  match "/exit" => 'videos#exit'
  match "/sort" => 'videos#sort'

  root :to => "videos#index"
end
