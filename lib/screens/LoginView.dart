import 'package:flutter/material.dart';
import 'package:hoel_booking_app/Core/Network/Api/ApiLogin.dart';
import 'package:hoel_booking_app/screens/registration_view.dart';
import 'package:hoel_booking_app/utils/toast_utils.dart';
import '../utils/app_values.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Variable part
  var loginApi = ApiLogin();
  TextEditingController email_controller = TextEditingController();
  TextEditingController pass_controller = TextEditingController();
  bool password_visibility = true;
  bool remember_me = false;


  // Code Here
  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: AppValues.smallPadding),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Image.asset('images/app-logo.png',
                          height: AppValues.height_80),
                      SizedBox(height: AppValues.height_50),
                      Text(
                        'Log In',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: AppValues.size_30,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller: email_controller,
                    decoration: InputDecoration(
                        hintText: "Email Address",
                        labelText: "Email",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller: pass_controller,
                    decoration: InputDecoration(
                        hintText: "Password",
                        labelText: "Password",
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: password_visibility
                              ? const Icon(Icons.visibility_off,
                                  color: Colors.grey)
                              : const Icon(Icons.visibility,
                                  color: Colors.grey),
                          onPressed: () {
                            setState(() {
                              if (password_visibility) {
                                password_visibility = false;
                              } else {
                                password_visibility = true;
                              }
                            });
                          },
                        ),
                        prefixIcon: Icon(Icons.vpn_key)),
                    obscureText: password_visibility,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(value: remember_me , onChanged: (value){
                            setState((){
                              remember_me = value!;
                            });
                          }),
                          Text("Remenber Me"),
                        ],
                      ),
                      Text("Forgot Password"),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  MaterialButton(
                    child: Text(
                      "LOGIN",
                      style: const TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                        cheackValidatio(context,email_controller.text,pass_controller.text);
                    },
                    color: Colors.red,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Do not have an account?"),
                      InkWell(
                        onTap: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (_) => RegistrationView()));
                         /* Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>RegistrationView()));*/
                        },
                        child: Text(
                          " Sign Up",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  void cheackValidatio(var context,String email,String pass){
      if(email.isEmpty || pass.isEmpty){
        ToastUtil.showShortToast("Required Email and Password");
      }else {
        if(pass.length<6){
          ToastUtil.showShortToast("Password more Than 6");
        }else{
         loginApi.Login(context, email, pass);
        }
      }
  }
}
