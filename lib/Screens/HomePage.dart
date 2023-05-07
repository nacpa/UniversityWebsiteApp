import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      UrLauntcher(
        url: 'https://www.gkv.ac.in/',
      ),
      UrLauntcher_(
        url: 'https://www.gkv.ac.in/admissions',
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
        onPressed: () {
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
        },
        backgroundColor: Colors.orange,
        child: Icon(Icons.logout),
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
}
