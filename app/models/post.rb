class Post < ApplicationRecord
    validates :title, presence: true 
    validate :validated_title
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}

    private

    def validated_title
        allowed_titles = ["You Won't Believe These True Facts"]
        disallowed_titles = ["True Facts"]
    
        if allowed_titles.exclude?(title) && disallowed_titles.include?(title)
          errors.add(:title, "is not allowed")
        end
    end 
end
