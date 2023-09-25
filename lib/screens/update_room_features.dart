import 'package:flutter/material.dart';
import 'package:hoel_booking_app/utils/AppColors.dart';

class UpdateRoomFeature extends StatefulWidget {
  const UpdateRoomFeature({Key? key}) : super(key: key);

  @override
  State<UpdateRoomFeature> createState() => _UpdateRoomFeatureState();
}

class _UpdateRoomFeatureState extends State<UpdateRoomFeature> {
  //Variable Part
    List<bool> _checkbox_value =[false,false,false,false,false,false,false,false,false];
  
  //Code Part
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Update Room Feature"),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Edit : General",style: TextStyle(fontSize: 20,color: AppColor.yaleBlue),),
                  MaterialButton(onPressed: (){}, child: Text("Manage Room",style: TextStyle(fontSize: 20,color: Colors.white),),
                    color: Colors.blueAccent,)
                ],
              ),
              SizedBox(height: 5,),
              Text("Room Name *",style: TextStyle(fontSize: 20,color: AppColor.yaleBlue),),
              SizedBox(height: 5,),
              TextField(
                decoration: InputDecoration(border: OutlineInputBorder(),
                hintText: "General"),

              ),
              SizedBox(height: 5,),
              Text("Feature Image",style: TextStyle(fontSize: 20,color: AppColor.yaleBlue),),
              SizedBox(height: 5,),
              Container(child:
                Image.asset('images/app-logo.png'),
              height: size.height*.20,
              width: size.width*1,),
              SizedBox(height: 5,),
              Text("Galary",style: TextStyle(fontSize: 20,color: AppColor.yaleBlue),),
              SizedBox(height: 5,),
              MaterialButton(onPressed: (){}, child: Text("+ Select Image",style: TextStyle(fontSize: 20,color: Colors.white),),
              color: AppColor.skyBlue,),
              SizedBox(height: 5,),
              itemTextFieldBuilt(size,"Price","10.00"),
              SizedBox(height: 5,),
              itemTextFieldBuilt(size,"Number of room","30"),
              SizedBox(height: 5,),
              itemTextFieldBuilt(size,"Number of beds","1"),
              SizedBox(height: 5,),
              itemTextFieldBuilt(size,"Room Size","100"),
              SizedBox(height: 5,),
              itemTextFieldBuilt(size,"Max Adult","2"),
              SizedBox(height: 5,),
              itemTextFieldBuilt(size,"Max Childern","2"),
              SizedBox(height: 5,),
              Text("Attribute : Room Amenities",style: TextStyle(fontSize: 20,color: AppColor.yaleBlue),),
              SizedBox(height: 5,),
              itemCheckBox("Air Conditioning",0),
              SizedBox(height: 5,),
              itemCheckBox("Flat Screen Tv",1),
              SizedBox(height: 5,),
              itemCheckBox("Free Wifi",2),
              SizedBox(height: 5,),
              itemCheckBox("Intercome",3),
              SizedBox(height: 5,),
              itemCheckBox("Breakfast in the room",4),
              SizedBox(height: 5,),
              itemCheckBox("Daily housekeeping",5),
              SizedBox(height: 5,),
              itemCheckBox("Laundry (Additional Charge",6),
              SizedBox(height: 5,),
              Text("Attribute : Smoking Policy",style: TextStyle(fontSize: 20,color: AppColor.yaleBlue),),
              SizedBox(height: 5,),
              itemCheckBox("Smoking",7),
              SizedBox(height: 5,),
              itemCheckBox("Non-Smoking",8),
              Center(child: MaterialButton(onPressed: (){}, child: Text("Save Changes",style: TextStyle(color: Colors.white),),color: Colors.blue,))
            ],
          ),
        ),
      ),
    );
  }

    //CheckBox item built here
    Widget itemCheckBox(String text ,int index ){
      return  Row(
        children: [
          Checkbox(value: _checkbox_value[index], onChanged: (value){
            setState((){
              _checkbox_value[index] = value!;
            });
          }),
          Text(text,style: TextStyle(fontSize: 20,color: AppColor.yaleBlue),)
        ],
      );
    }

}


    //TextField item build here..........
Widget itemTextFieldBuilt(Size size , String text,String hint_text){
  return Row(
    children: [
      Container(
        width: size.width*.33,
        child:  Text(text,style: TextStyle(fontSize: 20,color: AppColor.yaleBlue),),
      ),
      Container(
        width: size.width*.63,
        child: TextField(decoration: InputDecoration(border: OutlineInputBorder(),hintText: hint_text),),
      ),
    ],
  );
}
