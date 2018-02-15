# Comments Controller
class CommentsController < ApplicationController
  # POST /articles/1/comments
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)

    redirect_to article_path(@article)
  end

  # GET /articles/1/comments/1/edit
  def edit
    # TODO: Add edit comments to articles
  end

  # DELETE /articles/1/comments/1
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy

    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
