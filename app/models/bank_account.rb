class BankAccount < ApplicationRecord
  belongs_to :user

  has_many :sent_transactions, class_name: 'Transaction', foreign_key: 'from_account_id'
  has_many :received_transactions, class_name: 'Transaction', foreign_key: 'to_account_id'

  validates :valor_total, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :user_id, uniqueness: true

  before_save :gera_numero_conta

  def gera_numero_conta
    self.numero_conta ||= loop do
      random_number = Array.new(10) { rand(10) }.join
      break random_number unless BankAccount.exists?(numero_conta: random_number)
    end
  end
end
