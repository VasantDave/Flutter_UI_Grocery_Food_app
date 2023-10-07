class ClientDetails {
  //firstname,lastname,email id,password,confirm password,status
  int id;
  String firstName;
  String lastName;
  String emailId;
  String mobileNumber;
  String password;
  String confirmPassword;
  bool status;
  Map? addressDetails;

  ClientDetails({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.emailId,
    required this.mobileNumber,
    required this.password,
    required this.confirmPassword,
    required this.status,
    this.addressDetails,
  });
}

var clientDetailsMap = {};
List clientDetailsList = [];
