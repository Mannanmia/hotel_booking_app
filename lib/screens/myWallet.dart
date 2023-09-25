import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hoel_booking_app/utils/AppColors.dart';
import '../utils/alertDialouge.dart';
import 'buy_cradit_view.dart';

class MyWallet extends StatefulWidget {
  const MyWallet({Key? key}) : super(key: key);

  @override
  State<MyWallet> createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Wallet"),
        actions: [
          IconButton(onPressed: () {
            OpenDialouge.openDialouge(context);
          }, icon: Icon(Icons.filter_list)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height:size.height *.03 ,),
            Container(
              color: Colors.white70,
              height: size.height*0.2,
              width: size.width*1,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("CREDIT BALANCE",style: TextStyle(color:Colors.black,fontSize: 15 ),),
                    Text("Wallet BALANCE",style: TextStyle(color:AppColor.yaleBlue,fontSize: 12 ),),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("BDT 70445",style: TextStyle(color:AppColor.yaleBlue,fontSize: 20 ),),
                        MaterialButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>BuyCraditView()));
                          },
                          child: Text(
                            "Buy Credits",
                            style: TextStyle(fontSize: 18),
                          ),
                          color: AppColor.skyBlue,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height:size.height *.03 ,),
            Text("Latest Transactions",style: TextStyle(fontSize: 20),),
            SizedBox(height:size.height *.03 ,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                color: Colors.white70,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(width: size.width*.20,
                            child: Text("#",style: TextStyle(color: Colors.blueAccent),)),
                        Container(width: size.width*.20,
                            child: Text("Type",style: TextStyle(color: Colors.blueAccent),)),
                        Container(width: size.width*.20,
                            child: Text("Amount",style: TextStyle(color: Colors.blueAccent),)),
                        Container(width: size.width*.20,
                            child: Text("Gateway",style: TextStyle(color: Colors.blueAccent),)),
                        Container(width: size.width*.20,
                            child: Text("Status",style: TextStyle(color: Colors.blueAccent),)),
                        Container(width: size.width*.25,
                            child: Text("Description",style: TextStyle(color: Colors.blueAccent),)),
                        Container(width: size.width*.25,
                            child: Text("Date",style: TextStyle(color: Colors.blueAccent),)),
                      ],
                    ),
                    SizedBox(height:size.height *.03 ,),
                    Row(
                      children: [
                        Container(width: size.width*.20,
                            child: Text("7",style: TextStyle(color: Colors.blueAccent),)),
                        Container(width: size.width*.20,
                            child: Text("Deposit",style: TextStyle(color: Colors.blueAccent),)),
                        Container(width: size.width*.20,
                            child: Text("1000",style: TextStyle(color: Colors.blueAccent),)),
                        Container(width: size.width*.20,
                            child: Text("Offline Method",style: TextStyle(color: Colors.blueAccent),)),
                        Container(width: size.width*.20,
                            child: Text("Processing",style: TextStyle(color: Colors.blueAccent),)),
                        Container(width: size.width*.25,
                            child: Text("",style: TextStyle(color: Colors.blueAccent),)),
                        Container(width: size.width*.25,
                            child: Text("20/10/2021",style: TextStyle(color: Colors.blueAccent),)),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
