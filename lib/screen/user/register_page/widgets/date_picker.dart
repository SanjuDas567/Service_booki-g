import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerDemo extends StatefulWidget {
  TextEditingController? controller;
  final String? hintText;

  DatePickerDemo({super.key, this.controller, this.hintText});
  @override
  _DatePickerDemoState createState() => _DatePickerDemoState();
}

class _DatePickerDemoState extends State<DatePickerDemo> {
  final controller = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime(2050),
    );
    if (picked != null)
      setState(() {
        // Format the date using intl package
        widget.controller!.text = DateFormat('dd-MM-yyyy').format(picked);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: widget.hintText,
          label: widget.controller!.text == null
              ? Text(
                  widget.hintText.toString(),
                )
              : Text(widget.controller!.text.toString()),
          hintStyle: const TextStyle(color: Colors.grey),
          labelStyle: const TextStyle(color: Colors.black54),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.black),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.grey),
          ),
        ),
        onTap: () {
          _selectDate(context);
        },
      ),
    );
  }
}

// class DateOfBirthField extends StatefulWidget {
//   TextEditingController? controller;
//   DateOfBirthField({super.key, this.controller});

//   @override
//   State<DateOfBirthField> createState() => _DateOfBirthFieldState();
// }

// class _DateOfBirthFieldState extends State<DateOfBirthField> {
//   TextEditingController dateinput = TextEditingController();
//   //text editing controller for text field

//   @override
//   void initState() {
//     dateinput.text = ""; //set the initial value of text field
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(15),
//       child: Center(
//         child: TextField(
//           controller: dateinput, //editing controller of this TextField
//           decoration: InputDecoration(
//               icon: Icon(Icons.calendar_today), //icon of text field
//               labelText: "Enter Date" //label text of field
//               ),
//           readOnly: true, //set it true, so that user will not able to edit text
//           onTap: () async {
//             DateTime? pickedDate = await showDatePicker(
//                 context: context,
//                 initialDate: DateTime.now(),
//                 firstDate: DateTime(
//                     1970), //DateTime.now() - not to allow to choose before today.
//                 lastDate: DateTime(2101));

//             if (pickedDate != null) {
//               print(
//                   pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
//               String formattedDate =
//                   DateFormat('yyyy-MM-dd').format(pickedDate);
//               print(
//                   formattedDate); //formatted date output using intl package =>  2021-03-16
//               //you can implement different kind of Date Format here according to your requirement

//               setState(() {
//                 dateinput.text =
//                     formattedDate; //set output date to TextField value.
//               });
//             } else {
//               print("Date is not selected");
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
