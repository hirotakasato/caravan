class BlogsController < ApplicationController

	def index
		@blogs = Blog.all
	end
	
	def new
		@blog = Blog.new
		# @つけると、対応するviewで使える。
		# ブログも出ると紐づいた（データを入れるための）からの箱を定義する。
		# インスタンスという。
	end

	def create
		blog = Blog.new(blog_params)
		# ビューから送られてきたデータをblogという空き箱に入れている。
		blog.save
		redirect_to '/blogs'
		# 他のビューに移動するメソッド
	end

	def show
		@blog = Blog.find(params[:id])
		# findメソッドはidを使ってモデルからレコードを探し出すメソッド
	end

	private
		def blog_params
			params.require(:blog).permit(:title, :body, :category)
		end
		# ビューから送信されたデータはparamsというメソッドの中に入っている。
		# ストロングパラメータは、セキュリティを強固にするもの。

end
