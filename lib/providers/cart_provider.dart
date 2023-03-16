import 'package:flutter/cupertino.dart';
import 'package:passi_app/models/ModelProvider.dart';
import 'package:passi_app/providers/ticket_cateogories_by_event_provider.dart';

class CartProvider with ChangeNotifier {
  final TicketCategoriesByEventProvider? ticketCategoriesByEventProvider;
  final Map<String, int> _cart = {};
  Map<String, int> get cart => _cart;
  CartProvider({this.ticketCategoriesByEventProvider}) {
    if (ticketCategoriesByEventProvider != null) {
      for (var ticketCategory in ticketCategoriesByEventProvider!.ticketCategories) {
        _cart[ticketCategory.id] = 0;
      }
    }
  }

  int get currentTicketsInCartQuantity {
    int current = 0;
    for (var quantity in _cart.values) {
      current += quantity;
    }
    return current;
  }

  void add(String ticketCategoryId) {
    final ticketCategory = ticketCategoriesByEventProvider?.getTicketCategoryById(ticketCategoryId);
    if (_cart[ticketCategoryId] == null || currentTicketsInCartQuantity >= 10) {
      return;
    }

    _cart[ticketCategoryId] = _cart[ticketCategoryId]! + 1;

    notifyListeners();
  }

  void remove(String ticketCategoryId) {
    if (_cart[ticketCategoryId] == null || _cart[ticketCategoryId]! <= 0) {
      return;
    }

    _cart[ticketCategoryId] = _cart[ticketCategoryId]! - 1;

    notifyListeners();
  }

  double get total {
    double total = 0;
    if (ticketCategoriesByEventProvider != null) {
      for (var ticketCategory in ticketCategoriesByEventProvider!.ticketCategories) {
        total += cart[ticketCategory.id]! * ticketCategory.price;
      }
    }
    return total;
  }

  bool get hasTickets {
    bool has = false;
    for (var element in _cart.values) {
      if (element > 0) {
        has = true;
        break;
      }
    }
    return has;
  }
}
