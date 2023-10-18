class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :items

  # Constants
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  FULL_WIDTH_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
  KANA_REGEX = /\A[ァ-ヶー]+\z/.freeze # 全角カタカナの正規表現

  # Basic Validations
  validates :nickname, :first_name_kana,
            :last_name_kana, :date_of_birth, presence: true
  validates :password, format: { with: PASSWORD_REGEX, message: 'には半角英字と半角数字の両方を含めて設定してください' }

  # Validations with specific conditions
  with_options presence: true, format: { with: FULL_WIDTH_REGEX, message: '全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: { with: KANA_REGEX, message: '全角カタカナを使用してください' } do
    validates :first_name_kana
    validates :last_name_kana
  end
end

