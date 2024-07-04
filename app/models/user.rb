class User < ApplicationRecord
    has_one :bank_account, dependent: :destroy

    validates :nome_completo, presence: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :cpf, presence: true, uniqueness: true, length: { is: 11 }
end
