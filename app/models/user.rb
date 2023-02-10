class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy

  has_one_attached :image

  def get_profile_image
    unless profile_image.attached?
      file_path = Rails.root.join('')
      profile_image.attach(io: File.open(file_path), filename: '', content_type: '')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
end