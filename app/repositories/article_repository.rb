class ArticleRepository
    def all
        Article.all
    end

    def find(id)
        Article.find(id)
    end

    def create(attributes)
        Article.create(attributes)
    end

    def update(id, attributes)
        Article.find(id).update(attributes)
    end

    def destroy(id)
        Article.find(id).destroy
    end
end