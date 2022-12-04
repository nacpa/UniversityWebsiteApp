import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universitywebsiteapp/Screens/Auth/SignUp.dart';
import 'package:universitywebsiteapp/Widgets/CustomText.dart';

import '../../Constant/Dmension.dart';
import '../../Widgets/Custom_button.dart';
import '../../Widgets/TextFields.dart';

class login extends StatelessWidget {
  login({Key? key}) : super(key: key);
  TextEditingController _controller = TextEditingController();
  TextEditingController _controller_password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(width: double.maxFinite,
        child: SingleChildScrollView(physics: BouncingScrollPhysics(),
          child: Form(key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: D.Hight100,),
                Hero(tag: "gkv",
                  child: SizedBox(
                    height: D.Hight100*2,
                    width: D.Hight100*2.3 ,
                    child: Image.asset(
                      "assets/images/gkv_logo.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(height: D.Hight20,),
                Text_Name(Email: true,
                  Controller: _controller,
                  hint: 'Email',
                ),
                SizedBox(height: D.Hight10,),

                Text_Name(Password: true,
                  Controller: _controller_password,
                  hint: 'Password',
                ),
                SizedBox(height: D.Hight100/2,),
                Button(hight: D.Hight100/2, width: D.Hight100*1.5, txt: "Sign In", Tsize: D.Hight20, Bcolor: Colors.orange, Bordercolor: Colors.white, Tcolor: Colors.white, radii: D.Hight20, bold: false, ontap: (){
                  if (formKey
                      .currentState!
                      .validate()) {

                  }

                }),
                SizedBox(height: D.Hight20,),
                InkWell(onTap: (){Get.to(Signup());},
                    child: CustomText(txt: "Don't have account ? Signup", txtSize: D.Hight20, clr: Colors.blueGrey)),
                SizedBox(height: D.Hight20,),
                CustomText(txt: "Or login with  Student ID", txtSize: D.Hight20, clr: Colors.black),
                IconButton(
                  onPressed: () async {
                    // await Google_auth().signInWithGoogle();
                  },
                  iconSize: D.Hight30 * 2.5,
                  color: Colors.black,
                  icon: Icon(Icons.mail),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
