import 'package:flutter/material.dart';
import 'package:hoel_booking_app/Core/Network/Api/change_password.dart';
import 'package:hoel_booking_app/utils/AppColors.dart';
import '../utils/alertDialouge.dart';

class ChangePassowrd extends StatelessWidget {
  ChangePassowrd({Key? key}) : super(key: key);
  TextEditingController oldPass = TextEditingController();
  TextEditingController newPass = TextEditingController();
  TextEditingController reNewPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Password"),
        actions: [
          IconButton(onPressed: () {
            OpenDialouge.openDialouge(context);
          }, icon: Icon(Icons.filter_list)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Current Password",style: TextStyle(fontSize: 20,color: AppColor.yaleBlue),),
              SizedBox(height:size.height *.03 ,),
              TextField(
                controller: oldPass,
                decoration: InputDecoration(
                    hintText: "password",
                    labelText: "Current Password",
                    border: OutlineInputBorder(),
              ),),
              SizedBox(height:size.height *.03 ,),
              Text("New Password",style: TextStyle(fontSize: 20,color: AppColor.yaleBlue),),
              SizedBox(height:size.height *.03 ,),
              TextField(
                controller: newPass,
                decoration: InputDecoration(
                  hintText: "password",
                  labelText: "New Password",
                  border: OutlineInputBorder(),
                ),),
              SizedBox(height:size.height *.03 ,),
              Text("New Password Again",style: TextStyle(fontSize: 20,color: AppColor.yaleBlue),),
              SizedBox(height:size.height *.03 ,),
              TextField(
                controller: reNewPass,
                decoration: InputDecoration(
                  hintText: "password",
                  labelText: "Re Password",
                  border: OutlineInputBorder(),
                ),),
              SizedBox(height:size.height *.03 ,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(color: AppColor.naviBlue,onPressed: (){
                    changePassword(context);
                  },child: Text("Change Password",style: TextStyle(color: Colors.white),),),
                  MaterialButton(color: AppColor.naviBlue,onPressed: (){
                    Navigator.pop(context);
                  },child: Text("Cancel",style: TextStyle(color: Colors.white),),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void changePassword(var context){
     ChangePassword().changePasswordApi(context,oldPass.text , newPass.text, reNewPass.text);
  }

}
