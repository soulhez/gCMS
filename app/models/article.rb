# Article Model
class Article < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :title, presence: true,
                    length: { in: 5..64 }
  # length: { in: 5..64 }
  validates :text,  presence: true
end
