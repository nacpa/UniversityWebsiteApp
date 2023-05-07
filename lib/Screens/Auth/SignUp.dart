import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universitywebsiteapp/Widgets/CustomText.dart';

import '../../Constant/Dmension.dart';
import '../../Controllers/GoogleLogin.dart';
import '../../Controllers/Notification/Notification_controller.dart';
import '../../Widgets/Custom_button.dart';
import '../../Widgets/TextFields.dart';
import '../../Widgets/toast.dart';
import '../Splash.dart';
import 'Login.dart';

class Signup extends GetView<Notification_controller> {
  Signup({Key? key}) : super(key: key);
  TextEditingController _controller = TextEditingController();
  TextEditingController _controller_password = TextEditingController();
  TextEditingController _controller_Email = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    controller.initialize();
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.maxFinite,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: D.Hight100 / 1.5,
                  ),
                  Hero(
                    tag: "gkv",
                    child: SizedBox(
                      height: D.Hight100 * 2,
                      width: D.Hight100 * 2.3,
                      child: Image.asset(
                        "assets/images/gkv_logo.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: D.Hight10,
                  ),
                  Text_Name(
                    Controller: _controller,
                    hint: 'Name',
                  ),
                  SizedBox(
                    height: D.Hight10,
                  ),
                  Text_Name(
                    Email: true,
                    Controller: _controller_Email,
                    hint: 'Email',
                  ),
                  SizedBox(
                    height: D.Hight10,
                  ),
                  Text_Name(
                    Password: true,
                    Controller: _controller_password,
                    hint: 'Password',
                  ),
                  SizedBox(
                    height: D.Hight100 / 4,
                  ),
                  Button(
                      hight: D.Hight100 / 2,
                      width: D.Hight100 * 1.5,
                      txt: "Sign UP",
                      Tsize: D.Hight20,
                      Bcolor: Colors.orange,
                      Bordercolor: Colors.white,
                      Tcolor: Colors.white,
                      radii: D.Hight20,
                      bold: false,
                      ontap: () async {
                        if (formKey.currentState!.validate()) {

                       await   auth.createUserWithEmailAndPassword(email: _controller_Email.text, password: _controller_password.text).then((value) async {
                         auth.currentUser?.updateDisplayName(_controller.text);
                         controller.initialize();
                         controller.showNotification(tittle:_controller.text??UserName,body: "Sign Up Sucessfully");
                         await Get.off(login());
                         toast("Sign Up Sucessfully");


                       }).onError((error, stackTrace) {  toast(error.toString());});
                        }
                      }),
                  SizedBox(
                    height: D.Hight20,
                  ),
                  InkWell(
                      onTap: () {
                        Get.off(login());
                      },
                      child: CustomText(
                          txt: "Already have account ? SignIn",
                          txtSize: D.Hight20,
                          clr: Colors.blueGrey)),
                  SizedBox(
                    height: D.Hight20,
                  ),
                  CustomText(
                      txt: "Or Continue with  Student ID",
                      txtSize: D.Hight20,
                      clr: Colors.black),
                  IconButton(
                    onPressed: () async {
                      await Google_auth().signup(context);
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
      ),
    );
  }
}
