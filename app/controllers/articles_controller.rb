class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @highlights = Article.order_by_date.first(3)
    highlights_ids = @highlights.pluck(:id).join(', ')

    @articles = Article.without_highlights(highlights_ids)
        .order_by_date
        .page((params[:page] || 1).to_i)
  end

  def show; end
  def edit; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    return unless @article.destroy

    redirect_to @article, notice: 'Article was successfully Deleted.'
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :category_id)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
