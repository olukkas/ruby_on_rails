class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable  and :omniauthable

  has_many :articles, dependent: :destroy

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable,
         :trackable
end
