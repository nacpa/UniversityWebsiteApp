import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Constant/Dmension.dart';

class Text_Name extends StatelessWidget {
  Text_Name(
      {Key? key,
      required this.Controller,
      required this.hint,
        this.Email=false,
        this.Password=false,
      this.ISdark = false})
      : super(key: key);
  TextEditingController Controller;
  String hint;
  bool ISdark;
  bool Email;
  bool Password;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: D.Hight100*0.7,
        width: D.Hight100 * 3,
        child: Center(
            child: TextFormField(cursorColor: Colors.orange,
          controller: Controller,
          decoration: InputDecoration(fillColor: Colors.grey.shade200,filled: true,
        focusedBorder:  OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.orange),borderRadius: BorderRadius.circular(D.Hight20)
        ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(D.Hight20),
              borderSide: const BorderSide(color: Colors.grey),
            ),

            hintText: hint,
            hintStyle: TextStyle(
                fontSize: D.Hight30/2,
                color: ISdark
                    ? Colors.black
                    : Get.isDarkMode
                        ? Colors.white
                        : Colors.black),
          ),
          keyboardType: TextInputType.text,
          style: TextStyle(
              color:Colors.black),
          validator: (val) {
              if(Password){
                if (val!.isEmpty || val.length < 6) {
                  return "Fill valid Password";
                } else {
                  return null;
                }
              }
              if(Email){
                if (!Controller.text.toLowerCase().contains("@gkv.ac.in")) {
                  return "Enter Valid Gurukul Email with gkv.ac.in ";
                } else {
                  return null;
                }
              }
                else {
                if (val!.isEmpty || val.length < 4) {
                  return "Fill valid details";
                } else {
                  return null;
                }
              }


          },
        )));
  }
}
