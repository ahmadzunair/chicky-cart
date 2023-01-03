class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
         
  acts_as_paranoid

   enum role:   %w[user seller admin]

   has_one_attached :image


   has_one :farm, dependent: :destroy



end

