require 'net/https'
require 'uri'
require 'json'

class VegamController < ApplicationController
  before_filter :authenticate_user, :only => [:myaccount] 
skip_before_filter :verify_authenticity_token , :only => [:index ,:fbauth]   
  
  def index
   @user = User.new
   @city  =City.all 
   @servicecityMapping = ServiceCityMapping.all
    @jsonSCMapping = @servicecityMapping.to_json
   @service = Service.all
   @jsonCity = @city.to_json
   @jsonService = @service.to_json.to_s
  puts @jsonService
  
  end

  def signin
         puts(params[:user][:email])
		 user2 = User.find_by_email(params[:user][:email])
		puts "ss url" + session[:requestUrl]
		 puts(Digest::SHA1.hexdigest(params[:user][:password].to_s)+"  > "+user2.password.to_s+"#")
		 if (Digest::SHA1.hexdigest(params[:user][:password].to_s) == user2.password.to_s)
		  puts "pwd match"
		   session[:user]=user2.email
		   if (user2.email=="admin")
				redirect_to :controller=>"admins" ,:action => "admin"
		    elsif session[:requestUrl].nil?
      puts "ssurl nil"
         redirect_to :action => "index"
				else
			puts "ssurl not nil"
				 url = session[:requestUrl]
          session.delete(:requestUrl)
				redirect_to  url  
		   end	
		 else
	       render :template => "users/error" 
		 end  
  
  end

  def signup
       @user=User.new(email:params[:user][:email],fname:params[:user][:fname],lname:params[:user][:lname],dob:params[:user][:dob],password:params[:user][:password],gender:params[:user][:gender],phone:params[:user][:phone])
	   if (params[:password].to_s == params[:confirm_password].to_s)
	      @user.password = Digest::SHA1.hexdigest(@user.password);
	     @user.save
	     session[:user]=@user.email
	     redirect_to :action => :index
	 end  
  end
 
  def fbauth
    
    puts params[:fblogin].to_s
     

# HTTPClient#get_content follows redirects and returns a string
# HTTPClient#get takes a `:follow_redirect => true` option
 url = 'https://graph.facebook.com/me?fields=email&access_token='+params[:fblogin].to_s;
 uri = URI.parse(url.to_s)
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
puts uri.request_uri.to_s
request = Net::HTTP::Get.new(uri.request_uri)

response = http.request(request)
puts response.body.to_s
puts response.to_s

 

  

if response.body.to_s.include? "email"
  
  puts JSON.parse(response.body.to_s)['email'];
  puts User.find_by_email(JSON.parse(response.body.to_s)['email'])
    user2 = User.find_by_email(JSON.parse(response.body.to_s)['email'])
    unless user2.nil?
  
  
 
  puts "came here "; 
 session[:user] = user2.email;
  end
if user2.nil?
  
 @user3=  User.new(email:JSON.parse(response.body.to_s)['email'])
  @user3.save
   session[:user] = @user3.email;
end
  end
       
 
    # that will mean to send a javascript code to client-side;
     render :text => "OK"
  end
 
  def myaccount
    
    
  end
  
   
    
  end
  


