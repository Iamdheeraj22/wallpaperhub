import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget appName() {
  return Container(
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Wallpaper",
          style: TextStyle(color: Colors.black),
        ),
        Text(
          "Hub",
          style: TextStyle(color: Colors.blue),
        )
      ],
    ),
  );
}
//