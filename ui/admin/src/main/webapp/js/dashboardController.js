angular.module('app')
.controller ('dashboardController', function($scope,$rootScope,$stateParams,$http,$filter,$state,$timeout) {
    console.log("dashboard");
    $scope.goToProductPage=function(){
    	$state.go("product",{});
    }
    
    $scope.goToSalesPage=function(){
    	$state.go("sales",{});
    }
    $timeout(enableChart(),0);
    
   //$scope.schoolDashBoardContent=false;
    $('#fullDashBoard').removeAttr('style');
    
    
//    $('#loginButton').attr('disabled', 'disabled');
    
 });

/*$(function () {});*/

function enableChart(){
	
	/*$("<link/>", {rel: "stylesheet",type: "text/css",href: "assets/global/plugins/font-awesome/css/font-awesome.min.css"}).appendTo("head");
	$("<link/>", {rel: "stylesheet",type: "text/css",href: "assets/global/plugins/simple-line-icons/simple-line-icons.min.css"}).appendTo("head");
	$("<link/>", {rel: "stylesheet",type: "text/css",href: "assets/global/plugins/bootstrap/css/bootstrap.min.css"}).appendTo("head");
	$("<link/>", {rel: "stylesheet",type: "text/css",href: "assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css"}).appendTo("head");
	$("<link/>", {rel: "stylesheet",type: "text/css",href: "assets/global/plugins/bootstrap-daterangepicker/daterangepicker.min.css"}).appendTo("head");
	$("<link/>", {rel: "stylesheet",type: "text/css",href: "assets/global/plugins/morris/morris.css"}).appendTo("head");
	$("<link/>", {rel: "stylesheet",type: "text/css",href: "assets/global/plugins/fullcalendar/fullcalendar.min.css"}).appendTo("head");
	$("<link/>", {rel: "stylesheet",type: "text/css",href: "assets/global/plugins/jqvmap/jqvmap/jqvmap.css"}).appendTo("head");
	$("<link/>", {rel: "stylesheet",type: "text/css",href: "assets/global/css/components-rounded.min.css"}).appendTo("head");
	$("<link/>", {rel: "stylesheet",type: "text/css",href: "assets/global/css/plugins.min.css"}).appendTo("head");
	$("<link/>", {rel: "stylesheet",type: "text/css",href: "assets/layouts/layout5/css/layout.min.css"}).appendTo("head");
	$("<link/>", {rel: "stylesheet",type: "text/css",href: "assets/layouts/layout5/css/custom.min.css"}).appendTo("head");
	*/
	
	
	
	
	
	
	
	
//	$.getScript( "assets/global/plugins/jquery.min.js", function() {});
//	$.getScript( "assets/global/plugins/bootstrap/js/bootstrap.min.js", function() {});
//	$.getScript( "assets/global/plugins/js.cookie.min.js", function() {});
//	$.getScript( "assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js", function() {});
//	$.getScript( "assets/global/plugins/jquery.blockui.min.js", function() {});
//	$.getScript( "assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js", function() {});
//	$.getScript( "assets/global/plugins/moment.min.js", function() {});
//	$.getScript( "assets/global/plugins/bootstrap-daterangepicker/daterangepicker.min.js", function() {});
//	$.getScript( "assets/global/plugins/morris/morris.min.js", function() {});
//	$.getScript( "assets/global/plugins/morris/raphael-min.js", function() {});
//	$.getScript( "assets/global/plugins/counterup/jquery.waypoints.min.js", function() {});
//	$.getScript( "assets/global/plugins/counterup/jquery.counterup.min.js", function() {});
//	$.getScript( "assets/global/plugins/amcharts/amcharts/amcharts.js", function() {});
//	$.getScript( "assets/global/plugins/amcharts/amcharts/serial.js", function() {});
//	$.getScript( "assets/global/plugins/amcharts/amcharts/pie.js", function() {});
//	$.getScript( "assets/global/plugins/amcharts/amcharts/radar.js", function() {});
//	$.getScript( "assets/global/plugins/amcharts/amcharts/themes/light.js", function() {});
//	$.getScript( "assets/global/plugins/amcharts/amcharts/themes/patterns.js", function() {});
//	$.getScript( "assets/global/plugins/amcharts/amcharts/themes/chalk.js", function() {});
//	$.getScript( "assets/global/plugins/amcharts/ammap/ammap.js", function() {});
//	$.getScript( "assets/global/plugins/amcharts/ammap/maps/js/worldLow.js", function() {});
//	$.getScript( "assets/global/plugins/amcharts/amstockcharts/amstock.js", function() {});
 //   $.getScript( "assets/global/plugins/fullcalendar/fullcalendar.min.js", function() {});
//	$.getScript( "assets/global/plugins/horizontal-timeline/horizontal-timeline.js", function() {});
//	$.getScript( "assets/global/plugins/flot/jquery.flot.min.js", function() {});
//	$.getScript( "assets/global/plugins/flot/jquery.flot.resize.min.js", function() {});
//	$.getScript( "assets/global/plugins/flot/jquery.flot.categories.min.js", function() {});
//	$.getScript( "assets/global/plugins/jquery-easypiechart/jquery.easypiechart.min.js", function() {});
//	$.getScript( "assets/global/plugins/jquery.sparkline.min.js", function() {});
//	$.getScript( "assets/global/plugins/jqvmap/jqvmap/jquery.vmap.js", function() {});
//	$.getScript( "assets/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.russia.js", function() {});
//	$.getScript( "assets/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.world.js", function() {});
//	$.getScript( "assets/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.europe.js", function() {});
//	$.getScript( "assets/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.germany.js", function() {});
//	$.getScript( "assets/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.usa.js", function() {});
//	$.getScript( "assets/global/plugins/jqvmap/jqvmap/data/jquery.vmap.sampledata.js", function() {});
	$.getScript( "assets/global/scripts/app.min.js", function() {});
//	$.getScript( "assets/pages/scripts/dashboard.min.js", function() {});
//	$.getScript( "assets/layouts/layout5/scripts/layout.min.js", function() {});
	//$.getScript( "assets/layouts/global/scripts/quick-sidebar.min.js", function() {});
//	$.getScript( "assets/layouts/global/scripts/quick-nav.min.js", function() {});
	
	
	$(window).scrollTop(0);

	
	
	
	
	
	

	
	}