class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :hotels, dependent: :destroy

  enum user_type: [:user_default, :user_hotel, :admin  ]

  validates :username, presence: true
  validates :email, presence: true
  validates :cpf, format: { with: /^\d{11}$/,
    message: "Formato de CPF incorreto", :multiline => true }, presence: true
  validates :encrypted_password, presence: true


  

end
