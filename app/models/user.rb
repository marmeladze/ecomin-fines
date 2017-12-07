class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :email, uniqueness: true
  
  has_many :reports

  scope :living, -> { where(deleted: false) }

  has_secure_password

  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  def living?
    not deleted?
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def remove!
    User.where(id: id).update_all(deleted: true)
  end
end
