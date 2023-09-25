import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hoel_booking_app/utils/AppColors.dart';

class CareerView extends StatefulWidget {
  const CareerView({Key? key}) : super(key: key);

  @override
  State<CareerView> createState() => _CareerViewState();
}

class _CareerViewState extends State<CareerView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Career View"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: size.height*0.2,
                width: size.width*1,
                child: Image(image: AssetImage("images/app-logo.png")),
              ),
              SizedBox(height: size.height*0.01,),
              Text("Manager",style: TextStyle(color: Colors.yellow,fontSize: 16),),
              SizedBox(height: size.height*0.01,),
              Text("Marketing",style: TextStyle(color: AppColor.moreColor,fontSize: 25),),
              SizedBox(height: size.height*0.01,),
              Text("Job Location : Dhaka",style: TextStyle(color: AppColor.moreColor,fontSize: 20),),
              SizedBox(height: size.height*0.01,),
              Text("Application Deadline : 2022-10-08",style: TextStyle(color: AppColor.skyBlue,fontSize: 20),),
              SizedBox(height: size.height*0.01,),
              Text("By Dev.MH",style: TextStyle(color: AppColor.moreColor,fontSize: 20),),
              SizedBox(height: size.height*0.01,),
              Text("Date 08/10/2022",style: TextStyle(color: AppColor.moreColor,fontSize: 20),),
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
