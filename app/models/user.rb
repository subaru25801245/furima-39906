class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :items

         validates :nickname, presence: { message: "can't be blank" }

         validates :birth_date, presence: { message: "can't be blank" }

         validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: "is invalid. Include both letters and numbers" }
       
         validates :last_name, presence: { message: "can't be blank" },
                               format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: "is invalid. Input full-width characters" }
       
         validates :first_name, presence: { message: "can't be blank" },
                                format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: "is invalid. Input full-width characters" }
       
         validates :last_kana, presence: { message: "can't be blank" },
                                    format: { with: /\A[ァ-ンー－]+\z/, message: "is invalid. Input full-width katakana characters" }
       
         validates :first_kana, presence: { message: "can't be blank" },
                                     format: { with: /\A[ァ-ンー－]+\z/, message: "is invalid. Input full-width katakana characters" }
  
end
