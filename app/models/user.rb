class User < ApplicationRecord
  validates_format_of :mail,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :mail, presence: true, uniqueness: true
  validates :password, presence: true

end
