import 'package:flutter/material.dart';

class MyTextFormFieldDecoration extends InputDecoration {
  MyTextFormFieldDecoration(
      {required String hintText,
      required IconData iconData,
      required Color focusedColor,
      required Color enabledColor})
      : super(
            isDense: true,
            prefixIcon: Icon(iconData),
            hintText: hintText,
            helperText: " ",
            // errorText: "Nae Nigga",
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.red, width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.red, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: focusedColor, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: enabledColor, width: 1),
            ));
}
