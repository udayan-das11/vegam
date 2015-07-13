class AdminsController < ApplicationController
  def services
  end

  def cities
  end

  def contractors
  end

  def jobs
  end
  
  def admin
    @user=User.new
  end
end
