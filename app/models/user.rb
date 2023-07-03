class User < ApplicationRecord
  has_many :group, foreign_key: 'author_id'
  has_many :product, foreign_key: 'author_id'
end
