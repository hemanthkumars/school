angular.module("app",['ui.router'])


.config(function($stateProvider, $urlRouterProvider) {

  // Ionic uses AngularUI Router which uses the concept of states
  // Learn more here: https://github.com/angular-ui/ui-router
  // Set up the various states which the app can be in.
  // Each state's controller can be found in controllers.js
  $stateProvider


    .state('login', {
      url: '/login',
      templateUrl: 'templates/login.html',
      resolve: {
          message: function(RefreshHandling){
              return ""; }
          }
    	  
    })
    
     .state('dashboard', {
      url: '/dashboard',
      templateUrl: 'templates/dashboard.html',
      resolve: {
          message: function(RefreshHandling){
              return ""; }
          }
    })
    
    .state('product', {
      url: '/product',
      templateUrl: 'templates/product.html',
      resolve: {
          message: function(RefreshHandling){
              return ""; }
          }
    })
    
    .state('sales', {
      url: '/sales',
      templateUrl: 'templates/sales.html',
      resolve: {
          message: function(RefreshHandling){
              return ""; }
          }
    })
    
     .state('classMasterDefinition', {
      url: '/classMasterDefinition',
      templateUrl: 'templates/classMasterDefinition.html',
      resolve: {
          message: function(RefreshHandling){
              return ""; }
          }
    })
    
    .state('schoolSetup', {
      url: '/schoolSetup',
      templateUrl: 'templates/schoolSetup.html',
      resolve: {
          message: function(RefreshHandling){
              return ""; }
          }
    })
    
    .state('academicYear', {
      url: '/academicYear',
      templateUrl: 'templates/academicYear.html',
      resolve: {
          message: function(RefreshHandling){
              return ""; }
          }
    })
    
    .state('subjectDefn', {
      url: '/subjectDefn',
      templateUrl: 'templates/subjectDefn.html',
      resolve: {
          message: function(RefreshHandling){
              return ""; }
          }
    })
    
    .state('hoildayCalendar', {
      url: '/hoildayCalendar',
      templateUrl: 'templates/holidayCalendar.html',
      resolve: {
          message: function(RefreshHandling){
              return ""; }
          }
    })
    
     .state('schoolSessionDefn', {
      url: '/schoolSessionDefn',
      templateUrl: 'templates/schoolSessionDefn.html',
      resolve: {
          message: function(RefreshHandling){
              return ""; }
          }
    })
    
     .state('manageClass', {
      url: '/manageClass',
      templateUrl: 'templates/manageClass.html',
      resolve: {
          message: function(RefreshHandling){
              return ""; }
          }
    })
    
    .state('studentMgmt', {
      url: '/studentMgmt',
      templateUrl: 'templates/studentMgmt.html',
      resolve: {
          message: function(RefreshHandling){
              return ""; }
          }
    })
    
     .state('promotion', {
      url: '/promotion',
      templateUrl: 'templates/promotion.html',
      resolve: {
          message: function(RefreshHandling){
              return ""; }
          }
    })
    
    .state('birthdayList', {
      url: '/birthdayList',
      templateUrl: 'templates/birthdayList.html',
      resolve: {
          message: function(RefreshHandling){
              return ""; }
          }
    })
    
     .state('promotionReport', {
      url: '/promotionReport',
      templateUrl: 'templates/promotionReport.html',
      resolve: {
          message: function(RefreshHandling){
              return ""; }
          }
    })
    
    
     .state('feeTypeMaster', {
      url: '/feeTypeMaster',
      templateUrl: 'templates/feeTypeMaster.html',
      resolve: {
          message: function(RefreshHandling){
              return ""; }
          }
    })
    
    .state('studentFeeDefinition', {
      url: '/studentFeeDefinition',
      templateUrl: 'templates/studentFeeDefinition.html',
      resolve: {
          message: function(RefreshHandling){
              return ""; }
          }
    })
    
    .state('feeCollect', {
      url: '/feeCollect',
      templateUrl: 'templates/feeCollect.html',
      resolve: {
          message: function(RefreshHandling){
              return ""; }
          }
    })
    
    .state('studentFeeDueList', {
      url: '/studentFeeDueList',
      templateUrl: 'templates/studentFeeDueList.html',
      resolve: {
          message: function(RefreshHandling){
              return ""; }
          }
    })
    
    .state('viewfeeCollection', {
      url: '/viewfeeCollection',
      templateUrl: 'templates/viewfeeCollection.html',
      resolve: {
          message: function(RefreshHandling){
              return ""; }
          }
    })
    
     .state('smsTemplate', {
      url: '/smsTemplate',
      templateUrl: 'templates/smsTemplate.html',
      resolve: {
          message: function(RefreshHandling){
              return ""; }
          }
    })
    
     .state('studentSms', {
      url: '/studentSms',
      templateUrl: 'templates/studentSms.html',
      resolve: {
          message: function(RefreshHandling){
              return ""; }
          }
    })
    
     .state('deliveryReport', {
      url: '/deliveryReport',
      templateUrl: 'templates/deliveryReport.html',
      resolve: {
          message: function(RefreshHandling){
              return ""; }
          }
    })
    
    .state('smsByMobileNo', {
      url: '/smsByMobileNo',
      templateUrl: 'templates/smsByMobileNo.html',
      resolve: {
          message: function(RefreshHandling){
              return ""; }
          }
    })
    
    .state('markAttendance', {
      url: '/markAttendance',
      templateUrl: 'templates/markAttendance.html',
      resolve: {
          message: function(RefreshHandling){
              return ""; }
          }
    })
    
     .state('markOnlyAbsentees', {
      url: '/markOnlyAbsentees',
      templateUrl: 'templates/markOnlyAbsentees.html',
      resolve: {
          message: function(RefreshHandling){
              return ""; }
          }
    })
    
     .state('leaveRegister', {
      url: '/leaveRegister',
      templateUrl: 'templates/leaveRegister.html',
      resolve: {
          message: function(RefreshHandling){
              return ""; }
          }
    })
    
    
    
    
    

  
$urlRouterProvider.otherwise('/login')

});
