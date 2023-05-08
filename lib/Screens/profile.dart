import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constant/Dmension.dart';
import 'Splash.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
      appBar: buildAppBar(context),
    );
  }

  Container body() {
    return Container(margin: EdgeInsets.symmetric(vertical: 30,horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: CircleAvatar(
                  backgroundColor: CupertinoColors.activeOrange,
                  radius: D.Hight30 * 2,
                  child: Icon(
                    Icons.person,
                    size: D.Hight30 * 3,
                    color: CupertinoColors.white,
                  ))),
          SizedBox(height: 20,),
          Card( shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            elevation: 2,
            margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),child:Container(width: double.maxFinite,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      txtrow("Name: ", auth.currentUser?.displayName??"User"),
                      txtrow("Email: ", auth.currentUser?.email??"Email"),
                      txtrow("Mobile No: ", auth.currentUser?.phoneNumber??"----"),
                      txtrow('University: '," Grukul Kangri Viswavidyalaya"),
                    ],
                  ),
                )),)
        ],
      ),
    );
  }

  Row txtrow(String title,String txt ) {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(title,style:
                        TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: D.Hight20/1.1),),
                      ),
                      Text(txt,style:
                      TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontSize: D.Hight20/1.3),),

                    ],
                  );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: CupertinoColors.white,
      centerTitle: true,
      leading: buildIconButton(context),
      title: Text(
        "Profile",
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
