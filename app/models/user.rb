class User < ActiveRecord::Base

  has_one :address, dependent: :delete
  accepts_nested_attributes_for :address

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
end
