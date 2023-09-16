import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showCustomModalDialog(
   {
   required BuildContext context,
  required String title,
  required String content,
  Function()? cancelOnPressed,
  Function()? submitOnPressed,
  required String cancelButtonText,
  required String submitButtonText,
}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black54,
    transitionDuration: Duration(milliseconds: 300),
    pageBuilder: (context, anim1, anim2) => CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          onPressed: submitOnPressed,
          child: Text(submitButtonText),
        ),
        TextButton(
          onPressed: cancelOnPressed,
          child: Text(cancelButtonText),
        ),
      ],
    ),
    transitionBuilder: (context, anim1, anim2, child) => SlideTransition(
      transformHitTests: false,
      position: Tween<Offset>(
        begin: const Offset(0.0, -1.0),
        end: Offset.zero,
      ).chain(CurveTween(curve: Curves.linear)).animate(anim1),
      child: child,
    ),
  );
}
