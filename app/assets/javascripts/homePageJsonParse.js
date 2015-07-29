$(function(){
	$("#cityName").change(function(){
		var j = $("#"+$("#cityName").val()).val();
		var json = $.parseJSON(j);				
    	i=0;
    	var options="<option value=''>What service do you need?</option>";
    	$.each(json, function(index, element) {
    		$.each(element,function(k,v){
    			if(i!=0){
					options += "<option value="+v.serviceTypeId+" disabled>"+v.serviceTypeName+"</option>";
					console.log(">"+v.serviceTypeId+" : "+v.serviceTypeName);
				}else{
					options += "<option value="+v.serviceTypeId+">"+v.serviceTypeName+"</option>";
					console.log(">"+v.serviceTypeId+" : "+v.serviceTypeName);
				}
    		});
    		if(i==0){
				console.log('------up coming-------');
				options += "<optgroup label='------up coming-------'>";
			}
			i++;
    	});
    	options += "</optgroup>";
		$("#serviceTypeId").html(options);
	});		
	$("#serviceTypeId").change(function(){
		var j 			= $("#"+$("#cityName").val()).val();		
		console.log(">>"+$("#cityName").val()+" : "+$("#cityName option:selected").text());
		var json 		= $.parseJSON(j);
		id 				= $("#serviceTypeId").val();			
    	$.each(json, function(index, element) {		    		
    		$.each(element,function(k,v){
    			if(v.serviceTypeId == id){
    				flow = v.cityServiceBookingFlag;
    				$("#flow").val(flow);
    			}
    		});
    	});
	});	
});