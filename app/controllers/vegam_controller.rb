class VegamController < ApplicationController
  before_filter :authenticate_user, :only => [:myaccount] 
  
  
  def index
   @user = User.new
  end

  def signin
         puts(params[:user][:email])
		 user2 = User.find_by_email(params[:user][:email])
		 puts(params[:user][:password].to_s+"  > "+user2.password.to_s+"#")
		 if (Digest::SHA1.hexdigest(params[:user][:password].to_s) == user2.password.to_s)
		   session[:user]=user2.email
		   if (user2.email=="admin")
				redirect_to :controller=>"admins" ,:action => "admin"
		   else
				redirect_to :action => "index"
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
  
  def myaccount
    
    
  end
  
  end


