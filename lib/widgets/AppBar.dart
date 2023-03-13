import 'package:flutter/material.dart';

class MyAppbar extends AppBar {
  MyAppbar()
      : super(
          backgroundColor: Colors.white,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          title: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  "ROU",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "TINE",
                  style: TextStyle(color: Colors.red),
                )
              ],
            ),
          ),
        );
}
