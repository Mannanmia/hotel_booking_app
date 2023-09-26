
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hoel_booking_app/Core/Network/Api/verification_check.dart';
import 'package:hoel_booking_app/Model/check_verification.dart';
import 'package:hoel_booking_app/utils/AppColors.dart';
import 'package:image_picker/image_picker.dart';
import '../Core/Network/Api/ApiUploadPicture.dart';
import '../utils/alertDialouge.dart';
import '../utils/toast_utils.dart';

class VerificationView extends StatefulWidget {
  const VerificationView({Key? key}) : super(key: key);

  @override
  State<VerificationView> createState() => _VerificationViewState();
}

class _VerificationViewState extends State<VerificationView> {
  //Variable Part
  File? _nidCard;
  File? _tradeLicence;
  String _idCardImageId ="";
  String _treadLicenceImageId ="";
  VerificationResponse res = VerificationResponse(null,false,false,false);
  TextEditingController phoneTFController = TextEditingController();

  @override
  void initState() {
    super.initState();
    checkVarificationData();
  }

  //Code Section
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Verification Data"),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.white70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text("Phone",style: TextStyle(fontSize: 25,),),
                        if (res.isPhoneVarified!) Text("Verified",style: TextStyle(fontSize: 20,color: Colors.green),) else Text("UnVerified",style: TextStyle(fontSize: 20,color: Colors.red),),
                      ],
                    ),
                    Container(
                      width: size.width*0.6,
                        child: TextField(
                          controller: phoneTFController,
                          decoration: InputDecoration(
                            hintText: "016816*****",
                            labelText: "Phone No",
                            border: OutlineInputBorder(),),
                        )),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.white70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("ID Card",style: TextStyle(fontSize: 25,),),
                        if (res.isIdcardVarified!) Text("Verified",style: TextStyle(fontSize: 20,color: Colors.green),) else Text("UnVerified",style: TextStyle(fontSize: 20,color: Colors.red),),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: MaterialButton(color: AppColor.yaleBlue,onPressed: (){
                        imageDialouge(context,"_nidCard",_nidCard);
                      },child: Text("Pick Image",style: TextStyle(color: Colors.white),),),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.white70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Trade Licence",style: TextStyle(fontSize: 25,),),
                        if (res.isTradeLicenceVerified!) Text("Verified",style: TextStyle(fontSize: 20,color: Colors.green),) else Text("UnVerified",style: TextStyle(fontSize: 20,color: Colors.red),),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: MaterialButton(color: AppColor.yaleBlue,onPressed: (){
                        imageDialouge(context, "_treadLicence",_tradeLicence);
                      },child: Text("Pick Image",style: TextStyle(color: Colors.white),),),
                    ),
                  ],
                ),
              ),
            ),
            MaterialButton(
              color:AppColor.naviBlue,onPressed: (){

                postVarificationData();

            },child: Text("Verify Now",style: TextStyle(fontSize: 20,color: Colors.white),),)
          ],
        ),
      ),
    );
  }

  void checkVarificationData() async{
    var data = await CheckVerification().checkVarification();
    setState(() {
      res = data!;
      phoneTFController.text = data.phoneNumber!;
    });
  }

  void postVarificationData(){

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
                        if(imagePath == "_nidCard"){
                          _idCardImageId = image_id!;
                        }
                        if (imagePath == "_treadLicence") {
                          _treadLicenceImageId = image_id!;
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
        if(imagePath == "_nidCard"){
          _nidCard = tempImage;
        }
        if (imagePath == "_treadLicence") {
          _tradeLicence = tempImage;
        }
      });
      Navigator.pop(context);
      if(imagePath =="_nidCard"){
        imageDialouge(context, imagePath, _nidCard);

      }
      if (imagePath == "_treadLicence") {
        imageDialouge(context, imagePath, _tradeLicence);
      }

    } catch (error) {
      debugPrint(error.toString());
    }
  }
}
