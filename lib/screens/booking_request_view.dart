import 'package:flutter/material.dart';
import 'package:hoel_booking_app/utils/alertDialouge.dart';
import '../utils/AppColors.dart';

class BookingRequestView extends StatefulWidget {
  const BookingRequestView({Key? key}) : super(key: key);

  @override
  State<BookingRequestView> createState() => _BookingRequestViewState();
}

class _BookingRequestViewState extends State<BookingRequestView> {
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking Request"),
        actions: [
          IconButton(onPressed: () {
          OpenDialouge.openDialouge(context);
          }, icon: Icon(Icons.filter_list)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              color: Colors.white70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hotel : See palace",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Cox's Bazar",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  /*Text(
                    "--Select Service--",
                    style: TextStyle(color: AppColor.skyBlue),
                  ),*/
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              color: Colors.white70,
              width: size.width*1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Text("Md. Rajual Kader ",style: TextStyle(color: Colors.blue,fontSize: 20),),
                    Text("[Nid : 12342536987523125] ",style: TextStyle(color: Colors.blue,fontSize: 14),),
                  ],mainAxisAlignment: MainAxisAlignment.spaceBetween,),
                  Text("2 Adult + 1 Childeren",style: TextStyle(color: Colors.blue),),
                  SizedBox(height: size.height*.01,),
                  Row(children: [
                    Text("From: Dhaka ",style: TextStyle(color: Colors.blue,fontSize:14),),
                    Text("Purpose : Travelling",style: TextStyle(color: Colors.blue,fontSize: 14),),
                  ],mainAxisAlignment: MainAxisAlignment.spaceBetween,),
                  Text("Request Room : B1",style: TextStyle(color: Colors.blue),),
                  SizedBox(height: size.height*.01,),
                  Text("Depature : 06/11/2022",style: TextStyle(color: Colors.blue),),
                  Text("Booking No : 42351",style: TextStyle(color: Colors.blue),),
                  SizedBox(height: size.height*.01,),
                  Row(children: [
                    MaterialButton(color: AppColor.naviBlue,onPressed: (){},child: Text("Cancel",style: TextStyle(color: Colors.white),)),
                    MaterialButton(color: AppColor.naviBlue,onPressed: (){}, child: Text("Confirm",style: TextStyle(color: Colors.white),)),
                  ],mainAxisAlignment: MainAxisAlignment.spaceBetween,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
