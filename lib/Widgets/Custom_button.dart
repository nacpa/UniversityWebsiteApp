import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button(
      {Key? key,
        required this.hight,
        required this.width,
        required this.txt,
        required this.Tsize,
        required this.Bcolor,
        required this.Bordercolor,
        required this.Tcolor,
        required this.radii,
        required this.bold,
        required this.ontap})
      : super(key: key);
  double hight;
  double width;
  Color Bcolor;
  Color Tcolor;
  Color Bordercolor;
  String txt;
  double radii;
  double Tsize;

  bool bold = false;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          height: hight,
          width: width,
          decoration: BoxDecoration(
            border: Border.all(color: Bordercolor, width: 2),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(-2, 2),
                  color: Colors.black26,
                  blurRadius: 2,
                  spreadRadius: -1)
            ],
            borderRadius: BorderRadius.circular(radii),
            color: Bcolor,
          ),
          child: Center(
            child: Text(
              txt,
              style: TextStyle(
                  color: Tcolor,
                  fontSize: Tsize,
                  fontWeight: !bold ? FontWeight.bold : FontWeight.w500),
            ),
          )),
    );
  }
}