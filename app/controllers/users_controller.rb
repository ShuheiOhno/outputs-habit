class UsersController < ApplicationController
    
  def index
    @like_post = current_user.likes.page(params[:page]).per(18)
    Post.where(user_id: current_user.id)
  end
  
  def show
    user = User.find(params[:id])
    @name = user.name
    @posts = user.posts
    like_post_list = Post.where(user_id: params[:id])
    @post_list = Kaminari.paginate_array(like_post_list).page(params[:page]).per(18)
  end
end
