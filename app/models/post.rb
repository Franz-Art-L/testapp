class Post < ApplicationRecord
    validates :email, presence: true
    
    belongs_to :username, required: true

    # the title should only have a maximum 50 characters and at the same time the title attribute should be present
    validates :title, :length => { maximum: 50 }, :presence => true

    # the body should have only a maximum characters of 145 and can be validated even if its blank or empty.
    validates :body, :length => { maximum: 145 }, :allow_blank => true

    # create a custom validator that  will check if its a spam or not.
    validate :spam_free

    # create another custom validator that will check the count of the post, post allowed only up to 23
    validate :post_count
   
    private
        
        def spam_free
            last_post = Post.order(:created_at).last

            if Post.any? and last_post.created_at < 1.minute.ago
                self.errors.add(:base, "Not allowed to post within a minute from the previous post.")
            end
        end

        def post_count
            count = Post.count
            if count > 23
                self.errors.add(:base, "Not allowed to have more than 23 posts.")
            end
        end
end
