Rails.application.routes.draw do

  namespace :public do
    resources :homes
  end

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  root to: "public/homes#top"

  # 顧客側ルーティング
  scope module: :public do
    get 'about' => 'homes#about'
    get 'customers/my_page' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    patch 'customers/information' => 'customers#update'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw'

    resources :items, only: [:index, :show] do
      collection do
        get :search
        get :genre_search
      end
    end

    delete 'cart_items/destroy_all' => 'cart_items#destroy_all', as: "cart_items_destroy_all"
    resources :cart_items, only: [:index, :update, :destroy, :create]

    post 'orders/confirm' => 'orders#confirm'
    get 'orders/thanks' => 'orders#thanks'
    resources :orders, only: [:new, :create, :index, :show]


    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end

  # 管理者側ルーティング
  namespace :admin do
    root to: "homes#top"
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update,]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:update, :show]
    resources :orders_details, only: [:update]
  end
end