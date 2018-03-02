class ToppagesController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      @post = current_user.posts.build  # Viewのform_for 用
      @posts = current_user.posts.order('created_at DESC').page(params[:page]) # 一覧表示用
    end
  end
end