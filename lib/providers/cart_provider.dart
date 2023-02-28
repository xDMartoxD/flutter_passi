import 'package:flutter/cupertino.dart';
import 'package:passi_app/models/ModelProvider.dart';

class CartProvider with ChangeNotifier {
  int _quantity = 0;
  TicketCategory ticketCategory;

  int get quantity {
    return _quantity;
  }

  CartProvider({required this.ticketCategory});

  void add() {
    if ((ticketCategory.maxBuyQuantity != null && ticketCategory.maxBuyQuantity! <= quantity) ||
        quantity >= 10) {
      return;
    }
    _quantity++;
    notifyListeners();
  }

  void remove() {
    if (quantity <= 0) {
      return;
    }
    _quantity--;
    notifyListeners();
  }
}
