class CitiesController < ApplicationController
  def add
    numLocations=params.size-6;
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

  def update
  end

  def show
    @locations = Locality.find_by_city_id(params[:city_id]);
	   if request.xhr?
        render :json => {
                            :location_name => @locations.name,
							:location_id => @locations.id
                        }
		end				
  end
end
