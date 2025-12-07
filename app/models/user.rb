class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
  KANA_REGEX = /\A[ァ-ヶー]+\z/.freeze
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze

  # Validations
  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: NAME_REGEX, message: "は全角（漢字・ひらがな・カタカナ）で入力してください" }
  validates :first_name, presence: true, format: { with: NAME_REGEX, message: "は全角（漢字・ひらがな・カタカナ）で入力してください" }
  validates :last_name_kana, presence: true, format: { with: KANA_REGEX, message: "は全角カタカナで入力してください" }
  validates :first_name_kana, presence: true, format: { with: KANA_REGEX, message: "は全角カタカナで入力してください" }
  validates :birth_date, presence: true
  validates :password, format: { with: PASSWORD_REGEX, message: "は6文字以上で英字と数字の両方を含めてください" }
end
