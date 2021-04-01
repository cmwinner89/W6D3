class ArtworkShares < ApplicationController
    def create
        artwork_shares = ArtworkShare.new(artwork_share_params)
        if artwork_shares.save
            render json: artwork_shares
        else
            render json: artwork_shares.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        artwork_share = ArtworkShare.find(params[:id])
        artwork_share.delete
    end

    private

    def artwork_share_params
        params.require(:artwork_shares).permit(:artwork_id, :viewer_id)
    end
end