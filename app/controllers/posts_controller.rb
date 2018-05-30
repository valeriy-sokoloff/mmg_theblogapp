class PostsController < ApplicationController
  before_action :set_category
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = @category.posts
  end

  def show
  end

  def new
    @post = @category.posts.new
  end

  def edit
  end

  def create
    @post = @category.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to category_posts_url(@category), notice: 'Post was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to category_posts_url(@category), notice: 'Post was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to category_posts_url(@category), notice: 'Post was successfully destroyed.' }
    end
  end

  private
  def set_post
    @post = @category.posts.find(params[:id])
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

  def post_params
    params.require(:post).permit(:name, :content)
  end
end
