class TranappsController < ApplicationController

  def index
    #@users = User.all.order('created_at desc').paginate(:page => params[:page], :per_page => 15)
    @tranapps = Tranapp.all.order('created_at desc').paginate(:page => params[:page], :per_page => 15)
  end

  def trannew
    @user = User.find(params[:id])
    @tranapp = Tranapp.find(params[:id])
  end

  def tranupdate
    tranapp = Tranapp.find(params[:id])
    tranapp.endtime = Time.now
    tranapp.status = params[:user][:status]
    tranapp.message = params[:user][:message]
    tranapp.save
    user = tranapp.user
    user.tranaccount = params[:user][:tranaccount]
    user.tranpassword = params[:user][:tranpassword]
    user.save
    sendsms(user.login,"{\"login\":\"" + user.tranaccount + "\",\"password\":\"" + user.tranpassword + "\"}",'SMS_136396664')
    redirect_to tranapps_path

  end

end
