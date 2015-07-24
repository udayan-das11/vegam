class CitiesController < ApplicationController
  def add
    numLocations=params.size-6;
	if (City.exists?(params[:city][:cityName]))
		  	for i in 1..numLocations
			    locationField="Location"+i.to_s;
				@location=Locality.new(subCity:params[locationField],city_id:params[:city][:cityName]);
				puts('$$$$$'+@location.subCity.to_s)
				if (@location.subCity && !@location.subCity.blank?)
				  @location.save;
				end  
			end
	else
		@city = City.new(cityName:params[:city][:cityName]);
		if (@city.save) 
		  city2=City.find_by_cityName(@city.cityName);
		  	for i in 1..numLocations
			    locationField="Location"+i.to_s;
				@location=Locality.new(subCity:params[locationField],city_id:city2.id);
				if (@location.subCity && !@location.subCity.blank?)
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
