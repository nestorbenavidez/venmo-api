class PaymentsController < ApplicationController
  def create
    if Payment.transfer_amount(params[:user_id],params[:friend_id],params[:amount],params[:description])
      render json: User.where(id: params[:friend_id]).first #for testing
    else
      render json: "Payment can't be completed", status: :unprocessable_entity
    end
  end
end
