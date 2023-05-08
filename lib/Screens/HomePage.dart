import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universitywebsiteapp/Screens/adminPanel.dart';
import 'package:universitywebsiteapp/Screens/profile.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../Constant/Dmension.dart';
import '../Controllers/Notification/Notification_controller.dart';
import '../Widgets/toast.dart';
import 'Auth/Login.dart';
import 'Splash.dart';
import 'UrlLauncher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
      print(index);
    }

    final List<Widget> _widgetOptions = <Widget>[
      Container(color: CupertinoColors.white,
        child: UrLauntcher(
          url: 'https://www.gkv.ac.in/',
        ),
      ),
      Container(color: CupertinoColors.white,
        child: UrLauntcher_(
          url: 'https://www.gkv.ac.in/admissions',
        ),
      ),
      UrLauntcher_2(
        url: 'https://www.gkv.ac.in/important_bodies/placement-cell/',
      ),
      UrLauntcher_3(
        url: 'https://www.gkv.ac.in/student-corner/',
      ),
    ];

    return Scaffold(
      floatingActionButton: FloatingActionButton(

        backgroundColor: Colors.orange,
        onPressed: () { print("Nachiketa11"); },
        child:  PopupMenuButton(
          onSelected: (value) {


            // your logic
          },
          itemBuilder: (BuildContext bc) {
            return  [

              PopupMenuItem(onTap: (){
                Future.delayed(Duration.zero).then((value) => Get.to(AdminPanel()));
              },
                child: Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Icon(Icons.verified_user,color: Colors.green,),
                    SizedBox(width: D.Hight20,),
                    Text("Admin Panel"),
                  ],
                ),
                value: '/about',
              ),
              PopupMenuItem(onTap: (){
                Future.delayed(Duration.zero).then((value) => Get.to(Profile()));},
                child: Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Icon(Icons.person,color: Colors.red,),
                    SizedBox(width: D.Hight20,),
                    Text("Profile"),
                  ],
                ),
                value: '/about',
              ),
              PopupMenuItem(onTap: (){
                Future.delayed(Duration.zero).then((value) => buildShowCupertinoDialog(context));
                 },
                child: Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Icon(Icons.verified_user,color: Colors.red,),
                    SizedBox(width: D.Hight20,),
                    Text("Logout"),
                  ],
                ),
                value: '/about',
              ),

            ];
          },
        ),
      ),
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        height: D.Hight30 * 2.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(D.Hight30),
              topLeft: Radius.circular(D.Hight30)),
          boxShadow: const [
            BoxShadow(spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(D.Hight30),
              topLeft: Radius.circular(D.Hight30)),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            iconSize: D.Hight20,
            unselectedItemColor: Colors.grey,
            selectedIconTheme:
                IconThemeData(color: Colors.orange, size: D.Hight20 * 1.5),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: 'Notifications',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.group),
                label: 'Placements',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.boy),
                label: 'Student',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }

  buildShowCupertinoDialog(BuildContext context) async {
    showCupertinoDialog(
                context: context,
                builder: (BuildContext context) => CupertinoAlertDialog(
                  content: const Text(
                      'Are you sure to logout ? '),
                  actions: <CupertinoDialogAction>[
                    CupertinoDialogAction(
                      isDefaultAction: true,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('No'),
                    ),
                    CupertinoDialogAction(
                      isDestructiveAction: true,
                      onPressed: () async {
                        await auth
                            .signOut()
                            .then((value){
                          toast("Logout Sucessfully");
                          Future.delayed(const Duration(seconds: 3)).then((value) => Get.find<Notification_controller>().showNotification(
                              tittle: " Hello${auth.currentUser}",
                              body: "Your Grukul Account Sucessfully Logout") );

                          Get.offAll(login()); });

                      },
                      child: const Text('Yes'),
                    ),
                  ],
                ));
  }


}


