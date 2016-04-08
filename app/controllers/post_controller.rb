class PostController < ApplicationController
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(:text => params[:post][:text])
    if @post.save
      flash[:notice] = "Post gravado"
      redirect_to post_index_path
    else
      flash[:notice] = "Erro ao gravar post"
      redirect_to post_index_path
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(:text => params[:post][:text])
      flash[:notice] = "Update sucessfull"
      redirect_to post_path
    else
      flash[:notice] = "Update sucessfull"
      render 'edit'
    end
  end

end
