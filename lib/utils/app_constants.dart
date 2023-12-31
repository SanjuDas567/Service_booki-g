class AppConstants {
  // paypal constants :---------------------------------------------------------
  static const String Client_ID =
      'AcCjTwuC1Z_GPEsatEn0DPzZg-P2yfiIoa9VIW51m6iWWv5CSMtUWiXFP7nJDwhqRrwmx23Q8qZBv8K7';
  static const String Secret_KEY =
      'EJ3OGhH4uIXQRiUerBwsD_16WtC_0AupINQHz7Yl4OPreim235u7oyI0nIoDeDPaaRIefig_h_KfKHe3';
  // paypal constants :---------------------------------------------------------

  // user section :-------------------------------------------------------------

  static const String APP_NAME = 'Glossy Flossy';
  static const String TOKEN = 'token';
  static const String BASE_URL = 'http://143.198.103.241:5000/';
  static const String REGISTER_URL = 'api/user/Registration';
  static const String LOGIN_URI = 'api/userlogin/loginpassword';
  static const String SERVICE_TYPE_URI = 'api/getservicetype/gettype';
  static const String USER_NAME = 'Name';
  static const String USER_ID = '0';
  static const String USER_TYPE = '';
  static const String SERVICE_NAME_URI = 'api/getservicetype/servicename/';
  static const String SERVICE_BOOKING_URI = 'api/service/booking';
  static const String USER_PROFILE_DATA = 'api/userlogin/detl/';
  static const String USER_EDIT_PROFILE_URI = 'api/user/updation';
  static const String USER_SERVICE_HISTORY_URI = 'api/servReg/select/';
  static const String USER_SECTION_SEND_OTP_URI = 'api/otp/sendOTP';
  static const String USER_SECTION_VERIFY_OTP_URI = 'api/otp/verifyOTP';

  //worker section :------------------------------------------------------------
  static const String WORKER_REGISTRATION_URI = 'api/employee/empInsert';
  static const String WORKER_LOGIN_URI = 'api/employee/empLogin';
  static const String WORKER_PROFILE_DETAILS_URI = 'api/employee/getempdetl/';
  static const String WORKER_SERVICE_HISTORY_URI = 'api/jobmangmt/workerhistory/';
  static const String WORKER_PROFILE_UPDATION_URI = 'api/employee/update';

//   Admin section :------------------------------------------------------------
  static const String ADMIN_LOGIN_URI = 'api/admin/adminlogin';
}
