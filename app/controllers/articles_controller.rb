class ArticlesController < ApplicationController
  
  def set_article
    @article = Article.find(params[:id])
  end
  
  def index
    @articles = Article.all
  end
  
  def show
    set_article
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to article_path(@article)
  end
  
  def destroy
    set_article
    @article.destroy
    redirect_to articles_path
  end
  
  def edit
    set_article
  end
  
  def update
    set_article
    @article.update(article_params)
    redirect_to articles_path
  end
  
  private
  
  def article_params
    params.require(:article).permit(:title, :body)
  end
end
