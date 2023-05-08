import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import '../Constant/Dmension.dart';
import '../Controllers/Notification/Notification_controller.dart';
import '../Widgets/toast.dart';
import 'Splash.dart';
import 'package:get/get_connect.dart';

class AdminPanel extends StatelessWidget {
   AdminPanel({Key? key}) : super(key: key);

   final FirebaseMessaging _messaging = FirebaseMessaging.instance;


var _controller=Get.isRegistered<Notification_controller>()?Get.find<Notification_controller>():Get.put(Notification_controller());


  Future<void> sendData()async {
    _messaging.sendMessage();
    _messaging.getToken().then((value) async {
      print(value.toString());

      var data ={
        'to' :value,
        'priority' : 'high',
        'notification':
        {
          'title' : 'NAchiketa',
          'body' : 'Hello There'
        },
        'data' :
        {
          'type' : 'msj',
          'id' : 'asif1245'
        }
      };

     var res= await http.post(Uri. parse ('https://fcm.googleapis.com/fcm/send'),
          body: jsonEncode(data),
          headers: {
            'Content-Type':'application/json; charset=UTF-8',
            'Authorization':"key=AAAAnyS_shE:APA91bEmu_qd5WlSG9jlt9wR0wjMD3uOXUoS61fa_Oz0NaDzLim8c4sOJZOX68MvUtwER7IyHKiopRAxFxSmhYl38tlrcAJHlXuQL5OzuePLMAkYQmJMY40XXXs6ZmijgwnOt3U-cgK0"

          });

     print(res.toString());
    });


  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(appBar:buildAppBar(context) ,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: D.Hight100/1.5,),
              Center(
                  child: CircleAvatar(
                      backgroundColor: CupertinoColors.activeOrange,
                      radius: D.Hight30 * 2,
                      child: Icon(
                        Icons.person,
                        size: D.Hight30 * 3,
                        color: CupertinoColors.white,
                      ))),
              SizedBox(height: D.Hight100/2,),
              buildTextField("Notification Title",_controller.controller_title),
              buildTextField("Message",_controller.controller_body),

              SizedBox(height: D.Hight30,),
              Obx(() => InkWell(onTap: () async {

                if(_controller.controller_title.text.isNotEmpty && _controller.controller_body.text.isNotEmpty){
                  _controller.pushNotification(_controller.controller_title.text, _controller.controller_body.text);
                }else{
                  toast("TextField can't be Empty");
                }

              },
                child: Container(height: 70,width: 70,
                  child:_controller.isLoading.isTrue?CircularProgressIndicator(color: CupertinoColors.black,):Icon(Icons.arrow_forward_ios,color: CupertinoColors.white,),decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.orange),),
              ))

            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String hint , TextEditingController controller) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: D.Hight10,horizontal: D.Hight30),
      child: TextField(

                keyboardType: TextInputType.text,
                controller: controller,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                maxLines: null,

                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 15.0, left: 10),
                  hintStyle: TextStyle(
                    fontSize: 12,
                    color:Colors.orange,
                  ),
                  hintMaxLines: 1,
                  hintText: hint,
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color:Colors.orange,
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.orange,
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orange,
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                  ),
                )),
    );
  }


   AppBar buildAppBar(BuildContext context) {
     return AppBar(
       backgroundColor: CupertinoColors.white,
       centerTitle: true,
       leading: buildIconButton(context),
       title: Text(
         "Admin Panel",
         style: TextStyle(color: Colors.orange),
       ),
     );
   }

   IconButton buildIconButton(BuildContext context) {
     return IconButton(
       onPressed: () {
         Navigator.pop(context);
       },
       icon: Icon(
         Icons.arrow_back,
         color: Colors.orange,
       ),
     );
   }
}
