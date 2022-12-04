import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomText extends StatelessWidget {
  CustomText(
     {
    required this.txt,
    required this.txtSize,
     required this.clr,
     this.bold=false,
       this.FontFamily="Roboto",
       this.lineShrink=false
  });
  String txt;
  double txtSize;
  Color clr=Get.theme.primaryColor;
  bool bold=false;
  String FontFamily;
  bool lineShrink=false;

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(
          color: clr,
          fontSize: txtSize,
          fontWeight: bold ? FontWeight.w600 : FontWeight.w400,
          fontFamily: FontFamily),
      overflow: TextOverflow.ellipsis,
      maxLines: lineShrink?1:5,
    );
  }
}
