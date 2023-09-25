import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hoel_booking_app/utils/AppColors.dart';

class HotelView extends StatefulWidget {
  const HotelView({Key? key}) : super(key: key);
  @override
  State<HotelView> createState() => _HotelViewState();
}

class _HotelViewState extends State<HotelView> {
  //Variable Part

  //Code Part
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Hotel"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Rangamati",style: TextStyle(fontSize: 20,color: AppColor.yaleBlue),),
              Text("1/8 jigatola",style: TextStyle(fontSize: 16,color: AppColor.yaleBlue),),
              SizedBox(height:size.height *.03 ,),
              Text("Available Rooms",style: TextStyle(fontSize: 25,color: AppColor.yaleBlue),),
              SizedBox(height:size.height *.03 ,),
              Container(
                height: size.height*0.35,
                color: Colors.white70,
                child: Column(
                  children: [
                    Text("Book",style: TextStyle(fontSize: 25,color: AppColor.yaleBlue),),
                    SizedBox(height:size.height *.01 ,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: size.height*.08,
                          width: size.width*.45,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "10/16/2008",
                              labelText: "Check In Date",
                              border: OutlineInputBorder(),),
                          ),
                        ),
                        Container(
                          height: size.height*.08,
                          width: size.width*.45,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "15/16/2008",
                              labelText: "Check Out Date",
                              border: OutlineInputBorder(),),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height:size.height *.00001 ,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: size.height*.08,
                          width: size.width*.45,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "3",
                              labelText: "Adult Person",
                              border: OutlineInputBorder(),),
                          ),
                        ),
                        Container(
                          height: size.height*.08,
                          width: size.width*.45,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "2",
                              labelText: "Child",
                              border: OutlineInputBorder(),),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height:size.height *.00001 ,),
                    MaterialButton(onPressed: (){},child: Text("CHECK AVAILABILITY",style: TextStyle(fontSize: 18),),color: AppColor.skyBlue,)
                  ],
                ),
              ),
              SizedBox(height:size.height *.03 ,),
              Text("Rules :",style: TextStyle(fontSize: 16,color: AppColor.yaleBlue),),
              SizedBox(height:size.height *.02 ,),
              Text("Check In",style: TextStyle(fontSize: 16,color: AppColor.yaleBlue),),
              SizedBox(height:size.height *.02 ,),
              Text("Check Out",style: TextStyle(fontSize: 16,color: AppColor.yaleBlue),),
              SizedBox(height:size.height *.03 ,),
              Text("Location",style: TextStyle(fontSize: 25,color: AppColor.yaleBlue),),
              SizedBox(height:size.height *.03 ,),
              Container(
                height: size.height*0.3,
                width: size.width*1,
                color: Colors.red,
                child:Text("Map")/*GoogleMap(
                  initialCameraPosition: _cameraPosition,
                  markers: _marker,
                  zoomControlsEnabled: false,
                  mapType: MapType.normal,
                  onMapCreated: (GoogleMapController controller){
                    _googleMapController = controller;
                  },
                )*/,
              ),
              SizedBox(height: size.height*0.01,),
              Text("Reviews",style: TextStyle(color: AppColor.moreColor,fontSize: 20),),
              SizedBox(height: size.height*0.01,),
              Container(decoration: BoxDecoration(
                  border: Border.all(color: Colors.black45)
              ),
                height: size.height*0.35,width: size.width*1,
                child: Column(children: [
                  SizedBox(height: size.height*0.02,),
                  Text("0/5",style: TextStyle(fontSize: 30,color: Colors.lightBlueAccent),),
                  SizedBox(height: size.height*0.02,),
                  Text("Not Rated",style: TextStyle(fontSize: 25,color: Colors.blue),),
                  SizedBox(height: size.height*0.02,),
                  Text("Based on 0 review",style: TextStyle(fontSize: 20,color: Colors.black45),),
                  SizedBox(height: size.height*0.02,),
                ],),),
              SizedBox(height: size.height*0.01,),
              Text("Write a Review",style: TextStyle(color: AppColor.moreColor,fontSize: 20),),
              SizedBox(height: size.height*0.01,),
              TextField(
                decoration: InputDecoration(
                  hintText: "Review title",
                  labelText: "Title",
                  border: OutlineInputBorder(),),),

              SizedBox(height: size.height*0.01,),
              TextField(
                decoration: InputDecoration(
                  hintText: "Write Commet",
                  labelText: "Comment",
                  border: OutlineInputBorder(),),),
              SizedBox(height: size.height*0.01,),
              RatingBar.builder(
                initialRating: 0,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  //Rating set Here
                },
              ),
              SizedBox(height: size.height*0.01,),
              MaterialButton(color: AppColor.skyBlue,onPressed: (){},child: Text("Submit Review"),)
            ],
          ),
        ),
      ),
    );
  }
}
