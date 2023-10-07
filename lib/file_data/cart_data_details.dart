class CartDataDetails {
  int cartId; //Cart Id
  String cartProductName; //Cart Product Name
  int cartProductRate; //Cart Product rate
  int cartActualRate; //Cart Product Actual rate
  String cartProductImagePath; //Cart Product Image Path
  int cartQty; //Cart Product qty
  int cartTotalAmount; //Cart Product amount

  CartDataDetails(
      this.cartId,
      this.cartProductName,
      this.cartProductRate,
      this.cartActualRate,
      this.cartProductImagePath,
      this.cartQty,
      this.cartTotalAmount);
}

Map<dynamic, dynamic> cartDetailsMap = {};
List cartDataDetails = [];
