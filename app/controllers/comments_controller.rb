class CommentsController < ApplicationController
  before_action :set_commentable

  def index
    @comments = @commentable.comments

    respond_to do |format|
      format.json { render status: :ok, json: @comments.to_json}
    end
  end

  def create
    @comment = @commentable.comments.build(comment_params)

    respond_to do |format|
      if @comment.save
        format.json { render status: :created, json: @comment.to_json }
      else
        format.json { render status: :unprocessable_entity, json: @comment.errors.to_json }
      end
    end
  end

  private
  def set_commentable
    @commentable = if params[:post_id]
                     Post.find(params[:post_id])
                   elsif params[:category_id]
                     Category.find(params[:category_id])
                   end
  end
  def comment_params
    params.require(:comment).permit(:author, :content)
  end
end