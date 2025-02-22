class ArticlesController < ApplicationController
  def index
    @query = params[:q] || "Today"
    @articles = Article.search(@query)
  end

  def details
    @article = Article.get_details(params[:id])
  end
end
