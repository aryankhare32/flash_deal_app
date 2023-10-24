class BuyersController < ApplicationController
    def create
        @buyer = Buyer.new(buyer_params)

        if @buyer.save
            render json: @buyer, status: :created
        else
            render json: { 
                error: @buyer.errors.full_messages
                }, status: :unprocessable_entity
        end
    end

    private
        def buyer_params
            params.require(:buyer).permit(:name, :email)
        end
end
