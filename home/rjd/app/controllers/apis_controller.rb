class ApisController < ApplicationController
  skip_before_action :verify_authenticity_token
  def register
    status = 0 #0验证码错误 1正常
    user = User.find_by_login(params[:login])
    if user && user.vcode == params[:vcode] && user.vcodetime > Time.now
      user.name = params[:name]
      user.password = params[:password]
      user.password_confirmation = params[:password]
      user.status = 1
      user.save
      status = 1
    end
    render json: params[:callback]+'({"status":'+ status.to_s + '})',content_type: "application/javascript"
  end

  def getvcode
    randnum = randnumber
    status = 0 #0用户已存在 1正常
    user = User.find_by_login(params[:login])
    if user
      if user.status == -1
        status = 1
        sendvcode(params[:login],randnum)
        user.vcode = randnum
        user.vcodetime = Time.now + 5.minutes
        user.save
      else
        status = 0
      end
    else
      User.create!(login:params[:login], vcode:randnum, vcodetime:Time.new + 5.minutes, status: -1, password:params[:login], password_confirmation:params[:login])
      status = 1
    end
    if status == 1
      sendvcode(params[:login],randnum)
    end

    render json: params[:callback]+'({"status":'+ status.to_s + '})',content_type: "application/javascript"
  end

  def idfront
    if params[:login] != ''
      user = User.find_by_login(params[:login])
      if user
        user.idfront = params[:idfront]
        user.save
      end
    end
    render json: '{"status":200}'
  end

  def idback
    if params[:login] != ''
      user = User.find_by_login(params[:login])
      if user
        user.idback = params[:idback]
        user.save
      end
    end
    render json: '{"status":200}'
  end

  def login
    status = 0
    user = User.find_by_login(params[:login])
    if user && user.authenticate(params[:password])
      status = 1
    end
    render json: params[:callback]+'({"status":'+ status.to_s + '})',content_type: "application/javascript"
  end

  def getuserinfo
    status = 0
    user = User.find_by_login(params[:login])
    if user
      status = 1
      render json: params[:callback]+'({"status":' + status.to_s + ',"user":'+ user.to_json + '})',content_type: "application/javascript"
    else
      render json: params[:callback]+'({"status":'+ status.to_s + '})',content_type: "application/javascript"
    end

  end

  def forgetvode
    status = 1
    randnum = randnumber
    user = User.find_by_login(params[:login])
    if user
      sendvcode(params[:login],randnum)
      user.vcode = randnum
      user.vcodetime = Time.now + 5.minutes
      user.save
    end
    render json: params[:callback]+'({"status":'+ status.to_s + '})',content_type: "application/javascript"
  end

  def resetpwd
    status = 0
    user = User.find_by_login(params[:login])
    if user && user.vcode == params[:vcode] && user.vcodetime > Time.now
      user.password = params[:password]
      user.password_confirmation = params[:password]
      user.save
      status = 1
    end
    render json: params[:callback]+'({"status":'+ status.to_s + '})',content_type: "application/javascript"
  end

  def getbankdef
    bankdefs = Bankdef.all
    render json: params[:callback]+'({"bankdefs":'+ bankdefs.to_json + '})',content_type: "application/javascript"
  end

  def addbankcard
    status = 1
    user = User.find_by_login(params[:login])
    bankcards = user.bankcards
    bankcards.create(bankdef_id:params[:bank], bankaccount:params[:bankaccount], bankaddress:params[:bankaddress], bankname:params[:bankname], status:1)
    render json: params[:callback]+'({"status":'+ status.to_s + '})',content_type: "application/javascript"
  end

  class Bankcardclass
    attr :id,true
    attr :bank,true
    attr :account,true
    attr :bankname,true
  end

  def getbankcardlist
    user = User.find_by_login(params[:login])
    bankcards = user.bankcards.where('status = ?',1)
    bankcardarr = Array.new
    bankcards.each do |f|
      bankcardcla = Bankcardclass.new
      bankcardcla.id = f.id
      bankcardcla.bank = f.bankdef.bank
      bankcardcla.account = f.bankaccount[-4,4]
      bankcardcla.bankname = f.bankname
      bankcardarr.push bankcardcla
    end
    render json: params[:callback]+'({"bankcards":'+ bankcardarr.to_json + '})',content_type: "application/javascript"
  end

  def deletebankcard
    status = 1
    bankcard = Bankcard.find(params[:bankcardid])
    bankcard.status = 0
    bankcard.save
    render json: params[:callback]+'({"status":'+ status.to_s + '})',content_type: "application/javascript"
  end

  def getpersonal
    user = User.find_by_login(params[:login])
    render json: params[:callback]+'({"user":'+ user.to_json + '})',content_type: "application/javascript"
  end

  def cantranapp
    status = 0
    user = User.find_by_login(params[:login])
    tranapp = user.tranapps
    if tranapp.count > 0
      status = 1
      render json: params[:callback]+'({"status":'+ status.to_s + ',"tranapp":' + tranapp.last.to_json + '})',content_type: "application/javascript"
    else
      render json: params[:callback]+'({"status":'+ status.to_s + '})',content_type: "application/javascript"
    end
  end

  def tranapp
    status = 1
    user = User.find_by_login(params[:login])
    tranapps = user.tranapps.create(starttime:Time.now, status:0)
    ActionCable.server.broadcast 'remind_channel',Tranapp.where('status = ?',0).count.to_s + ',' + Withdrawapp.where('status = ?',0).count.to_s
    rephones.each do |f|
      sendsms(f.phone,"{\"name\":\"" + user.name + "\",\"phone\":\"" + user.login + "\"}",'SMS_136381767')
    end
    render json: params[:callback]+'({"status":'+ status.to_s + '})',content_type: "application/javascript"
  end

  def withdrawapp
    status = 1
    user = User.find_by_login(params[:login])
    withdrawapp  = user.withdrawapps
    withdrawapp.create(amount:params[:amount], status:0, tobank:params[:bank], starttime:Time.now)
    ActionCable.server.broadcast 'remind_channel',Tranapp.where('status = ?',0).count.to_s + ',' + Withdrawapp.where('status = ?',0).count.to_s
    rephones = Rephone.all
    rephones.each do |f|
      sendsms(f.phone,"{\"name\":\"" + user.name + "\",\"phone\":\"" + user.login + "\",\"amount\":\"" + sprintf("%.2f",params[:amount].to_f) + "\"}",'SMS_136386687')
    end
    render json: params[:callback]+'({"status":'+ status.to_s + '})',content_type: "application/javascript"
  end

  class Withdrawappclass
    attr :id,true
    attr :bank,true
    attr :bankaccount,true
    attr :bankaddress,true
    attr :bankname,true
    attr :amount,true
    attr :status,true
    attr :message,true
    attr :starttime,true
    attr :endtime,true
  end

  def getwithdrawapp
    user = User.find_by_login(params[:login])
    withdrawapps = user.withdrawapps.order('created_at desc')
    withdrawapparr = Array.new
    withdrawapps.each do |withdrawapp|
      bankcard = Bankcard.find(withdrawapp.tobank)
      withdrawappcla = Withdrawappclass.new
      withdrawappcla.id = withdrawapp.id
      withdrawappcla.bank = bankcard.bankdef.bank
      withdrawappcla.bankaccount = bankcard.bankaccount[-4,4]
      withdrawappcla.bankaddress = bankcard.bankaddress
      withdrawappcla.bankname = bankcard.bankname
      withdrawappcla.amount = withdrawapp.amount
      withdrawappcla.status = withdrawapp.status
      withdrawappcla.message = withdrawapp.message
      withdrawappcla.starttime = withdrawapp.starttime
      withdrawappcla.endtime = withdrawapp.endtime
      withdrawapparr.push withdrawappcla
    end
    render json: params[:callback]+'({"withdrawapps":' + withdrawapparr.to_json + '})',content_type: "application/javascript"
  end




end
