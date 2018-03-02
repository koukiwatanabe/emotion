Rails.application.routes.draw do
  # ログイン前トップページ
  root to: 'toppages#index'
  
  # ログインページ
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  # ユーザー登録（サインアップ）
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create]
  
  # 投稿機能（ポスト）
  resources :posts, only: [:create, :destroy]
  
end

