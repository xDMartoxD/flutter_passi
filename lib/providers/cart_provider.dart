import 'package:flutter/cupertino.dart';
import 'package:passi_app/models/ModelProvider.dart';

class CartProvider with ChangeNotifier {
  int _quantity = 0;
  TicketCategory ticketCategory;

  int get quantity {
    return _quantity;
  }

  CartProvider({required this.ticketCategory});

  void add() {}

  void remove() {}
}
