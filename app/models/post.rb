class Post < ApplicationRecord

  belongs_to :user, optional: true
  has_one_attached :avatar

  has_many :comments, dependent: :destroy 
  
  validates :avatar, presence: true

  def self.search(search)
    where("title LIKE ? OR description LIKE ?","%#{search.downcase}%","%#{search.downcase}%")
  end

  def filter(filter)
    if filter
      @posts = Posts.where(category: filter)
    else
      @posts = Posts.all
    end
  end
end
