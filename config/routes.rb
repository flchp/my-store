Rails.application.routes.draw do
  namespace :admin do
    resources :products
    resources :orders do
      member do
        post :cancel
        post :ship
        post :shipped
        post :return
      end
    end
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :products do
    resources :reviews
    member do
      post :add_to_cart
    end
  end


  resources :feedbacks


  resources :carts do
    collection do
      delete :clean
      post :checkout
      post :pay_with_alipay
      post :pay_with_wechat
    end
  end

  resources :orders do
    collection do
      post :order_create
    end
    member do
      post :pay_with_alipay
      post :pay_with_wechat
      post :apply_to_cancel
    end
  end

  namespace :account do
    resources :orders
  end

  resources :cart_items do
  member do
    post :add_quantity
    post :remove_quantity
  end
end



end
