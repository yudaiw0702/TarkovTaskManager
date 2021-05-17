import 'package:flutter/material.dart';

/// アイテム獲得の個数を管理するプロバイダー
class CounterModel extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count = _count + 1;

    notifyListeners();
  }
}