class PostsController < ApplicationController
	include ApplicationHelper

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
		@user = @post.user.id
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)

    if current_user.posts << @post
      redirect_to root_path
    else
      render :new
    end
	end

	def edit
		@post = Post.find(params[:id])
    @user = current_user
    if @post
      render :edit
    else
      redirect_to root_path
    end

	end

	def update
		@post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to user_post_path(current_user, @post)
    else
      render :edit
    end
	end

	def destroy
		@post = Post.find(params[:id])
    @user = current_user
    @post.destroy
    redirect_to root_path
	end

	private
	
	def post_params
    params.require(:post).permit(:title, :content)
  end

end