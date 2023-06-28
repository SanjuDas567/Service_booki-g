import 'package:flutter/material.dart';
import 'package:glossy_flossy/screen/worker/work_screen/widget/check_box_worker.dart';

class CheckboxListProvider extends ChangeNotifier {
  List<CheckboxItem> items = [
    CheckboxItem(isChecked: false, title: 'Item 1'),
    CheckboxItem(isChecked: true, title: 'Item 2'),
    CheckboxItem(isChecked: false, title: 'Item 3'),
    CheckboxItem(isChecked: true, title: 'Item 4'),
    CheckboxItem(isChecked: false, title: 'Item 5'),
    CheckboxItem(isChecked: true, title: 'Item 6'),
  ];

  void toggleCheckbox(int index) {
    items[index].isChecked = !items[index].isChecked;
    notifyListeners();
  }
}