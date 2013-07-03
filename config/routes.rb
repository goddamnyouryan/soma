Soma::Application.routes.draw do

  resources :videos do
    match 'play', to: 'videos#play'
  end
  resources :backgrounds
  match '/admin', to: 'videos#admin'
  match '/exit', to: 'videos#exit'
  match '/sort', to: 'videos#sort'
  match '/sitemap', to: 'videos#sitemap', defaults: { format: :xml }

  root to: 'videos#index'
end
