class AdminsController < ApplicationController
  def services
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
  end
end
