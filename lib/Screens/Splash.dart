import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:universitywebsiteapp/Dependencies/Dependencies.dart';
import 'package:universitywebsiteapp/Screens/HomePage.dart';

import '../Constant/Dmension.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'Auth/Login.dart';

final auth=FirebaseAuth.instance;

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  var subscription;
  bool isDeviceConnected = false;
  bool isAlertSet = false;
  late Animation<double> animation;
  late AnimationController controller;
  String? UserId;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
    getConnectivity();
    controller =
    AnimationController(vsync: this, duration: const Duration(seconds: 5))
      ..forward().whenComplete(() {

      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if(user==null){
          Get.off(Get.off(login()));

        }else{
          Get.off(HomePage());
        }
      });



      });
    animation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);
    getConnectivity();
   

  }

  getConnectivity() {
    subscription = Connectivity().onConnectivityChanged.listen(
          (ConnectivityResult result) async {


        isDeviceConnected = await InternetConnectionChecker().hasConnection;

        if (!isDeviceConnected && isAlertSet == false) {
          showDialogBox();
          setState(() => isAlertSet = true);
        }
      },
    );
  }



  @override
  void dispose() {
    subscription.cancel();
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Opacity(opacity: 0.05,
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/images/gkv_logo.png"),
                      fit: BoxFit.contain
                  )),
              foregroundDecoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors:
                  [
                    Colors.white,
                    Colors.white,
                  ],
                ),
              ),
              // child:
              // Image(image: AssetImage("assets/images/motorbike-rider-with-helmet-browsing-mobile-phone1.png"),fit: BoxFit.fill,)
            ),
          ),
          Center(
            child: ScaleTransition(
              scale: animation,
              child: Hero(tag: "gkv",
                child: Container(
                  height: D.Hight / 4.5,
                  width: D.Hight / 4,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/images/gkv_logo.png",
                          ),
                          fit: BoxFit.fill)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  showDialogBox() => showCupertinoDialog<String>(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: const Text('No Connection'),
      content: const Text(
          'Please check your internet connectivity \n Riding Moto Required Internet Connection'),
      actions: <Widget>[
        TextButton(
          onPressed: () async {
            Navigator.pop(context, 'Cancel');
            setState(() => isAlertSet = false);
            isDeviceConnected =
            await InternetConnectionChecker().hasConnection;
            if (!isDeviceConnected && isAlertSet == false) {
              showDialogBox();
              setState(() => isAlertSet = true);
            }
          },
          child: const Text('OK'),
        ),
      ],
    ),
  );
}

