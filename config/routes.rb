Rails.application.routes.draw do
  
  get "posts/index" => "posts#index" #一覧ページ
  get "posts/new"   => "posts#new"  #新規投降ページ
  get "posts/:id"   => "posts#show" #投稿詳細ページ

  get "posts/:id/edit"  =>  "posts#edit"          #投稿編集機能ページ
  post  "posts/:id/update" => "posts#update"      #投稿編集データ受け取り
  post  "posts/:id/destroy"  =>  "posts#destroy"  #投稿データの削除機能

  post "posts/create" =>  "posts#create"          #入力データ受け取り

  get "login" =>  "users#login_form"  #ログインページ
  post "login"  => "users#login"      #ログインアクション
  post "logout" => "users#logout"     #ログアウトページ

  get "signup" => "users#new"     #ユーザー登録ページ
  get "users/index" => "users#index"  #ユーザー一覧ページ
  get "users/:id" => "users#show"     #ユーザー詳細ページ
  post "users/create" =>"users#create"  #ユーザーデータ保存
  get "users/:id/edit" => "users#edit"  #ユーザーデータ編集機能ページ
  post "users/:id/update" => "users#update"   #ユーザーデータ編集<<反映,保存>>

  post "likes/:post_id/create" => "likes#create"  #いいね機能
  post "likes/:post_id/destroy" => "likes#destroy"  #いいね削除
  get "users/:id/likes" => "users#likes"  #いいね一覧表示

  get "/" => "home#top"
  get "about" => "home#about"   #サービス紹介ページ

end
