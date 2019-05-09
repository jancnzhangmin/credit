class BankcardsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @bankcards = @user.bankcards
  end

end
