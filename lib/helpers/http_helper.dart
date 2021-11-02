import 'dart:async';
import 'dart:convert';

import 'package:permission_handler/permission_handler.dart';

import 'package:intent/intent.dart' as android_intent;
import 'package:intent/action.dart' as android_action;

saveMoney(ammt) {
  // const number = "*165*3*2*2*0772053630*100*44440#";
  var number = "*165*3*611451*$ammt*1#";
  android_intent.Intent()
    ..setAction(android_action.Action.ACTION_CALL)
    ..setData(Uri(scheme: "tel", path: number))
    ..startActivity().catchError((e) => print(e));
  print(number);
}

deposit(ammount) async {
  var status = await Permission.phone.status;
  if (status.isGranted) {
    saveMoney(ammount);
  } else {
    Future<PermissionStatus> x = Permission.phone.request();
    x.then((value) => deposit(ammount));
  }
}



// makeAcall() async {
//   var status = await Permission.phone.status;
//   if (status.isGranted) {
//     call();
//   } else {
//     Future<PermissionStatus> x = Permission.phone.request();
//     x.then((value) => makeAcall());
//   }
// }
