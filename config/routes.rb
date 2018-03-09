Rails.application.routes.draw do
  # ログイン前トップページ
  root to: 'toppages#index'
  
  # ログインページ
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  # ユーザー登録（サインアップ）
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create] do
    member do
      # お気に入り中のツイート一覧を表示するページ
      get :favorites
    end
  end
  
  # ランキング機能
  get 'ranking', to: 'ranking#index'
  
  # 投稿機能（ポスト）
  resources :posts, only: [:new, :create, :destroy, :show]
  
  # いいね機能
  resources :favorites, only: [:create, :destroy]
end

