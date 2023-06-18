class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
   validates :nickname, presence: true
   validates :birthdate, presence: true
   validate :password_complexity
   validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "は全角（漢字・ひらがな・カタカナ）で入力してください" }
   validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "は全角（漢字・ひらがな・カタカナ）で入力してください" }
   validates :family_name_pron, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角（カタカナ）で入力してください" }
   validates :first_name_pron, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角（カタカナ）で入力してください" }

   
  private
  
  def password_complexity
    return if password.blank?
    
    unless password.match?(/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/)
      errors.add(:password, "must contain at least one letter and one digit, and be at least 8 characters long")
    end
  end

   
   
end
