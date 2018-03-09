class ToppagesController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      @post = current_user.posts.build  # Viewのform_for 用
      @posts = current_user.feed_posts.order('created_at DESC').page(params[:page]).per(10) # 一覧表示用
    end
  end
end
  
  
#  def rank
#    if logged_in?
#      @rank = Post.find(Favorite.group(:post_id).order('count_post_id desc').count(:post_id))
#    end
#  end
 
#  def ranking
#    @rank = Post.find()
#  end
  # すべてのポストの中で、一番いいねがついたものを一つだけ検索して、@rankという名前をつける。
#   @rank = Post.  
#    def rank
#    @rank = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))
#  end

# すべてのポストの中で、一番いいねがついたものを一つだけ検索して、@rankという名前をつける。

# @rank = Post.find()

# Favoriteテーブルの中で、一番重複して登録されているpost_idが多いもの。
# → 重複して登録されているpost_idが多いということは、何回もいいねされているということ。

#find：データを検索するメソッド。「」のデータを検索
#count：検索結果の行数を取得。
#order：並び替えのメソッド。一番多い順に並び替える。post_idが多い順に並び替える。
#pluck :任意のからむの配列を取得。
#group：取得した値をグループ化。


#Post.find(Favorite.group(:post_id).order('count_post_id desc').count(:post_id))