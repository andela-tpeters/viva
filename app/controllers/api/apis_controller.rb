module Api
  class ApisController < ActionController::API
    before_action :doorkeeper_authorize!

    def route_not_found
      render json: { error: "Route not found" }, status: 404
    end

    private

    def current_user
      User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
    end

    def get_bucketlist
      @bucketlist = current_user.bucketlists.find_by(id: params[:id])
    end
  end
end
