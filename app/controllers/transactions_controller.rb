class TransactionsController < ApplicationController
    before_action :set_accounts, only: [:create]

    def index
        @transactions = Transaction.all
        render json: @transactions
    end

    def create
        @transaction = Transaction.new(transaction_params)
        @transaction.from_account = @from_account
        @transaction.to_account = @to_account

        
        if @transaction.save
            update_account_balances
            render json: @transaction, status: :created
        else
            render json: @transaction.errors, status: :unprocessable_entity
        end
    end
end

private

  def set_accounts
    @from_account = BankAccount.find(params[:from_account_id])
    @to_account = BankAccount.find(params[:to_account_id])
  end

  def transaction_params
    params.require(:transaction).permit(:amount)
  end

  def update_account_balances
    ActiveRecord::Base.transaction do
      @from_account.update!(valor_total: @from_account.valor_total - @transaction.amount)
      @to_account.update!(valor_total: @to_account.valor_total + @transaction.amount)
    end
  end