class OrderPlaceData {
  int cartId;
  Map orderData;

  // String cartProductName;
  // int cartProductRate;
  // int cartActualRate;
  // String cartProductImagePath;
  // int cartQty;
  // int cartTotalAmount;
  int cartTotalMrp;
  int cartTotalDiscount;
  int deliveryFee;
  int totalBillAmount;
  DateTime orderDate;

  OrderPlaceData(
    this.cartId,
    this.orderData,
    // this.cartProductName,
    // this.cartProductRate,
    // this.cartActualRate,
    // this.cartProductImagePath,
    // this.cartQty,
    // this.cartTotalAmount,
    this.cartTotalMrp,
    this.cartTotalDiscount,
    this.deliveryFee,
    this.totalBillAmount,
    this.orderDate,
  );
}

Map<dynamic, dynamic> orderDetailsMap = {};
List orderDetailsList = [];
