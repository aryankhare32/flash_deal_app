class SellersController < ApplicationController
    def create
        @seller = Seller.new(seller_params)

        if @seller.save
            render json: @seller, status: :created
        else
            render json: { 
                error: @seller.errors.full_messages
                }, status: :unprocessable_entity
        end
    end

    private
        def seller_params
            params.require(:seller).permit(:name, :email)
        end
end
