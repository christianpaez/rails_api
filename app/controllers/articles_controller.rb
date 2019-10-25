class ArticlesController < ApplicationController
    def index
        articles = Article.order(created_at: :desc)
        render json:{status: "SUCCESS", message: "Loaded Articles", data: articles}, status:200
    end

    def show
        article = Article.find(params[:id])
        render json:{status: "SUCCESS", message: "Loaded Single Article", data: article}, status:200
    end

    def create
        article = Article.new(article_params)

        if article.save
            render json:{status: "SUCCESS", message: "Saved Article", data: article}, status:200
        else
            render json:{status: "ERROR", message: "Article Not Saved", data: article}, status:422
        end
    end

    def update
        article = Article.find(params[:id])

        if article.update(article_params)
            render json:{status: "SUCCESS", message: "Updated Article with id: " + params[:id], data: article}, status:200
        else
            render json:{status: "ERROR", message: "Article Not Updated", data: article.errors}, status:422
        end
    end

    def destroy
        article = Article.find(params[:id])
        article.destroy
        render json:{status: "SUCCESS", message: "Deleted Article with id: " + params[:id], data: article}, status:200
    end

    private 
    def article_params()
        params.permit(:title, :body)
    end

end
