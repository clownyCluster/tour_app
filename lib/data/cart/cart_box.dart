import 'package:hive/hive.dart';


import 'cart_details.dart';

class CartBoxes {
  static Box<CartDetails> getData() => Hive.box<CartDetails>('cart');
}