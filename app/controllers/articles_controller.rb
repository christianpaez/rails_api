class ArticlesController < ApplicationController
    def index
        articles = Article.order(created_at: :desc)
        render json:{status: "SUCCESS", message: "Loaded Articles", data: articles}, status:200
    end
end
