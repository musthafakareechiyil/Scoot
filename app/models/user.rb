class User < ApplicationRecord
  # Validate username presence and uniqueness
  validates :username, presence: { message: "Username can't be blank" }, 
                        uniqueness: { case_sensitive: false, message: "Username must be unique" }, 
                        length: { minimum: 3, message: "Username must be at least 3 characters long" }

  # Validate email presence and format
  validates :email, presence: { message: "Email can't be blank" }, 
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: "Email format is invalid" }

  # Validate phone presence and format
  validates :phone, presence: { message: "Phone can't be blank" },
                     format: { with: /\A\d{10}\z/, message: "Phone format is invalid. It should be 10 digits" }

  # Validate password presence, length and confirmation
  validates :password, presence: { message: "Password can't be blank" }, length: { minimum: 6, message: "Password must be at least 6 characters long" }
  validates_confirmation_of :password, message: "Password and password confirmation do not match"
end
