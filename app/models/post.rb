class Post < ApplicationRecord
  acts_as_taggable
  
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  validates :content, presence: true
  
  def self.search(search)
    if search
      Post.where('title LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end
  
  mount_uploader :image, ImageUploader
end
