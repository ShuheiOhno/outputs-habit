class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @posts = Post.includes(:user, :tags).order("created_at DESC")
    if params[:tag_name]
      @posts = Post.tagged_with("#{params[:tag_name]}")
    end
    # 不要かもいいね用
    @post = Post.new
    # ランダム
    @randoms = Post.order("RAND()").limit(5)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = '投稿しました'
      redirect_to posts_path
    else
      flash.now[:alert] = '投稿できませんでした。タイトルと内容を入力してください。'
      render :new
    end    
  end

  def edit
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = '編集しました。'
      redirect_to post_path(params[:id])
    else
      flash.now[:alert] = '投稿できませんでした。タイトルと内容を入力してください。'
      render :edit
    end
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:notice] ='投稿を削除しました'
    redirect_to root_path
  end

  def show
    # いいね用
    @like = Like.new
    # コメント用
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order("created_at DESC")
    
  end

  def search
    @posts = Post.search(params[:keyword])
    respond_to do |format|
      format.html
      format.json
    end
  end

  # 一覧表示
  def post_list
    @post_list = Post.includes(:user, :tags).order("created_at DESC").page(params[:page]).per(18)
  end

  def another_user_post_list
    post = Post.find(params[:id])
    @name = post.user.name
    like_post_list = Post.where(user_id: post.user.id)
    @post_list = Kaminari.paginate_array(like_post_list).page(params[:page]).per(18)
  end

  private
  def post_params
    params.require(:post).permit(:title, :image, :content, :tag_list).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
