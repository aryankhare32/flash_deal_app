class ClaimedDealsController < ApplicationController
    def create
        if already_exists
            render json: {error: "Cannot buy more than 1 item"}, status: :unprocessable_entity
        else
            @claimed_deal = ClaimedDeal.new(claimed_deal_params)
            ActiveRecord::Base.transaction do
                save_new_claimed_deal
                update_deal
            end
        end
        
        
    end

    private
        def claimed_deal_params
            params.require(:claimed_deal).permit(:deal_id, :buyer_id)
        end

        def save_new_claimed_deal
            ## check if already saved deal exists for this user
            if @claimed_deal.save
                render json: @claimed_deal, status: :created
            else
                render json: { 
                    error: @claimed_deal.errors.full_messages
                    }, status: :unprocessable_entity
            end
        end

        def update_deal
            current_deal = @claimed_deal.deal
            if current_deal.present?
                current_deal[:available_items] -= 1
                current_deal.save
            end
        end

        def already_exists
            existing_claimed_deal  = ClaimedDeal.where("deal_id = ? and buyer_id= ?", params[:claimed_deal][:deal_id], params[:claimed_deal][:buyer_id])
            if existing_claimed_deal.blank?
                return false

            end
            return true

        end

end
