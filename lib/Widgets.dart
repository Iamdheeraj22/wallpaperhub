import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_indicator/loading_indicator.dart';

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

void showProgressDialogBox(BuildContext context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            child: Container(
              padding: EdgeInsets.all(20),
              height: 100,
              width: 50,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: const LoadingIndicator(
                  indicatorType: Indicator.ballClipRotate,
                  colors: [
                    Colors.white,
                    Colors.black,
                    Colors.yellow,
                  ],
                  strokeWidth: 1,
                  pathBackgroundColor: Colors.black),
            ));
      });
}

void customToastMsg(String msg) {
  Fluttertoast.showToast(msg: msg, toastLength: Toast.LENGTH_SHORT);
}

Widget customBox({double height = 0.0, double width = 0.0}) {
  return SizedBox(
    height: height,
    width: width,
  );
}

double getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}
