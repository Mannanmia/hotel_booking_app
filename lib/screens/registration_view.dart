import 'package:flutter/material.dart';
import 'package:hoel_booking_app/Core/Network/Api/apiRegistration.dart';
import 'package:hoel_booking_app/screens/LoginView.dart';
import 'package:hoel_booking_app/utils/toast_utils.dart';
import '../utils/app_values.dart';

class RegistrationView extends StatefulWidget {

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  //Variable Part...
  var registerApi = ApiRegistration();
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  TextEditingController first_name_controller = TextEditingController();
  TextEditingController last_name_controller = TextEditingController();
  TextEditingController phone_controller = TextEditingController();
  bool term = false;

 //Code Part......
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registration",style: TextStyle(fontSize: 18),),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Image.asset('images/app-logo.png', height: AppValues.height_80),
                  const SizedBox(height: AppValues.height_50),
                  const Text(
                    'Registration',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: AppValues.size_30,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              SizedBox(height: 8,),
              TextField(
                controller: first_name_controller,
                decoration: InputDecoration(
                    hintText: "Enter Your First Name",
                    labelText: "First Name",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.man)),
              ),
              SizedBox(height: 8,),
              TextField(
                controller: last_name_controller,
                decoration: InputDecoration(
                    hintText: "Last Name",
                    labelText: "Last Name",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.man)),
              ),
              SizedBox(height: 8,),
              TextField(
                controller: email_controller,
                decoration: InputDecoration(
                    hintText: "Email Address",
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email)),
              ),
              SizedBox(height: 8,),
              TextField(
                controller: password_controller,
                decoration: InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.vpn_key)),
              ),
              SizedBox(height: 8,),
              TextField(
                controller: phone_controller,
                decoration: InputDecoration(
                    hintText: "Phone Number",
                    labelText: "Phone Number",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone)),
              ),
              SizedBox(height: 8,),
              FittedBox(
                child: Row(
                  children: [
                    Checkbox(value: term , onChanged: (value){
                      setState((){
                        term = value!;
                      });
                    }),
                    Text("I have read and accept the Terms and Privacy Policy"),
                  ],
                ),
              ),
              SizedBox(height: 8,),
              MaterialButton(onPressed: (){
                cheackValidation(context,
                  email_controller.text,password_controller.text,first_name_controller.text,last_name_controller.text,phone_controller.text
                );
              },
                child: Text(
                  "Sign Up",
                  style: const TextStyle(color: Colors.white),
                ),
                color: Colors.red,
              ),
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Allready have an account?"),
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => LoginPage()));
                    },
                    child: Text(
                      " Login",
                      style: TextStyle(color: Colors.blue,fontSize: 18),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  cheackValidation(var context,String email,String password,String first_name,String last_name,String phone_number){
    int termvalue = 0;
    if(term == true){
      termvalue = 1;
    }else{
      termvalue=0;
    }
    if(email.isEmpty || password.isEmpty || first_name.isEmpty || last_name.isEmpty || phone_number.isEmpty){
      ToastUtil.showLongToast("All Fields are required.....");
    }else if(password.length < 6){
      ToastUtil.showLongToast("Password More than 6");
    }else{
        registerApi.registerUser(context, email, password, first_name, last_name, termvalue.toString(),phone_number);
    }
  }
}

