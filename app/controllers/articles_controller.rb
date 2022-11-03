class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @highlights = articles_desc_order.first(3)
    highlights_ids = @highlights.pluck(:id).join(', ')

    @articles = articles_desc_order
                .where("id NOT in (#{highlights_ids})")
                .page((params[:page] || 1).to_i)
                .per(2)
  end

  def show; end
  def edit; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    return unless @article.destroy

    redirect_to @article
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def articles_desc_order
    Article.order(created_at: :desc)
  end
end
