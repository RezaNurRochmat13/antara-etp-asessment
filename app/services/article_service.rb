class ArticleService
    def initialize
        @article_repository = ArticleRepository.new
    end

    def findAllArticles
        @article_repository.all
    end

    def findArticleById(id)
        @article_repository.find(id)
    end

    def createArticle(attributes)
        @article_repository.create(attributes)
    end

    def updateArticle(id, attributes)
        @article_repository.update(id, attributes)
    end

    def destroyArticle(id)
        @article_repository.destroy(id)
    end
end