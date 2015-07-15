class CitiesController < ApplicationController
  def add
    numLocations=params.size-6;
	if (City.exists?(params[:city][:name]))
		  	for i in 1..numLocations
			    locationField="Location"+i.to_s;
				@location=Locality.new(name:params[locationField],city_id:params[:city][:name]);
				if (@location.name && !@location.name.blank?)
				  @location.save;
				end  
			end
	else
		@city = City.new(name:params[:city][:name]);
		if (@city.save) 
		  city2=City.find_by_name(@city.name);
		  	for i in 1..numLocations
			    locationField="Location"+i.to_s;
				@location=Locality.new(name:params[locationField],city_id:city2.id);
				if (@location.name && !@location.name.blank?)
				  @location.save;
				end  
			end
		end	
	end	
	redirect_to :back
  end

  def update
	Locality.destroy(params[:locality_id])
    respond_to do |format|
    format.html
    format.js {} 
    format.json { 
       head :no_content
     } 
    end	 
  end

  def show
     @locations = Locality.where("city_id = ?", params[:city_id])
	 respond_to do |format|
     format.html
     format.js {} 
     format.json { 
        render json: {:locations => @locations}
     } 
    end	 
  end
end
