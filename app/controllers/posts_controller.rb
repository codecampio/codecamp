class PostsController < ApplicationController
	def index
		@posts = Post.from_followed_users(current_user).order("created_at DESC")
		@post = current_user.posts.build
	end

  def create
  	@post = current_user.posts.build(create_params)
  	if @post.save
  		flash[:success] = "Posted successfully"
  		redirect_to posts_path
  	else
  		render "new"
  	end
  end

  def destroy
  	@post = current_user.posts.find_by(id: params[:id])
  	if @post && @post.destroy
	  	flash[:success] = "Post deleted"
	  else
	  	flash[:error] = "Cannot delete post"
	  end
  	redirect_to posts_path
  end

  private

  def create_params
  	params.require(:post).permit(:content)
  end
end
