class RankingController < ApplicationController
  def index
    @rank = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))
  end
end
