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
		# binding.pry
		# コンソールに入りたい場所でこれを記述
	end

	def show
		@blog = Blog.find(params[:id])
		# findメソッドはidを使ってモデルからレコードを探し出すメソッド
	end

	def edit
		@blog = Blog.find(params[:id])
	end

	def update
		blog = Blog.find(params[:id])
		blog.update(blog_params)
		# redirect_to '/blogs/#{blog.id}'
		redirect_to blog_path(blog.id)
		# rake routesで確認できるprefix(名前付きパス)を使用
		# 別解
		# redirect_to blog_path(blog)
		# redirect_to blog
	end

	def destroy
		blog = Blog.find(params[:id])
		blog.destroy
		redirect_to blogs_path
	end

	private
		def blog_params
			params.require(:blog).permit(:title, :body, :category, :blog_image)
		end
		# ビューから送信されたデータはparamsというメソッドの中に入っている。
		# ストロングパラメータは、セキュリティを強固にするもの。

end
