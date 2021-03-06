class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    @current_user = User.find_by(id: session[:user_id]) #ログイン時のユーザー情報を保持
  end

  def authenticate_user #ログイン時のみに行えるアクション
    if @current_user == nil
      flash[:notice]="ログインが必要です"
      redirect_to("/login")
    end
  end

  def forbid_login_user #ログイン時には実行できないアクション
   if @current_user
     flash[:notice]="すでにログインしています"
     redirect_to("/posts/index")
   end
  end

end
