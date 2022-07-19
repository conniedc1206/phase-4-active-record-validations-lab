class Post < ApplicationRecord
    # is expected to validate that :title cannot be empty/falsy
    validates :title, presence: true
    # is expected to validate that the length of :content is at least 250
    validates :content, length: { minimum: 250 }
    # is expected to validate that the length of :summary is at most 250
    validates :summary, length: { maximum: 250 }
    # is expected to validate that :category is either ‹"Fiction"› or ‹"Non-Fiction"›
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
    # Custom validations: title is clickbait -> is expected not to allow :title to be ‹"True Facts"›
    validate :title_is_clickbait

    def title_is_clickbait
        if title == "True Facts"
            errors.add(:title, "must be clickbait")
        end
    end
end
