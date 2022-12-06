import 'package:get/get.dart';

import '../Controllers/Notification/Notification_controller.dart';

Future<void> init ()async{

  Get.lazyPut(() => Notification_controller(),fenix: true);
 

}
