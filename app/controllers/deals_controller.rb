class DealsController < ApplicationController
    def create
        @deal = Deal.new(deal_params)
        save_new_deal
        ## we can write a logic to create available_items parameter by ourselves

        
    end

    def update
        @deal = Deal.find(params[:id])
        keys = params[:deal].keys
        keys.each do |key|
            @deal[key] = params[:deal][key.to_sym]
        end
        save_updated_deal
    end

    
    private
        def deal_params
            params.require(:deal).permit(:total_items, :price_per_item, :start_time, :end_time, :date_of_launch, :seller_id, :available_items)
        end

        def save_updated_deal
            if @deal.save
                render json: @deal, status: :ok
            else
                render json: { 
                    error: @deal.errors.full_messages
                    }, status: :unprocessable_entity
            end
        end

        def save_new_deal
            if @deal.save
                render json: @deal, status: :created
            else
                render json: { 
                    error: @deal.errors.full_messages
                    }, status: :unprocessable_entity
            end
        end
end
