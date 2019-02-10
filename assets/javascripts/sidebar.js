$("#sidebar_hide_button").on("click", function() {
  $( "#sidebar" ).css("display", "none");
  $( "#sidebar_hide_button" ).css("visibility", "hidden");
  $( "#sidebar_show_button" ).css("visibility", "visible");
  $( "#pagecontentcustom" ).css("padding-left", "0px");
})

$("#sidebar_show_button").on("click", function() {
  $( "#sidebar" ).css("display", "block");
  $( "#sidebar_hide_button" ).css("visibility", "visible");
  $( "#sidebar_show_button" ).css("visibility", "hidden");
  $( "#pagecontentcustom" ).css("padding-left", "253.6px");


})
