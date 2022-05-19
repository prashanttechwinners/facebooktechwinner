class Post < ApplicationRecord
  has_one_attached :photo
  belongs_to :user, optional: true


  has_many :comments, dependent: :destroy #change
  
  def self.search(search)
    where("title LIKE ? OR description LIKE ?","%#{search.downcase}%","%#{search.downcase}%")
  end

  def filter(filter)
    if filter
      @posts = Post.where(category: filter)
    else
      @posts = Post.all
    end
  end

end
