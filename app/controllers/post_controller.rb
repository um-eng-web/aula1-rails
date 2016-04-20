class PostController < ApplicationController
  before_save :check_fullname
  after_destroy :log_destroy
  after_update :log_update
  
  scope :recent, order("created_at desc").limit(4)
  scope :john, where("fullname = 'Joao")
  
 
  
  def new
    @post = Post.new
    
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @posts_john_recent = Post.john.recent
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
  
  private
  def check_fullname
    if self.fullname?
      true
    else
      false
    end
  end
  
  def log_update
    logger.info "Post #{id} updated"
  end

  def log_destroy
    logger.info "Post #{id} deleted"
  end
  
  
end
