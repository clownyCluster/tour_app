import 'package:hive/hive.dart';
part 'cart_details.g.dart';

@HiveType(typeId: 0)
class CartDetails extends HiveObject {
  @HiveField(0)
  String? price;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? slug;

  @HiveField(3)
  int? quantity;

  @HiveField(4)
  late int? total;
  @HiveField(5)
  String? image ;

  CartDetails({
    this.name,
    this.price,
    this.quantity,
    this.slug,
    this.image
  }) {
    updateTotal(); // Initialize total when the CartDetails is created.
  }

  void updateQuantity(int newQuantity) {
    this.quantity = newQuantity;
    updateTotal(); // Update total after quantity is updated.
    this.save(); // Save the updated object to the Hive box
  }

  void updateTotal() {
    int priceInt = int.tryParse(price!) ?? 0;
    total = priceInt * quantity!;
  }
  
}