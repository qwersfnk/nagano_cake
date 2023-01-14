Rails.application.routes.draw do
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
   registrations: "public/registrations",
   sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
   sessions: "admin/sessions"

  }


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   # 会員側のルーティング設定

   scope module: :public do
    get '/customers/mypage', to:'customers#show'
    get '/customers/infomation/edit', to:'customers#edit'
    patch '/customers/infomation', to:'customers#update'
    get '/customers/withdrawal', to:'customers#withdrawal'
    patch '/customers', to:'customers#withdraw'
    root to: 'homes#top'
    resources :items
    delete '/cart_items/destroy_all', to:'cart_items#destroy_all'
    resources :cart_items
    get '/orders/complete', to:'orders#complete'
    post '/orders/confirm', to:'orders#confirm'
    resources :orders
    resources :addresses
    # 管理者側のルーティング設定
  end
   namespace :admin do
    root 'homes#top'
    resources :homes
    resources :items
    resources :genres
    resources :customers
    resources :orders
    resources :order_details, only: [:update]
  end
  get '/about', to: 'public/homes#about', as: 'about'
end