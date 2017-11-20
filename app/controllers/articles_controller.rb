class ArticlesController < ApplicationController
  before_action :set_article, only: %i[edit update show destroy]
  before_action :require_user, except: %i[index show]
  before_action :require_same_user, only: %i[edit update destroy]

  def index
    @articles = Article.paginate(page: params[:page], per_page: 10)
  end

  def new
    @article = Article.new
  end

  def edit
    set_article
  end

  def create
    # render plain: params[:article].inspect
    @article = Article.new(article_params)
    @article.user = User.first
    if @article.save
      flash[:success] = 'Article saved'
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def update
    set_article
    if @article.update(article_params)
      flash[:success] = 'Article updated'
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def show
    set_article
  end

  def destroy
    set_article
    @article.destroy
    flash[:danger] = 'Article deleted'
    redirect_to articles_path
  end


  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def require_same_user
    return if current_user == @article.user
    flash[:danger] = 'You can edit or delete only your own articles'
    redirect_to root_path
  end

end