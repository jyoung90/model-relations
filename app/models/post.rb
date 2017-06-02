class Post < ActiveRecord::Base

  has_many :comments
  belongs_to :user

  validates :title, presence: { message: '제목을 입력해주세요.' }
  validates :content, presence: { message: '내용을 입력해주세요.' }
end
