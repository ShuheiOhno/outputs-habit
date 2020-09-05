class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(post_id: params[:post_id])

    # @post = Post.find_by(id: @like.post_id)
    # @like_count = Like.where(post_id: params[:post_id]).count

    redirect_back(fallback_location: root_path)
    # respond_to do |format|
    #   format.html
    #   format.json
    # end
  end

  def destroy
    @like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
end
