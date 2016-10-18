class User < ApplicationRecord
  enum role: [:normal, :employee, :admin]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :appointments
  has_many :customers, class_name: "User", foreign_key: "stylist_id"
  belongs_to :stylist, class_name: "User"

  def have_stylist?
    if self.stylist_id == 1
      false
    else
      true
    end
  end
end
