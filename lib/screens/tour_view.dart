import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hoel_booking_app/utils/AppColors.dart';

class TourView extends StatefulWidget {
  const TourView({Key? key}) : super(key: key);

  @override
  State<TourView> createState() => _TourViewState();
}

class _TourViewState extends State<TourView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Package View"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Text("Test Pkg",style: TextStyle(fontSize: 20,color: AppColor.moreColor),),
              Divider(height: size.height*0.05,color: Colors.black,),
              SizedBox(height: size.height*0.01,),
              Row(children: [
                Icon(Icons.watch_later_outlined,size: 45,color: Colors.blue,),
                SizedBox(width: size.width*0.05),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Duration",style: TextStyle(fontSize: 20,color: Colors.blue)),
                    Text("3 Hour",style: TextStyle(fontSize: 18,color: Colors.black45),)
                  ],)
              ],),
              SizedBox(height: size.height*0.03,),
              Row(children: [
                Icon(Icons.tour,size: 45,color: Colors.blue,),
                SizedBox(width: size.width*0.05),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Type",style: TextStyle(fontSize: 20,color: Colors.blue)),
                    Text("City Trip",style: TextStyle(fontSize: 18,color: Colors.black45),)
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
              Text("OverView",style: TextStyle(fontSize: 25,color: Colors.blue),),
              SizedBox(height: size.height*0.01,),
              Text("Date Check",style: TextStyle(fontSize: 18,color: Colors.black45),),
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
              MaterialButton(color: AppColor.skyBlue,onPressed: (){},child: Text("Submit Review"),),
            ],
          ),
        ),
      ),
    );
  }
}
