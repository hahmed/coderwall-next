class SubscribersController < ApplicationController
  # TODO: shouldn't need this, not sure why X-CSRF-Token header isn't working
  skip_before_action :verify_authenticity_token

  before_action :require_login, only: [:create, :destroy]

  def create
    @protip = Protip.find_by_public_id!(params[:protip_id])
    @protip.subscribe!(current_user)
    render json: @protip, root: false
  end

  def destroy
    @protip = Protip.find_by_public_id!(params[:protip_id])
    @protip.unsubscribe!(current_user)
    render json: @protip, root: false
  end
end
