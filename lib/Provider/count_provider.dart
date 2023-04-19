import 'package:flutter/widgets.dart';

class CountProvider with ChangeNotifier{
  int _Count=0;
  int get Count => _Count;

  void setCount(){
    _Count++;
    notifyListeners();
  }

}