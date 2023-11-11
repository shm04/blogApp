class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  after_create :send_confirmation_instructions
  validates :name, presence: true
  validates :post_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  has_many :posts, foreign_key: :author_id, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def send_confirmation_instructions
    puts "Confirmation Token: #{confirmation_token}"
    puts "Confirmation Sent At: #{confirmation_sent_at}"
    puts "Confirmed At: #{confirmed_at}"
    puts "Unconfirmed Email: #{unconfirmed_email}"

  end

  def recent_posts
    posts.includes(:comments).order(created_at: :desc).limit(3)
  end
end
