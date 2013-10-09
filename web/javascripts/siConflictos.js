jQuery.noConflict();
jQuery(document).ready(function(){
jQuery(".btn-slide").click(function(){
jQuery("#slide_top-sidebar").slideToggle("slow");
jQuery("#slide_top-subsidebar").slideToggle("normal");
});
jQuery("#slide_top-sidebar").css({ display: 'none' });
jQuery("#slide_top-subsidebar").css({ display: 'none'});
});