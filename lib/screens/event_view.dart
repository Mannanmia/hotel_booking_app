import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hoel_booking_app/Core/Network/Api/ApiEvent.dart';
import 'package:hoel_booking_app/Model/ApiResponseEvent.dart';

import '../utils/AppColors.dart';

class EventView extends StatefulWidget {
  int _id;
  EventView(this._id);
  @override
  State<EventView> createState() => _EventViewState(_id);
}

class _EventViewState extends State<EventView> {
  //Variable Part Here ........
  int _id;
  _EventViewState(this._id);

  EventResponse res = EventResponse(0, "", "", 0, "", "", "","","","");

  @override
  void initState() {
    ApiCallData();
    super.initState();
  }

  //Code Part Here..........
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Event"),),
      body: SingleChildScrollView(scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(width: size.width*1,height: size.height*0.3,
              child: Image(image: AssetImage("images/app-logo.png"))),

              SizedBox(height: size.height*0.02),

              Text(res.title??'Adda',style: TextStyle(fontSize: 25,color: Colors.blue)),
              Row(children: [
                Icon(Icons.add_location,color: Colors.blue,),
                Text(res.address??'Jigatola',style: TextStyle(fontSize: 18,color: Colors.blue),),
              ],),
              SizedBox(height: size.height*0.01,),
              Divider(height: size.height*0.05,color: Colors.black,),

              Row(children: [
                Icon(Icons.heart_broken,size: 45,color: Colors.blue,),
                SizedBox(width: size.width*0.05),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Wishlst",style: TextStyle(fontSize: 20,color: Colors.blue)),
                    Text("People interest: 0",style: TextStyle(fontSize: 18,color: Colors.black45),)

                  ],)
              ],),
              SizedBox(height: size.height*0.03,),
              Row(children: [
                Icon(Icons.watch_later_outlined,size: 45,color: Colors.blue,),
                SizedBox(width: size.width*0.05),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Start Time",style: TextStyle(fontSize: 20,color: Colors.blue)),
                    Text(res.start_time??'Not Found',style: TextStyle(fontSize: 18,color: Colors.black45),)

                  ],)
              ],),
              SizedBox(height: size.height*0.03,),
              Row(children: [
                Icon(Icons.add_link,size: 45,color: Colors.blue,),
                SizedBox(width: size.width*0.05),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Duration",style: TextStyle(fontSize: 20,color: Colors.blue)),
                    Text(res.duration.toString()+' Hours'??'Not Found',style: TextStyle(fontSize: 18,color: Colors.black45),)

                  ],)
              ],),
              SizedBox(height: size.height*0.03,),
              Row(children: [
                Icon(Icons.account_tree_outlined,size: 45,color: Colors.blue,),
                SizedBox(width: size.width*0.05),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Location",style: TextStyle(fontSize: 20,color: Colors.blue)),
                    Text("Dhaka",style: TextStyle(fontSize: 18,color: Colors.black45),)

                  ],)
              ],),

              Divider(height: size.height*0.05,color: Colors.black,),
              SizedBox(height: size.height*0.01,),
              Text("Description",style: TextStyle(fontSize: 25,color: Colors.blue),),
              SizedBox(height: size.height*0.01,),
              Text("nothig",style: TextStyle(fontSize: 18,color: Colors.black45),),
              SizedBox(height: size.height*0.04,),
              Text("Location",style: TextStyle(fontSize: 25,color: Colors.blue),),
              Container(width: size.width*1,height: size.height*0.3,color: Colors.pink,
              child: Text("Container for Map"),),
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
            ],),
        ),
      ),
    );
  }

  void ApiCallData() async{
     var data = await TotalEventList().get_ApiEvent(_id);
    setState(() {
      res = data!;
    });
  }

}
