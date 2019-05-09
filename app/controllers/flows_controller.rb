class FlowsController < ApplicationController

  protect_from_forgery except:[ :update_attachment,:update]
  def index
    @flowdefs = Flowdef.where('status = 1')
  end

  def new
    flowdef = Flowdef.find(params[:format])
    @flow = flowdef.flows.create(title:'', currentnode:0)
    #@flow = Flow.create(title:'', currentnode:0)
    wordtypes = flowdef.wordtypes.order('corder')
    ccount = 0
    wordtypes.each do |wordtype|
      wordtypedef = wordtype.wordtypedef
      if wordtypedef
        if wordtypedef.wordkey == 'float'
          @flow.flowfloats.create(name:wordtype.name, isnull:wordtype.isnull, isnullsummary:wordtype.nullsummary, corder:ccount, wordtype:'float')
        elsif wordtypedef.wordkey == 'string'
          @flow.flowstrings.create(name:wordtype.name, isnull:wordtype.isnull, isnullsummary:wordtype.nullsummary, corder:ccount, wordtype:'string')
        elsif wordtypedef.wordkey == 'text'
          @flow.flowtexts.create(name:wordtype.name, isnull:wordtype.isnull, isnullsummary:wordtype.nullsummary, corder:ccount, wordtype:'text')
        elsif wordtypedef.wordkey == 'attach'
          @flow.flowattachments.create(name:wordtype.name, isnull:wordtype.isnull, isnullsummary:wordtype.nullsummary, corder:ccount, wordtype:'attach')
        elsif wordtypedef.wordkey == 'int'
          @flow.flowints.create(name:wordtype.name, isnull:wordtype.isnull, isnullsummary:wordtype.nullsummary, corder:ccount, wordtype:'int')
        end
        ccount += 1
      end
    end
    redirect_to edit_flow_path(@flow)
  end

  def edit
    @flow = Flow.find(params[:id])
    @flowdetail = @flow.flowfloats
    @flowdetail += @flow.flowstrings
    @flowdetail += @flow.flowtexts
    @flowdetail += @flow.flowattachments
    @flowdetail += @flow.flowints
    @flowdetail.sort_by!{|r| r.corder}
    @flow.feedbacks.build
  end

  def show
    @flow = Flow.find(params[:id])
    @flowdetail = @flow.flowfloats
    @flowdetail += @flow.flowstrings
    @flowdetail += @flow.flowtexts
    @flowdetail += @flow.flowattachments
    @flowdetail += @flow.flowints
    @flowdetail.sort_by!{|r| r.corder}
  end

  def update

    @flow = Flow.find(params[:id])
    @flow.title = params[:flow][:title]
    @flow.summary = params[:flow][:summary]
    #@flow.save

    params[:val][0].keys.each do |f|
      puts f.split('-')[2]
      if f.split('-')[2] == 'float'
        flowval = Flowfloat.find(f.split('-')[0])
        flowval.val = params[:val][0][f]
        flowval.save
      elsif f.split('-')[2] == 'string'
        flowval = Flowstring.find(f.split('-')[0])
        flowval.val = params[:val][0][f]
        flowval.save
      elsif f.split('-')[2] == 'text'
        flowval = Flowtext.find(f.split('-')[0])
        flowval.val = params[:val][0][f]
        flowval.save
      elsif f.split('-')[2] == 'int'
        flowval = Flowint.find(f.split('-')[0])
        flowval.val = params[:val][0][f]
        flowval.save
      end
    end

    user = User.find_by_login(session[:login])
    nextuser_id = 0
    if @flow.currentnode == 0
      basesector = Basesector.find(params[:basesector])
      if basesector
        users = basesector.users
        users.each do |u|
          auths = []
          usergroup = u.usergroups
          usergroup.each do |g|
            auths += g.auths.map(&:keyword)
          end
          if auths.include? 'head'
            nextuser_id = u.id
          end
        end
      else
        unionsector = user.unionsector
        users = unionsector.users
        users.each do |u|
          auths = []
          usergroup = u.usergroups
          usergroup.each do |g|
            auths += g.auths.map(&:keyword)
          end
          if auths.include? 'head'
            nextuser_id = u.id
          end
        end
      end
    elsif  @flow.currentnode == 1
      if params[:feedbacks][:opinion] == 0
        feedback = @flow.feedbacks.last
        nextuser_id = feedback.user_id
        @flow.currentnode -= 1
      else
        users = unionsector = @flow.flowdef.unionsector.users
        users.each do |user|
          auths = []
          user.usergroups.each do |usergroup|
            auths += usergroup.auths.ids
          end
          auths = Auth.where('id in (?)',auths)
          keywords = auths.map(&:keyword)
          if keywords.include?('business')
          nextuser_id = user.id
          end
        end
      end
    elsif @flow.currentnode == 2
      if params[:feedbacks][:opinion] == 0
        feedback = @flow.feedbacks.last
        nextuser_id = feedback.user_id
        @flow.currentnode -= 1
      end
    end


    @flow.feedbacks.create(opinion:params[:feedbacks][:opinion], summary:params[:feedbacks][:summary], user_id:user.id,nextuser_id:nextuser_id)
    if params[:feedbacks][:opinion] == 1
      @flow.currentnode -= 1
      if @flow.currentnode < 0
        @flow.currentnode = 0
      end
    else
      @flow.currentnode += 1
      if @flow.currentnode > 3
        @flow.currentnode = 3
      end
    end
    @flow.save
redirect_to myflows_path
  end

  def get_attachments
    flowattachment = Flowattachment.find(params[:flowattachment_id])
    attachments = flowattachment.attachments.order('id desc')
    attachmentarr = Array.new
    attachments.each do |f|
      imagetype = '/attachmentimg/attach.png'
      if f.attachment_content_type.include?('text')
        imagetype = '/attachmentimg/text.png'
      elsif f.attachment_content_type.include?('image')
        imagetype = f.attachment.url
      elsif f.attachment_content_type.include?('word')
        imagetype = '/attachmentimg/word.png'
      elsif f.attachment_content_type.include?('sheet')
        imagetype = '/attachmentimg/excel.png'
      elsif f.attachment_content_type.include?('pdf')
        imagetype = '/attachmentimg/pdf.png'
      elsif f.attachment_content_type.include?('presentation')
        imagetype = '/attachmentimg/powerpoint.png'
      else
        imagetype = '/attachmentimg/attach.png'
      end
      option = {
          id:f.id,
          attachment_content_type:f.attachment_content_type,
          url:f.attachment.url,
          attachment_file_name:f.attachment_file_name,
          imagetype:imagetype
      }

      attachmentarr.push option
    end
    render json: attachmentarr.to_json
  end

  def del_attachment
    attachment = Attachment.find(params[:attachment_id])
    attachment.destroy
    render json: '{"status":200}'
  end

  def uploadfile
    @flowattachment = Flowattachment.find(params[:flowattachment_id])
    @flowattachment.attachments.create(attachment:params[:upfile])
    render(partial: 'update_attachment', formats:[:js] )
  end


end
