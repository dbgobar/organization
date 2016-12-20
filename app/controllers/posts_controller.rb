class PostsController < ApplicationController
# before_action :set_post, only: [:show, :edit, :update, :destroy]
before_action :authenticate_user!, except: [:index, :show]
def index
  @posts = Post.all
end

def show
  @post = Post.find(params[:id])
end

def new
  @post = current_user.posts.build
  #@post = Post.new
end
#leave new empty if it doesnt work


def edit
  @post = Post.find(params[:id])
end

  def create
    # render plain: params[:post].inspect
  @post = current_user.posts.build(post_params)

    @post.save
    redirect_to @post
  end

def update
  @post = Post.find(params[:id])
end

def destroy
  @post = Post.find(params[:id])
  @post.destroy

  redirect_to posts_path
end

private
def post_params
  params.require(:post).permit(:title, :text)
end

end
