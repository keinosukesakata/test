class PostsController < ApplicationController
  before_action :authenticate_user #ログイン状態を判定
  before_action :ensure_correct_user,{only:[:edit,:update,:destroy]}
  def index
    @posts = Post.all.order(created_at: :desc)   #データベースからデータを格納する
  end

  def new
    @post =Post.new
  end

  def create
    @post = Post.new(
      content:params[:content],#データの受け取り
      user_id:@current_user.id  #投稿ユーザーデータセット（ログインしているユーザーのID情報）
    )

    # 保存に成功した場合は投稿一覧ページ、保存に失敗した場合は新規投稿ページが表示されるようにif-else文を追加してください
    if @post.save
      flash[:notice] ="投稿を作成しました"     #フラッシュメッセージ生成
      redirect_to("/posts/index")     #指定URLへリダイレクト
    else
      render("posts/new")
    end

  end

  def show
     @post = Post.find_by(id:params[:id])  #URLからIDを取得する
     @user = @post.user #投稿ユーザーを取得

     @likes_count = Like.where(post_id: @post.id).count #いいね数をカウント
  end

  def edit  #投稿編集
    @post = Post.find_by(id:params[:id])  #URLからIDを取得する
  end

  def update  #データ編集
    @post = Post.find_by(id:params[:id])   #URLからIDを取得する
    @post.content = params[:content]       #フォームデータ受け取り

    if  @post.save                         #データの格納
        #成功(true)

        flash[:notice] ="投稿を編集しました"     #フラッシュメッセージ生成
        redirect_to("/posts/index")
    else
        #失敗（fales）
        render("posts/edit")
    end

  end

  def destroy #データ削除
    @post = Post.find_by(id:params[:id])  #IDの取得
    @post.destroy                         #データの削除

    flash[:notice] ="投稿を削除しました"     #フラッシュメッセージ生成
    redirect_to("/posts/index")
  end

  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end

end
