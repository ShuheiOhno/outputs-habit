class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    flash[:notice] = 'コメントを投稿しました。'
    redirect_to post_path(params[:post_id])

    # respond_to do |format|
    #   format.html { redirect_to post_path(params[:post_id])  }
    #   format.json
    # end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end
  
  def update
    comment = Comment.find(params[:id])
    comment.update(comment_params)
    flash[:notice] = 'コメントを編集しました。'
    redirect_to post_path(id: params[:post_id])

  end

  def destroy
    comment = Comment.find_by(id: params[:post_id])
    comment.destroy
    flash[:notice] = 'コメントを削除しました。'
    redirect_to post_path
  end

  def show
    @comment = Comment.find_by(id: params[:id])
  end


  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
    # params.require(:comment).permit(:text)
  end

end
