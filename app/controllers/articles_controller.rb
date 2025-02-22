class ArticlesController < ApplicationController
  def index
    @query = params[:q]
    @articles = @query.present? ? Article.search(@query) : []
  end

  def details
    @article = Article.get_details(params[:id])
  end
end
