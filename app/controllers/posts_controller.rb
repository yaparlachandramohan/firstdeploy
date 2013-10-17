class PostsController < ApplicationController

  def index
    @posts = Post.order("created_at DESC")
    @post = Post.count
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      flash[:notice] = "Post was successfully saved..!"
      redirect_to :action => "index"
    else
      flash[:notice] = "Something went wrong. Please check & try again..!"
      render :action => "new" 
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:notice] = "Post was successfully Updated..!"
      redirect_to :action => "index"
    else
      flash[:notice] = "Something went wrong. Please check & try again..!"
      render :action => "edit"
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "Post was successfully Deleted..!"
      redirect_to :action => "index"
    else
      flash[:notice] = "Something went wrong. Please check & try again..!"
      redirect_to :action => "index"
    end
  end

end
