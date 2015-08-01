class ServicesController < ApplicationController
  def add
    puts(params[:city_id]+' '+params[:location_id]+' '+params[:service_name])
	service = Service.find_by_name(params[:service_name])
	if (service)
		if (!ServiceCityMapping.exists?(service_id: service.id.to_s , city_id: params[:city_id]))
		   newServiceCityMapping =  ServiceCityMapping.new(city_id:params[:city_id],service_id:service.id)
		   newServiceCityMapping.save
		end	
		@service_locality_mapping = ServiceLocalityMapping.new(city_id:params[:city_id],service_id:service.id,locality_id:params[:location_id]);
			if (@service_locality_mapping.save)
				 respond_to do |format|
			     format.html
			     format.js {} 
			     format.json { 
			        render json: {:status => 'successful'}
			     } 
				 end
			else
				 respond_to do |format|
			     format.html
			     format.js {} 
			     format.json { 
			        render json: {:status => 'failed'}
			     } 
				 end
			end
	else
	        @service = Service.new(name:params[:service_name],image:params[:icon_name])
			@service.save
			service = Service.find_by_name(params[:service_name])
			if (!ServiceCityMapping.exists?(service_id: service.id.to_s , city_id: params[:city_id]))
			   newServiceCityMapping =  ServiceCityMapping.new(city_id:params[:city_id],service_id:service.id)
			   newServiceCityMapping.save
			end	
		    @service_locality_mapping = ServiceLocalityMapping.new(city_id:params[:city_id],service_id:service.id,locality_id:params[:location_id]);
			if (@service_locality_mapping.save)
				 respond_to do |format|
			     format.html
			     format.js {} 
			     format.json { 
			        render json: {:status => 'successful'}
			     } 
				 end
			else
				 respond_to do |format|
			     format.html
			     format.js {} 
			     format.json { 
			        render json: {:status => 'failed'}
			     } 
				 end
			end
	end	
  end

  def update
  end

  def show
	end

	def addSubService
		puts("@@@@@@@@@@@@@@@@@@@@@@@")
		puts(params.length.to_s);

		numLocations=params.size-6;
		for i in 1..numLocations
			subserviveField="Subservice"+i.to_s;
			@subservice=SubService.new(subServiceName:params[subserviveField],service_id:params[:service][:name]);

			if (@subservice.subServiceName && !@subservice.subServiceName.blank?)
				@subservice.save;
			end
		end
		redirect_to :back
	end
end
