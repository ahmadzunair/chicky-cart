class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
         
  acts_as_paranoid

  enum role:   %w[user seller admin]

  has_one_attached :image


  has_one :farm, :dependent => :destroy

  # validates :first_name, :last_name, :city, :landline, :address, :phone_number presence: true, unless: :password_changed, on: :update
  # validates :email, presence: true, format: { with: Regexp.new("\\A#{VALID_EMAIL_REGEX}\\z") }, unless: :password_changed
  # validates :phone_number, :landline , numericality: { only_integer: true }, unless: :password_changed

end

