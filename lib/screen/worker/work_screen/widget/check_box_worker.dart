import 'package:flutter/material.dart';
import 'package:glossy_flossy/provider/worker/check_box_worker_provider.dart';
import 'package:provider/provider.dart';

class CheckboxItem {
  bool isChecked;
  String title;

  CheckboxItem({required this.isChecked, required this.title});
}

class CheckboxList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final checkboxListProvider =
        Provider.of<CheckboxListProvider>(context, listen: false);

    return ListView.builder(
      itemCount: checkboxListProvider.items.length,
      itemBuilder: (BuildContext context, int index) {
        return CheckboxListTile(
          value: checkboxListProvider.items[index].isChecked,
          onChanged: (bool? value) {
            checkboxListProvider.toggleCheckbox(index);
          },
          title: Text(checkboxListProvider.items[index].title),
        );
      },
    );
  }
}
