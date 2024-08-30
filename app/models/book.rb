class Book < ApplicationRecord
  belongs_to :user

  validates :title,
    length: { minimum: 1, maximum: 50 }

  validates :body,
    length: { minimum: 1, maximum: 200 }
end
