import 'package:flutter/material.dart';

import '../utils/AppColors.dart';
import '../utils/alertDialouge.dart';

class BuyCraditView extends StatefulWidget {
  const BuyCraditView({Key? key}) : super(key: key);

  @override
  State<BuyCraditView> createState() => _BuyCraditViewState();
}

class _BuyCraditViewState extends State<BuyCraditView> {
  //Variable part
  int? payment_method;

  //Code Part
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Buy credits"),
        actions: [
          IconButton(onPressed: () {
            OpenDialouge.openDialouge(context);
          }, icon: Icon(Icons.filter_list)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: size.width*.9,
          color: Colors.white70,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Buy",style: TextStyle(fontSize: 20),),
              SizedBox(height: size.height*.01,),
              Divider(),
              Text("How much would you like to deposit?",style: TextStyle(fontSize: 20),),
              SizedBox(height: size.height*.01,),
              TextField(
                controller: null,
                decoration: InputDecoration(
                  hintText: "Ex : 1000tk",
                  labelText: "Amount",
                  border: OutlineInputBorder(),),
              ),
              SizedBox(height: size.height*.01,),
              Text("Select Payment Method",style: TextStyle(fontSize: 20),),
              SizedBox(height: size.height*.01,),
              Container(
                child: Column(
                  children: [
                     Radia_Button(1, "Offline Payment"),
                     Radia_Button(2, "Bkash CheckOut"),
                     Radia_Button(3, "Nagad CheckOut"),
                  ],
                ),
              ),
              SizedBox(height: size.height*.01,),
              MaterialButton(onPressed: (){},child: Text("Process Now",style: TextStyle(color: Colors.white),),color: AppColor.yaleBlue,)
            ],
          ),
        ),
      ),
    );
  }

 Widget Radia_Button (int count , String text){
   return  Row(
     children: [
       Radio(value: count, groupValue: payment_method, onChanged: (value){
         setState(() {
           payment_method = value as int;
         });
       }),
       InkWell(onTap: (){
         setState(() {
           payment_method = count;
         });
       },child: Text(text,style: TextStyle(fontSize: 20),))
     ],
   );
 }

}
