import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hoel_booking_app/Core/Network/Api/ApiEvent.dart';
import 'package:image_picker/image_picker.dart';
import '../Core/Network/Api/ApiUploadPicture.dart';
import '../utils/AppColors.dart';
import '../utils/toast_utils.dart';

class EventUpdateView extends StatefulWidget {
  int _id;
  EventUpdateView(this._id);

  @override
  State<EventUpdateView> createState() => _EventUpdateViewState(_id);
}

class _EventUpdateViewState extends State<EventUpdateView> {
  int _id;
  _EventUpdateViewState(this._id);
  //Variable
  List<bool> _checkbox_value =[false,false,false,false,false,false,false,false];
  File? _banner_image;
  File? _featured_image;
  String _banner_image_id ="";
  String _featured_image_id ="";
  TextEditingController _event_title = TextEditingController();
  TextEditingController _event_content = TextEditingController();
  TextEditingController _event_video = TextEditingController();
  TextEditingController _event_duration = TextEditingController();
  TextEditingController _event_stime = TextEditingController();
  TextEditingController _event_price = TextEditingController();
  TextEditingController _event_sell_price = TextEditingController();
  TextEditingController _event_ticket_code = TextEditingController();
  TextEditingController _event_name = TextEditingController();
  TextEditingController _event_ticket_price = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Update EVENT"),
          actions: [
            IconButton(
                onPressed: () {

                },
                icon: Icon(Icons.filter_list)),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _event_title,
                  decoration: InputDecoration(
                    hintText: "Event Title",
                    labelText: "Event Title",
                    border: OutlineInputBorder(),),
                ),
                SizedBox(height: 3,),
                TextField(
                  controller: _event_content,
                  decoration: InputDecoration(
                    hintText: "Paragraph",
                    labelText: "Content",
                    border: OutlineInputBorder(),),
                ),
                SizedBox(height: 3,),
                TextField(
                  controller: _event_video,
                  decoration: InputDecoration(
                    hintText: "Youtube Link Video",
                    labelText: "Youtube Video",
                    border: OutlineInputBorder(),),
                ),
                SizedBox(height: 3,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: size.height*.08,
                      width: size.width*.45,
                      child: TextField(
                        controller: _event_duration,
                        decoration: InputDecoration(
                          hintText: "Ex-3",
                          labelText: "Duration (Hour)",
                          border: OutlineInputBorder(),),
                      ),
                    ),
                    Container(
                      height: size.height*.08,
                      width: size.width*.45,
                      child: TextField(
                        controller: _event_stime,
                        decoration: InputDecoration(
                          hintText: "Ex19:00",
                          labelText: "Start Time",
                          border: OutlineInputBorder(),),
                      ),
                    ),
                  ],),
                SizedBox(height: 3,),
                Row(
                  children: [
                    Container(
                      child: Text("Pick Banner Image :",style: TextStyle(fontSize: 15),),
                      width:size.width*.33,
                      height: 40,),
                    Container(
                      child: MaterialButton(
                        color: Colors.white70,
                        onPressed: () {
                          imageDialouge(context, "_banner_image",_banner_image);
                        },
                        child: Text("Browse"),
                      ),
                      width: size.width * .62,
                      height: 40,
                    ),
                  ],
                ),
                SizedBox(height: 3,),
                Row(
                  children: [
                    Container(
                      child: Text("Pick Featured Image :",style: TextStyle(fontSize: 15),),
                      width:size.width*.33,
                      height: 40,),
                    Container(
                      child:MaterialButton(
                        color: Colors.white70,
                        onPressed: () {
                          imageDialouge(context,"_featured_image",_featured_image);
                        },
                        child: Text("Browse"),
                      ),
                      width: size.width * .62,
                      height: 40,
                    ),
                  ],
                ),
                SizedBox(height: 3,),
                Text("Locations" ,style: TextStyle(fontSize: 20,color: Colors.black),),
                Text("Map Implement" ,style: TextStyle(fontSize: 20,color: Colors.black),),
                Text("Pricing ::" ,style: TextStyle(fontSize: 20,color: Colors.black),),
                SizedBox(height: 3,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: size.height*.08,
                      width: size.width*.45,
                      child: TextField(
                        controller: _event_price,
                        decoration: InputDecoration(
                          hintText: "10000Tk",
                          labelText: "Event Price",
                          border: OutlineInputBorder(),),
                      ),
                    ),
                    Container(
                      height: size.height*.08,
                      width: size.width*.45,
                      child: TextField(
                        controller: _event_sell_price,
                        decoration: InputDecoration(
                          hintText: "15000Tk",
                          labelText: "Sale Event Price",
                          border: OutlineInputBorder(),),
                      ),
                    ),
                  ],),
                SizedBox(height: 3,),
                Text("Tickets ::" ,style: TextStyle(fontSize: 20,color: Colors.black),),
                SizedBox(height: 3,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: size.height*.08,
                      width: size.width*.32,
                      child: TextField(
                        controller: _event_ticket_code,
                        decoration: InputDecoration(
                          hintText: "#981751",
                          labelText: "Code",
                          border: OutlineInputBorder(),),
                      ),
                    ),
                    Container(
                      height: size.height*.08,
                      width: size.width*.32,
                      child: TextField(
                        controller: _event_name,
                        decoration: InputDecoration(
                          hintText: "Dj Party",
                          labelText: "Name",
                          border: OutlineInputBorder(),),
                      ),
                    ),
                    Container(
                      height: size.height*.08,
                      width: size.width*.30,
                      child: TextField(
                        controller: _event_ticket_price,
                        decoration: InputDecoration(
                          hintText: "15000Tk",
                          labelText: "Price-Number",
                          border: OutlineInputBorder(),),
                      ),
                    ),
                  ],),
                SizedBox(height: 3,),
                Text("Attributes :: " ,style: TextStyle(fontSize: 20,color: Colors.black),),
                SizedBox(height: 3,),
                Row(
                  children: [
                    itemCheckBox("Field Day", 0,size),
                    itemCheckBox("Glastonebury", 1,size),
                  ],
                ),
                Row(
                  children: [
                    itemCheckBox("Green Man", 2,size),
                    itemCheckBox("Latitude", 3,size),
                  ],
                ),
                Row(
                  children: [
                    itemCheckBox("Boom Town", 4,size),
                    itemCheckBox("Wilderness", 5,size),
                  ],
                ),
                FittedBox(
                  child: Row(
                    children: [
                      itemCheckBox("Exit Fastible", 6,size),
                      itemCheckBox("Primavera Sound",7,size),
                    ],
                  ),
                ),
                SizedBox(height: 3,),
                Center(
                  child:MaterialButton(onPressed: (){
                    callApiPostData();
                  },child: Text("Add / Save Change"),color: AppColor.centerTextColor,) ,
                )
              ],
            ),
          ),
        )
    );
  }
  //Image Pick Dialouge
  void imageDialouge(BuildContext context, String imagePath,File? fileName){
    showDialog(
        barrierDismissible: false,
        context: context, builder: (context){
      return Dialog(
        child: Container(
          height: 400,
          width: 400,
          child: Column(
            children: [
              Container(
                height: 300,
                width: 400,
                child: Container(
                  child: (fileName == null)
                      ? MaterialButton(
                    color: Colors.white70,
                    onPressed: () {
                      imagePickerOption(context, imagePath);
                    },
                    child: Text("Pick Image"),
                  )
                      : InkWell(child: Image.file(fileName),onTap: (){
                    imagePickerOption(context, imagePath);
                  },),
                ),
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(onPressed: (){
                    Navigator.pop(context);
                  },child: Text("Cancle"),color: Colors.red,),

                  MaterialButton(onPressed: () async{
                    if(fileName == null){
                      ToastUtil.showShortToast("Select Image");
                    }else{
                      var image_id = await ApiImageUpload().singleImageUpload(context,fileName!);
                      setState(() {
                        if(imagePath == "_banner_image"){
                          _banner_image_id = image_id!;
                        }
                        if (imagePath == "_featured_image") {
                          _featured_image_id = image_id!;
                        }
                      });
                      ToastUtil.showShortToast("Image Uploaded Successfully");
                      Navigator.pop(context);
                    }
                  },child: Text("Upload Image"),color: Colors.white70,),
                ],
              )
            ],
          ),
        ),
      );
    });
  }

  // Image Picker Option is Implemented here......
  void imagePickerOption(BuildContext context, String imagePath) {
    Navigator.pop(context);
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              child: Container(
                color: Colors.white,
                height: 250,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        "Pic Image From",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          pickImage(context, ImageSource.camera, imagePath);
                        },
                        icon: const Icon(Icons.camera),
                        label: const Text("CAMERA"),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          pickImage(context, ImageSource.gallery, imagePath);
                        },
                        icon: const Icon(Icons.image),
                        label: const Text("GALLERY"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close),
                        label: const Text("CANCEL"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  //Pick Image .......
  pickImage(BuildContext context, ImageSource imageType, String imagePath) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return null;
      File tempImage = await File(photo.path);
      setState((){
        if(imagePath == "_banner_image"){
          _banner_image = tempImage;
        }
        if (imagePath == "_featured_image") {
          _featured_image = tempImage;
        }
      });
      Navigator.pop(context);
      if(imagePath =="_banner_image"){
        imageDialouge(context, imagePath, _banner_image);

      }
      if (imagePath == "_featured_image") {
        imageDialouge(context, imagePath, _featured_image);
      }

    } catch (error) {
      debugPrint(error.toString());
    }
  }


  Widget itemCheckBox(String text ,int index ,Size size){
    return  Container(
      width: size.width*0.45,
      child: Row(
        children: [
          Checkbox(value: _checkbox_value[index], onChanged: (value){
            setState((){
              _checkbox_value[index] = value!;
            });
          }),
          Flexible(child: Text(text,style: TextStyle(fontSize: 20,color: AppColor.yaleBlue),))
        ],
      ),
    );
  }

  void callApiPostData() {
    if(_event_title.text == ""){
      ToastUtil.showShortToast("Require Title");
    }else if( _event_price.text == ""){
      ToastUtil.showShortToast("Require Event Price");
    }else{
      TotalEventList().postApiUpdateEvent(context,_id,_event_title.text, _event_content.text, _event_video.text, _event_duration.text, _event_stime.text, _featured_image_id, _banner_image_id, _event_price.text, _event_sell_price.text, _event_ticket_code.text, _event_name.text, _event_ticket_price.text);
    }
  }
}
