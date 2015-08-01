class AdminsController < ApplicationController
  def services
  end

  def getIcons
  myDir=Dir.entries('app/assets/images/icons')
  	 respond_to do |format|
     format.html
     format.js {} 
     format.json { 
        render json: {:icons => myDir}
     } 
    end	
  end
  def cities
  end

  def contractors
    redirect_to :controller=>"contractors" ,:action => "new"
  end

  def jobs
  end
  
  def admin
    @user=User.new
	  @city=City.new
	  @locations = Locality.all
    @service=Service.new
  end
end
