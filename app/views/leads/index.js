<% js = escape_javascript(
  render(
    :partial => 'list',
    :locals => { :leads => @leads }
  )
) %>
$("#filterrific_results").html("<%= js %>");