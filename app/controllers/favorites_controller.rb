class FavoritesController < ApplicationController
  before_action :require_user_logged_in

  def create
    post = Post.find(params[:post_id])
    current_user.like(post)
    flash[:success] = 'ツイートをお気に入りしました。'
    redirect_back(fallback_location: root_url)
  end

  def destroy
    post = Post.find(params[:post_id])
    current_user.unlike(post)
    flash[:success] = 'ツイートのお気に入りを解除しました。'
    redirect_back(fallback_location: root_url)
  end
end