class BankAccountsController < ApplicationController
    def index
        render json: BankAccount.all
    end

    def create
        @bank_account = BankAccount.new(bank_account_params)

        if @bank_account.save
            render json: @bank_account, status: :created
        else
            render json: @bank_account.errors, status: :unprocessable_entity
        end
    end

    private

    def bank_account_params
        params.require(:bank_account).permit(:valor_total,:user_id)
    end
end
