class TokenTransferController < ApplicationController
  before_action :validate, only: :amount

  def reset
    User.all.each do |user|
      user.amount = 1000
      user.save
    end
    render json: { success: true }

  end

  def transfer
    from_user = User.find_by_id params[:transfer_from]
    to_user = User.find_by_id params[:transfer_to]

    amount = params[:amount].to_f

    if from_user.nil? || to_user.nil?
    elsif amount > from_user.amount
      raise "not enough amount to transfer"
    else
      from_user.amount -= amount
      to_user.amount += amount
      from_user.save
      to_user.save
      render json: { success: true, amount: amount }

    end


  end

  def amount
    render json: current_user.amount
  end

  private

  def current_user
    User.validate(params[:token])
  end


end
