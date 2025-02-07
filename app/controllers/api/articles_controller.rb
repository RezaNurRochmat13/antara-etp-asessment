module Api
    class ArticlesController < ApplicationController
        def index
            blogs = service.findAllArticles
            render json: {
                data: blogs
            }
        end

        def show
            blog = service.findArticleById(params[:id])
            render json: {
                data: blog
            }

        rescue ActiveRecord::RecordNotFound => e
            render json: {
              errors: [{
                message: e.to_s
              }]
            }, status: :not_found    
        end

        def create
            blog = service.createArticle(blog_params)
            
            render json: {
                data: blog
            }

        rescue StandardError => e
            render json: {
              errors: [{
                message: e.to_s
              }]
            }, status: :unprocessable_entity    
        end

        def update
            blog = service.updateArticle(params[:id], blog_params)
            
            render json: {
                data: blog
            }

        rescue ActiveRecord::RecordNotFound => e
            render json: {
              errors: [{
                message: e.to_s
              }]
            }, status: :not_found    
        end

        def destroy
            service.destroyArticle(params[:id])
            
            render json: {
                data: {}
            }

        rescue ActiveRecord::RecordNotFound => e
            render json: {
              errors: [{
                message: e.to_s
              }]
            }, status: :not_found    
        end

        private

        def service
            @service ||= ArticleService.new
        end

        def blog_params
            params.require(:article).permit(:title, :description, :content)
        end
    end
end