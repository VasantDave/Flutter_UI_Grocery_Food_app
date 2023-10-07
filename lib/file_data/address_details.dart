class AddressDetails {
  int? addId;
  String? houseNo;
  String? floorNo;
  String? towerNo;
  String? buildingName;
  String? landMark;
  String? cityName;
  String? stateName;
  String? pinCode;
  String? saveAs;

  AddressDetails(
      this.addId,
      this.houseNo,
      this.floorNo,
      this.towerNo,
      this.buildingName,
      this.landMark,
      this.cityName,
      this.stateName,
      this.pinCode,
      this.saveAs);
}

Map<String, dynamic> addressDetailsMap = {};
