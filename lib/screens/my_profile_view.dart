import 'package:flutter/material.dart';
import 'package:hoel_booking_app/Core/Network/Api/profile_response.dart';
import 'package:hoel_booking_app/Model/profile_response.dart';
import 'package:hoel_booking_app/utils/AppColors.dart';

import '../utils/alertDialouge.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  //variable part
   GetProfileResponse? res;
   TextEditingController buisnessName = TextEditingController();
   TextEditingController emailController = TextEditingController();
   TextEditingController firstName = TextEditingController();
   TextEditingController lastName = TextEditingController();
   TextEditingController phoneNumber = TextEditingController();
   TextEditingController birthDate = TextEditingController();


  @override
  void initState() {
    super.initState();
    getProfileData();
  }
  //code part
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("MY Profile"),
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
              Text("Personal Information",style: TextStyle(color: AppColor.yaleBlue,fontSize: 20),),
              SizedBox(height: size.height*0.02,),
              Text("Buisness Name "),
              SizedBox(height: size.height*0.03,),
              TextField(
                controller: buisnessName,
                decoration: InputDecoration(
                    hintText: "Hotel Buisness",
                    labelText: "Buisness Name",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.man)),
              ),
              SizedBox(height: size.height*0.02,),
              Text("E-Mail"),
              SizedBox(height: size.height*0.03,),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                    hintText: "monirhossain@gmail.com",
                    labelText: "E-mail",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email)),
              ),              SizedBox(height: size.height*0.02,),
              Text("First Name"),
              SizedBox(height: size.height*0.03,),
              TextField(
                controller: firstName,
                decoration: InputDecoration(
                    hintText: "monir",
                    labelText: "First Name",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.man)),
              ),
              SizedBox(height: size.height*0.02,),
              Text("last Name"),
              SizedBox(height: size.height*0.03,),
              TextField(
                controller: lastName,
                decoration: InputDecoration(
                    hintText: "Hossain",
                    labelText: "Last Name",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.man)),
              ),
              SizedBox(height: size.height*0.02,),
              Text("Phone"),
              SizedBox(height: size.height*0.03,),
              TextField(
                controller: phoneNumber,
                decoration: InputDecoration(
                    hintText: "01681690327",
                    labelText: "Phone",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone)),
              ),
              SizedBox(height: size.height*0.02,),
              Text("Bith Date"),
              SizedBox(height: size.height*0.03,),
              TextField(
                controller: birthDate,
                decoration: InputDecoration(
                    hintText: "14/12/2020",
                    labelText: "Birthdate",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.calendar_month)),
              ),
              SizedBox(height: size.height*0.02,),
             // Text("Avater"),
              SizedBox(height: size.height*0.02,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: () {
                      buisnessName.clear();
                      emailController.clear();
                      firstName.clear();
                      lastName.clear();
                      phoneNumber.clear();
                      birthDate.clear();
                    },
                    child: Text("Reset",style: TextStyle(color: Colors.white),),
                    color: AppColor.naviBlue,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  MaterialButton(
                    onPressed: () {
                      postProfileData();
                    },
                    child: Text("Submit",style: TextStyle(color: Colors.white),),
                    color: AppColor.naviBlue,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getProfileData() async{
    var data =await ApiProfileData().getProfile();
    setState(() {
      res = data! as GetProfileResponse;
      emailController.text = res!.data!.email!;
      firstName.text = res!.data!.firstName!;
      lastName.text = res!.data!.lastName!;
      phoneNumber.text = res!.data!.phone!;
      birthDate.text = res!.data!.birthday!;
      buisnessName.text = res!.data!.businessName!;
    });
  }

  void postProfileData(){

  }

}
