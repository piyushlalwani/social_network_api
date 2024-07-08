class User < ApplicationRecord
    has_many :posts
    has_many :likes
    has_many :comments
    has_and_belongs_to_many :groups
end
