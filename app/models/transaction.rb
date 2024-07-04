class Transaction < ApplicationRecord
  belongs_to :from_account, class_name: 'BankAccount'
  belongs_to :to_account, class_name: 'BankAccount'

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validate :different_accounts

  private

  def different_accounts
    errors.add(:to_account, "devem ser contas diferentes") if from_account_id == to_account_id
  end
end
