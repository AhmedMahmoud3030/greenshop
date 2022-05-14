import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final CustomText child;
  final Function onpressed;

  const CustomButton({Key key, this.color, this.child, this.onpressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.all(10),
        onPressed: onpressed,
        color: color,
        child: Padding(padding: const EdgeInsets.all(4.0), child: child));
  }
}
