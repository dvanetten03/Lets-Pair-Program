class Section < ActiveRecord::Base
  validates :name, presence: :true
  belongs_to :category
  has_many :posts
end
