import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String header;
  final double fontsize;
  final Color headerColor;
  final Color color;
  final Function onsave;
  final Function validator;
  final String hintText;

  const CustomTextFormField(
      {Key key,
      this.header,
      this.fontsize,
      this.headerColor,
      this.color,
      this.onsave,
      this.validator,
      this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Column(
        children: [
          CustomText(
            text: header,
            fontSize: fontsize,
            color: Colors.grey.shade900,
          ),
          TextFormField(
            onSaved: onsave,
            validator: validator,
            cursorColor: color,
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: color),
                ),
                hoverColor: color,
                focusColor: color,
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                fillColor: color),
          )
        ],
      ),
    );
  }
}
