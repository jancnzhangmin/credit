class WithdrawappsController < ApplicationController

  def index
    @withdrawapps = Withdrawapp.all.order('created_at desc').paginate(:page => params[:page], :per_page => 15)
  end

  def edit
    @withdrawapp = Withdrawapp.find(params[:id])

  end

  def update
    @withdrawapp = Withdrawapp.find(params[:id])
    @withdrawapp.status = params[:withdrawapp][:status]
    @withdrawapp.message = params[:withdrawapp][:message]
    @withdrawapp.endtime = Time.now
    @withdrawapp.save
    user = @withdrawapp.user
    withdrawrecord = user.withdrawrecords
    bankcard = Bankcard.find(@withdrawapp.tobank)
    if @withdrawapp.status == 1
      withdrawrecord.create(bank:bankcard.bankdef.bank, bankaccount:bankcard.bankaccount, bankaddress:bankcard.bankaddress, bankname:bankcard.bankname, amount:@withdrawapp.amount)
    end
    redirect_to withdrawapps_path
  end

end
