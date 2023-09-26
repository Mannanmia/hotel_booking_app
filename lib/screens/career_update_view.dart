import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Core/Network/Api/ApiCarrerList.dart';
import '../Core/Network/Api/ApiUploadPicture.dart';
import '../utils/AppColors.dart';
import '../utils/toast_utils.dart';

class CareerUpdateView extends StatefulWidget {
  int _id;
  CareerUpdateView(this._id);

  @override
  State<CareerUpdateView> createState() => _CareerUpdateViewState(_id);
}

class _CareerUpdateViewState extends State<CareerUpdateView> {
  int _id;
  _CareerUpdateViewState(this._id);
  //Variable
  List<bool> _checkbox_value =[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false];
  File? _banner_image;
  File? _featured_image;
  TextEditingController _title_contrller = TextEditingController();
  TextEditingController _content_contrller = TextEditingController();
  TextEditingController _youTubevideo_contrller = TextEditingController();
  TextEditingController _beadNo_contrller = TextEditingController();
  TextEditingController _bathroomNo_contrller = TextEditingController();
  TextEditingController _size_contrller = TextEditingController();
  TextEditingController _mindayBefore_contrller = TextEditingController();
  TextEditingController _mindayStay_contrller = TextEditingController();
  TextEditingController _price_contrller = TextEditingController();
  TextEditingController _sellprice_contrller = TextEditingController();
  TextEditingController _guest_contrller = TextEditingController();
  String _banner_image_id ="";
  String _featured_image_id ="";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Update Career"),
          actions: [
            IconButton(
                onPressed: () {},
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
                  controller: _title_contrller,
                  decoration: InputDecoration(
                    hintText: "Career Title",
                    labelText: "Career Title",
                    border: OutlineInputBorder(),),
                ),
                SizedBox(height: 3,),
                TextField(
                  controller: _content_contrller,
                  decoration: InputDecoration(
                    hintText: "Paragraph",
                    labelText: "Content",
                    border: OutlineInputBorder(),),
                ),
                SizedBox(height: 3,),
                TextField(
                  controller: _youTubevideo_contrller,
                  decoration: InputDecoration(
                    hintText: "Youtube Link Video",
                    labelText: "Youtube Video",
                    border: OutlineInputBorder(),),
                ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: size.height*.08,
                      width: size.width*.32,
                      child: TextField(
                        controller: _beadNo_contrller,
                        decoration: InputDecoration(
                          hintText: "Ex : 3",
                          labelText: "No. Bed",
                          border: OutlineInputBorder(),),
                      ),
                    ),
                    Container(
                      height: size.height*.08,
                      width: size.width*.32,
                      child: TextField(
                        controller: _bathroomNo_contrller,
                        decoration: InputDecoration(
                          hintText: "Ex : 3",
                          labelText: "No. Bathroom",
                          border: OutlineInputBorder(),),
                      ),
                    ),
                    Container(
                      height: size.height*.08,
                      width: size.width*.30,
                      child: TextField(
                        controller: _size_contrller,
                        decoration: InputDecoration(
                          hintText: "Ex : 100",
                          labelText: "Squre",
                          border: OutlineInputBorder(),),
                      ),
                    ),
                  ],),
                SizedBox(height: 3,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: size.height*.08,
                      width: size.width*.45,
                      child: TextField(
                        controller: _mindayBefore_contrller,
                        decoration: InputDecoration(
                          hintText: "Ex : 3",
                          labelText: "Min Day before Booking",
                          border: OutlineInputBorder(),),
                      ),
                    ),
                    Container(
                      height: size.height*.08,
                      width: size.width*.45,
                      child: TextField(
                        controller: _mindayStay_contrller,
                        decoration: InputDecoration(
                          hintText: "Ex : 2",
                          labelText: "Min Day Stays",
                          border: OutlineInputBorder(),),
                      ),
                    ),
                  ],),
                SizedBox(height: 3,),
                Text("Locations" ,style: TextStyle(fontSize: 20,color: Colors.black),),
                Text("Map Implement" ,style: TextStyle(fontSize: 20,color: Colors.black),),
                Text("PRICING ::" ,style: TextStyle(fontSize: 20,color: Colors.black),),
                SizedBox(height: 3,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: size.height*.08,
                      width: size.width*.45,
                      child: TextField(
                        controller: _price_contrller,
                        decoration: InputDecoration(
                          hintText: "Ex : 1000tk",
                          labelText: "Price",
                          border: OutlineInputBorder(),),
                      ),
                    ),
                    Container(
                      height: size.height*.08,
                      width: size.width*.45,
                      child: TextField(
                        controller: _sellprice_contrller,
                        decoration: InputDecoration(
                          hintText: "Ex : 1000tk",
                          labelText: "Sale Price",
                          border: OutlineInputBorder(),),
                      ),
                    ),
                  ],),
                SizedBox(height: 3,),
                Container(
                  height: size.height*.08,
                  width: size.width*.45,
                  child: TextField(
                    controller: _guest_contrller,
                    decoration: InputDecoration(
                      hintText: "Ex : 4",
                      labelText: "Maximum Guest",
                      border: OutlineInputBorder(),),
                  ),
                ),
                SizedBox(height: 3,),
                Text("Attributes :: " ,style: TextStyle(fontSize: 20,color: Colors.black),),
                SizedBox(height: 3,),
                Row(
                  children: [
                    itemCheckBox("Auditorium", 0,size),
                    itemCheckBox("Bar", 1,size),
                  ],
                ),
                Row(
                  children: [
                    itemCheckBox("Cafe", 2,size),
                    itemCheckBox("Ballroom", 3,size),
                  ],
                ),
                Row(
                  children: [
                    itemCheckBox("Dance Studio", 4,size),
                    itemCheckBox("Office", 5,size),
                  ],
                ),
                FittedBox(
                  child: Row(
                    children: [
                      itemCheckBox("Party Hall", 6,size),
                      itemCheckBox("Recording Studio",7,size),
                    ],
                  ),
                ),
                Row(
                  children: [
                    itemCheckBox("Yoga Studio", 0,size),
                    itemCheckBox("Villa", 0,size),
                  ],
                ),
                Row(
                  children: [
                    itemCheckBox("Warehouse", 0,size),
                    itemCheckBox("Aircondition", 0,size),
                  ],
                ),
                Row(
                  children: [
                    itemCheckBox("BreakFast", 0,size),
                    itemCheckBox("Kitchen", 0,size),
                  ],
                ),
                Row(
                  children: [
                    itemCheckBox("Parking", 0,size),
                    itemCheckBox("Pool", 0,size),
                  ],
                ),
                itemCheckBox("Wifi-Internet", 0,size),
                SizedBox(height: 3,),
                Center(
                  child:MaterialButton(onPressed: (){
                    callApiSaveData();
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

  void callApiSaveData() {
    TotalCareerList().postApiUpdateCarrer(context,_id, _title_contrller.text,_content_contrller.text, _youTubevideo_contrller.text,_featured_image_id,_banner_image_id, _beadNo_contrller.text, _bathroomNo_contrller.text, _size_contrller.text,_mindayBefore_contrller.text,_mindayStay_contrller.text,_price_contrller.text, _sellprice_contrller.text, _guest_contrller.text);
  }
}
