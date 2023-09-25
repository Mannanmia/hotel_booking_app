import 'package:flutter/material.dart';

import '../Core/Network/Api/apiLogout.dart';

class OpenDialouge {
 static Future openDialouge(BuildContext context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("LogOut"),
        content: Text("Are You Sure ??"),
        actions: [
          TextButton(onPressed: () {
            Navigator.pop(context);
          }, child: Text("No")),
          TextButton(onPressed: () {
            ApiLogout().apiLogout(context);
          }, child: Text("Yes")),
        ],
      ));

}