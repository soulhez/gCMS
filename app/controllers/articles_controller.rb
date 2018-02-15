# Articles Controller
class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  # GET /articles
  def index
    @articles = Article.all
  end

  # GET /articles/1
  def show; end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/edit
  def edit; end

  # POST /articles
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
      flash[:success] = 'Twój artykuł został edytowany pomyślnie!'
      redirect_to @article
    else
      render :edit
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy

    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article)
          .permit(:title, :text)
  end
end
