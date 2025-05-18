class CartController {

  /// Holds details for a cart item: service name, number of people, and final cost.
  CartController({this.serviceName, this.numberOfPeople, this.finalCost});
  
  String? serviceName;
  String? numberOfPeople;
  String? finalCost;
}