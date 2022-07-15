class Post < ApplicationRecord
    validates :email, presence: true

    belongs_to :username, required: true
end
