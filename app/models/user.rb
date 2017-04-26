class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, multiline: true
  validates :username, uniqueness: true
  validates :email, uniqueness: true

  has_many :favorites
  has_many :shows, through: :favorites
  has_many :reviews
  has_many :votes
  attr_accessor :login

  mount_uploader :avatar, AvatarUploader

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    if login
      where(conditions).where(["username = :value OR
                               lower(email) = lower(:value)",
                               { value: login }]).first
    elsif conditions.key?(:username) || conditions.key?(:email)
      where(conditions.to_h).first
    end
  end
end
