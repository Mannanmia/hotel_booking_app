import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hoel_booking_app/Core/Network/Api/apiTourList.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import '../Core/Network/Api/ApiUploadPicture.dart';
import '../utils/AppColors.dart';
import '../utils/alertDialouge.dart';
import '../utils/toast_utils.dart';

class AddTourList extends StatefulWidget {
  const AddTourList({Key? key}) : super(key: key);

  @override
  State<AddTourList> createState() => _AddTourListState();
}

class _AddTourListState extends State<AddTourList> {

  //Variable part..............
  File? _banner_image;
  File? _featured_image;
  String _banner_image_id ="";
  String _featured_image_id ="";
  TextEditingController _tour_title = TextEditingController();
  TextEditingController _tour_sort_description = TextEditingController();
  TextEditingController _tour_duration = TextEditingController();
  TextEditingController _tour_sdate = TextEditingController();
  TextEditingController _tour_cost = TextEditingController();
  TextEditingController _tour_sell_cost = TextEditingController();
  TextEditingController _tour_address = TextEditingController();
  TextEditingController _tour_content = TextEditingController();
  TextEditingController _tour_edate = TextEditingController();
  TextEditingController _tour_minPeople = TextEditingController();
  TextEditingController _tour_maxPeople = TextEditingController();
  String map_lat = "null";
  String map_lng= "null";

  //Code Part...........
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Package"),
          actions: [
            IconButton(
                onPressed: () {
                  OpenDialouge.openDialouge(context);
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
                Container(
                  height: size.height *0.05,
                  child: TextField(
                    controller: _tour_title,
                    decoration: InputDecoration(
                      hintText: "Tour Title",
                      labelText: "Tour Title",
                      border: OutlineInputBorder(),),
                  ),
                ),
                SizedBox(height: 4,),
                Container(
                  height: size.height *0.05,
                  child: TextField(
                   controller: _tour_sort_description,
                    decoration: InputDecoration(
                      hintText: "Paragraph",
                      labelText: "Short Description",
                      border: OutlineInputBorder(),),
                  ),
                ),
                SizedBox(height: 3,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: size.height *0.05,
                      width: size.width*.45,
                      child: TextField(
                        controller: _tour_duration,
                        decoration: InputDecoration(
                          hintText: "Ex-3 Day",
                          labelText: "Duration (Day)",
                          border: OutlineInputBorder(),),
                      ),
                    ),
                    Container(
                      height: size.height *0.05,
                      width: size.width*.45,
                      child: TextField(
                        controller: _tour_content,
                        decoration: InputDecoration(
                          hintText: "Show See",
                          labelText: "Content",
                          border: OutlineInputBorder(),),
                      ),
                    ),
                  ],),
                SizedBox(height: 3,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: size.height *0.05,
                      width: size.width*.45,
                      child: TextField(
                        controller: _tour_sdate,
                        decoration: InputDecoration(
                          hintText: "2020-10-12",
                          labelText: "Start Date",
                          border: OutlineInputBorder(),),
                      ),
                    ),
                    Container(
                      height: size.height *0.05,
                      width: size.width*.45,
                      child: TextField(
                        controller: _tour_edate,
                        decoration: InputDecoration(
                          hintText: "2020-12-06",
                          labelText: "End Date",
                          border: OutlineInputBorder(),),
                      ),
                    ),
                  ],),
                SizedBox(height: 3,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: size.height *0.05,
                      width: size.width*.45,
                      child: TextField(
                        controller: _tour_maxPeople,
                        decoration: InputDecoration(
                          hintText: "Ex-5",
                          labelText: "Max People",
                          border: OutlineInputBorder(),),
                      ),
                    ),
                    Container(
                      height: size.height *0.05,
                      width: size.width*.45,
                      child: TextField(
                        controller: _tour_minPeople,
                        decoration: InputDecoration(
                          hintText: "Ex-2",
                          labelText: "Minimum People",
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
                Row(
                  children: [
                    Container(
                      child: Text("Google Location :",style: TextStyle(fontSize: 15),),
                      width:size.width*.33,
                      height: 40,),
                    Container(
                      child:(map_lng == "null")?MaterialButton(onPressed: () async{
                        var data = await getGoogleLocation();
                        setState(() {
                          map_lat = data.latitude.toString();
                          map_lng= data.longitude.toString();
                        });
                      },child: Text("Pick Location"),color: Colors.white70,):InkWell(
                        child: Text(
                          "Lat : " +
                              map_lat +
                              " lan : " +
                              map_lng,
                          style: TextStyle(fontSize: 15),
                        ),
                        onTap: () async{
                          var data = await getGoogleLocation();
                          setState(() {
                            map_lat = data.latitude.toString();
                            map_lng= data.longitude.toString();
                          });
                        },
                      ),
                      width: size.width * .62,
                      height: 40,
                    ),
                  ],
                ),
                SizedBox(height: 3,),
                Container(
                  height: size.height *0.05,
                  child: TextField(
                    controller: _tour_address,
                    decoration: InputDecoration(
                      hintText: "10/8 Jigatola",
                      labelText: "Real Address",
                      border: OutlineInputBorder(),),
                  ),
                ),
                Text("Pricing ::" ,style: TextStyle(fontSize: 20,color: Colors.black),),
                SizedBox(height: 3,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: size.height *0.05,
                      width: size.width*.45,
                      child: TextField(
                        controller: _tour_cost ,
                        decoration: InputDecoration(
                          hintText: "10000Tk",
                          labelText: "Tour Cost",
                          border: OutlineInputBorder(),),
                      ),
                    ),
                    Container(
                      height: size.height *0.05,
                      width: size.width*.45,
                      child: TextField(
                        controller: _tour_sell_cost,
                        decoration: InputDecoration(
                          hintText: "15000Tk",
                          labelText: "Sale Tour Cost",
                          border: OutlineInputBorder(),),
                      ),
                    ),
                  ],),
                SizedBox(height: 3,),
                Center(
                  child:MaterialButton(onPressed: (){
                    callApiSaveData();
                  },child:const Text("Save",style: TextStyle(color: Colors.white),),color: AppColor.naviBlue,) ,
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

  //Google Map Location
  Future<Position> getGoogleLocation() async{
    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
    }
    if(permission == LocationPermission.denied){
      return Future.error("Location Service denied");
    }
    return Geolocator.getCurrentPosition();
  }


  void callApiSaveData() {
    if(_tour_title.text == "" || _tour_cost.text == ""){
      ToastUtil.showShortToast("Required Title And Price");
    }else if(_tour_duration.text == "" || _tour_sdate.text == ""){
      ToastUtil.showShortToast("Required Duration And Start Date");
    }else{
      TotalTourList().postApiAddTour(context,_tour_title.text, _tour_sort_description.text, _banner_image_id, _featured_image_id, _tour_duration.text, _tour_sdate.text, _tour_cost.text,_tour_sell_cost.text,_tour_content.text,_tour_edate.text,_tour_maxPeople.text,_tour_minPeople.text,_tour_address.text,map_lat,map_lng);
    }
  }

}

