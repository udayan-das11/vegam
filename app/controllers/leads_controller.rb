require 'net/imap'
require 'net/http'
class LeadsController < ApplicationController
     def index
	 #  puts('$$$$$$$$$4start')
	#	Mail.defaults do
	#	  retriever_method :imap, :address    => 'imap.gmail.com',
	#	                          :port       => 993,
	#	                          :user_name  => 'vegamcorp@gmail.com',
	#	                          :password   => 'Vegam@123',
	#	                          :enable_ssl => true
	 #end
	#    @conversations =	Mail.all                                        
	  imap = Net::IMAP.new('imap.gmail.com', 993, true, nil, false)
      imap.login('vegamcorp@gmail.com', 'Vegam@123')
	  imap.examine('INBOX')
	  @emails = []
	  @message_ids = []
	  imap.search(["NOT", "DELETED"]).each do |message_id|
		  puts('%%%%%%%%%')
		  my_attrs = imap.fetch(message_id, "ENVELOPE")[0]
		  envelope = my_attrs.attr["ENVELOPE"]		  
		  puts('###'+message_id.to_s+' '+envelope.subject+'  '+envelope.message_id)
		  @emails.push(envelope)
		  @message_ids.push(message_id)
		end
		@emails_paginated=@emails.paginate(:page => params[:page], :per_page => 5)
		@message_ids_paginated=@message_ids.paginate(:page => params[:page], :per_page => 5)
  end
  def showBody
	puts(params[:message_id])
	imap = Net::IMAP.new('imap.gmail.com', 993, true, nil, false)
    imap.login('vegamcorp@gmail.com', 'Vegam@123')
	imap.examine('INBOX')
	msg = imap.fetch(params[:message_id].to_i, "(UID RFC822.SIZE ENVELOPE BODY[TEXT])")[0]
    body = msg.attr["BODY[TEXT]"]
	puts(body)
	respond_to do |format|
    format.html
    format.js {} 
    format.json { 
       render json: {:msg_body => body}
     } 
    end	 
  end
    def showBody2
	puts(params[:message_id])
	Mail.defaults do
		  retriever_method :imap, :address    => 'imap.gmail.com',
		                          :port       => 993,
		                          :user_name  => 'vegamcorp@gmail.com',
		                          :password   => 'Vegam@123',
		                          :enable_ssl => true
	 end
	@conversations =	Mail.find(:what => :first, :count => 10, :order => :asc, :keys=>'UID '+params[:message_id]) 
	mail = @conversations[0]
	respond_to do |format|
    format.html
    format.js {} 
    format.json { 
       render json: {:msg_body => mail.parts[0].body.decoded}
     } 
    end	 
  end
    def deleteMail
	puts(params[:message_id])
	imap = Net::IMAP.new('imap.gmail.com', 993, true, nil, false)
    imap.login('vegamcorp@gmail.com', 'Vegam@123')
	imap.examine('INBOX')
	msg = imap.fetch(params[:message_id].to_i, "(UID RFC822.SIZE ENVELOPE BODY[TEXT])")[0]
	puts('*** '+msg.attr['ENVELOPE'].subject)
	imap.uid_copy(params[:message_id].to_i, '[Gmail]/Trash')
	imap.select("INBOX")
	imap.store(params[:message_id].to_i, '+FLAGS', [:Deleted])
	imap.expunge()
	respond_to do |format|
    format.html
    format.js {} 
    format.json { 
       render json: {:msg_body => 'deleted'}
     } 
    end	 
  end
end
