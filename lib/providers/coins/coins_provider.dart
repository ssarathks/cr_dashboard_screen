import 'package:ass_cr_dashboard/models/coin.dart';
import 'package:flutter/material.dart';

class CoinsProvider with ChangeNotifier {
  List<Coin> _coins = [];

  List<Coin> get coins => _coins;

  void setCoins(List<Coin> coins) {
    _coins = coins;
    notifyListeners();
  }
}
