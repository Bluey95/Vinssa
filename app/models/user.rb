class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of   :avatar
  validates_integrity_of  :avatar
  validates_processing_of :avatar

  def update_admin(user)
    if user.admin == false
      update_attribute(:admin, true)
    else
      user.update_attribute(:admin, false)
    end
  end

  def update_supplier(user)
    if user.supplier == false
      update_attribute(:supplier, true)
    else
      user.update_attribute(:supplier, false)
    end
  end
end
