class BookingController < ApplicationController
skip_before_filter :verify_authenticity_token , :only => [:doBooking ,:booking]   


def booking
  
  
end

def booking
 puts params[:city]
 puts  params[:service]
  
#  @locality = Locality.where(city_id:params[:city])
   @locality =Locality.find_by_sql(" select * from localities where id in (select locality_id from service_locality_mappings where service_id ='#{params[:service]}' ) ")    
  @subService = SubService.where(service_id:params[:service])
  puts @locality.to_s;
  @serviceId = params[:service]
  @cityId = params[:city]
  
end

def doBooking
 puts params[:cityId]
 puts params[:serviceId]
 
  @booking = Booking.new  
  @scmapping = ServiceCityMapping.where(service_id: params[:serviceId] , city_id: params[:cityId]).first
  @locality =Locality.where(id:params[:localityId]).first
  puts "id" + @locality.id.to_s
  @booking.locality_id = @locality.id
  @subService = SubService.where(id:params[:subServiceId]).first
  @booking.service_city_mapping_id =  @scmapping
  @booking.email =params[:email]
  @booking.address = params[:address]
  @booking.pin = params[:pin]
  @booking.phoneno = params[:phoneno]
  @booking.name = params[:name]
  @booking.sub_service_id = @subService.id
  @booking.save
#send mail to booking and worker both  
UserMailer.booking_email(@booking).deliver


#find a algo to assign a task to worker
@workerMap =WorkerSlMapping.select(:worker_id).distinct.where(locality_id: @locality.id ).map{ |x| x.worker_id }
puts @workerMap
@worker =Worker.where('service_id in (?) and id in (?)', params[:serviceId] ,@workerMap).order('count asc').first
 
    @booking.worker_id = @worker.id
  WorkerMailer.work_email(@worker , @booking).deliver
  if @worker.count.nil?
   @worker.count =1
  else
  @worker.count +=1  
  end
  @worker.save
  @booking.save


  redirect_to :controller => "vegam" , :action => "index"
        

end

end