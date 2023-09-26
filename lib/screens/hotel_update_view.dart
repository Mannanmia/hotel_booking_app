import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hoel_booking_app/Core/Network/Api/ApiHotelList.dart';
import 'package:image_picker/image_picker.dart';

import '../Core/Network/Api/ApiManageHotel.dart';
import '../Core/Network/Api/ApiUploadPicture.dart';
import '../Model/manageHotelResponse.dart';
import '../utils/AppColors.dart';
import '../utils/toast_utils.dart';

class HotelUpdateView extends StatefulWidget {
  int _hotel_id;
  HotelUpdateView(this._hotel_id);

  @override
  State<HotelUpdateView> createState() => _HotelUpdateViewState(_hotel_id);
}

class _HotelUpdateViewState extends State<HotelUpdateView> {
  int _hotel_id;
  _HotelUpdateViewState(this._hotel_id);
  //Variable part......
  ManageHotelResponse response = ManageHotelResponse("", null, null, null,
      null, null, null, null, null, null,"", null, null, null,null);
  TextEditingController _htl_name_controller = TextEditingController();
  TextEditingController _represen_name_controller = TextEditingController();
  TextEditingController _represen_email_controller = TextEditingController();
  TextEditingController _website_url_controller = TextEditingController();
  TextEditingController _mobile_no_controller = TextEditingController();
  TextEditingController _password_controller = TextEditingController();
  TextEditingController _address_controller = TextEditingController();
  int _apidatacheck = 1;
  File? _idcard;
  File? _treadlicence;
  String _idcard_imageId ="";
  String _treadlicence_image_id ="";
  String _dropdownvalue = 'Select District';
  var _all_district = [
    'Select District',
    'Bagerhat','Bandarban','Barguna','Barisal','Bhola','Bogra','Brahmanbaria','Chandpur','Chittagong','Chuadanga','Comilla','Coxs Bazar','Dhaka','Dinajpur','Faridpur','Feni','Gaibandha','Gazipur','Gopalganj','Habiganj','Jamalpur','Jessore','Jhalokati','Jhenaidah','Joypurhat','Khagrachari','Khulna','Kishoreganj','Kurigram','Kushtia','Lakshmipur','Lalmonirhat','Madaripur','Magura','Manikganj','Maulvibazar','Meherpur','Munshiganj','Mymensingh','Naogaon','Narail','Narayanganj','Narsingdi','Natore','Nawabganj','Netrokona','Nilphamari','Pabna','Panchagarh','Patuakhali','Pirojpur','Rajbari','Rajshahi','Rangamati','Rangpur','Satkhira','Shariatpur','Sherpur','Sirajgonj','Sunamganj','Sylhet','Tangail','Thakurgaon'
  ];

  @override
  void initState() {
    callApiForManagehotelData(_hotel_id);
    (response.title == null)
        ? TextEditingController()
        : _htl_name_controller.text = response.title!;
    (response.rep_name == null)
        ? TextEditingController()
        : _represen_name_controller.text = response.rep_name!;
    (response.rep_email == null)
        ? TextEditingController()
        : _represen_email_controller.text = response.rep_email!;
    (response.rep_url == null)
        ? TextEditingController()
        : _website_url_controller.text = response.rep_url!;
    (response.rep_mobile == null)
        ? TextEditingController()
        : _mobile_no_controller.text = response.rep_mobile!;
    // _password_controller.text  = ""
    (response.address == null)
        ? TextEditingController()
        : _address_controller.text = response.address!;
    //_district_controller.text = response.
    (response.district == null)
        ? _dropdownvalue = 'Select District'
        : _dropdownvalue = response.district!;
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Hotel"),
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
                        response.title ?? 'Add Hotel',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        response.address ?? 'Address Not Found',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  Text("--Select Service--",style: TextStyle(color: AppColor.skyBlue),),
                ],
              ),
            ),
            SizedBox(height: 5,),
            Expanded(child:Container(
              color: Colors.white70,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //view iteams implement here
                    itemTextFieldBuild(size, "Hotel Name", "See Palace",_htl_name_controller),
                    SizedBox(height: 5,),
                    itemTextFieldBuild(size, "Representative Name:", "Md. Adnan Khan",_represen_name_controller),
                    SizedBox(height: 5,),
                    itemTextFieldBuild(size, "Email Address : ", "adnan123@yahoo.com",_represen_email_controller),
                    SizedBox(height: 5,),
                    itemTextFieldBuild(size, "Website Url :", "seeplace.com",_website_url_controller),
                    SizedBox(height: 5,),
                    itemTextFieldBuild(size, "Mobile Number : ", "01713424242",_mobile_no_controller),
                    SizedBox(height: 5,),
                    //Id card Picker call here
                    Row(
                      children: [
                        Container(
                          child: Text("ID Card :",style: TextStyle(fontSize: 15),),
                          width:size.width*.33,
                          height: 40,),
                        Container(
                          child: (_idcard == null)
                              ? MaterialButton(
                            color: Colors.white70,
                            onPressed: () {
                              imagePickerOption(context, "_idcard");
                            },
                            child: Text("Browse"),
                          )
                              : Text(
                            _idcard.toString().split("/").last,
                            style: TextStyle(fontSize: 15),
                          ),
                          width: size.width * .62,
                          height: 40,
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    //Tread Licence design
                    Row(
                      children: [
                        Container(
                          child: Text("Tread Licence :",style: TextStyle(fontSize: 15),),
                          width:size.width*.33,
                          height: 40,),
                        Container(
                          child: (_treadlicence == null)
                              ? MaterialButton(
                            color: Colors.white70,
                            onPressed: () {
                              imagePickerOption(context, "_treadlicence");
                            },
                            child: Text("Browse"),
                          )
                              : Text(_treadlicence.toString().split("/").last),
                          width: size.width * .62,
                          height: 40,
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    itemTextFieldBuild(size, "Password : ", "testygool",_password_controller),
                    SizedBox(height: 5,),
                    itemTextFieldBuild(size, "Address : ", "12/3-East Ibrahimpur,Dhaka",_address_controller),
                    SizedBox(height: 5,),
                    //Location picker here.....
                    Row(
                      children: [
                        Container(
                          child: Text("Google Location :",style: TextStyle(fontSize: 15),),
                          width:size.width*.33,
                          height: 40,),
                        Container(
                          child: Text(
                            "Lat : " +
                                response.map_lat.toString() +
                                " lan : " +
                                response.map_lng.toString(),
                            style: TextStyle(fontSize: 15),
                          ),
                          width: size.width * .62,
                          height: 40,
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Text("District : ",style: TextStyle(fontSize: 20),),
                        SizedBox(width: size.width*.05,),
                        DropdownButton(
                          value: _dropdownvalue,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: _all_district.map((items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),

                          onChanged: (String? newValue) {
                            setState(() {
                              _dropdownvalue = newValue!;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            setState(() {
                              _idcard = null;
                              _treadlicence = null;
                              _htl_name_controller.clear();
                              _represen_name_controller.clear();
                              _represen_email_controller.clear();
                              _website_url_controller.clear();
                              _mobile_no_controller.clear();
                              _password_controller.clear();
                              _address_controller.clear();
                            });
                          },
                          child: Text("Reset"),
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        MaterialButton(
                          onPressed: () {
                            postApiManageData();
                          },
                          child: Text("Submit"),
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
  //All Iteams ar build here.....to get input
  Widget itemTextFieldBuild(Size size,String name , String hintText,TextEditingController controller){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Text(name,style: TextStyle(fontSize: 15),),
          width:size.width*.33,),
        Container(
            height: 40,
            width: size.width * .62,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: hintText,
              ),
            )),
      ],
    );
  }

  // Image Picker Option is Implemented here......
  void imagePickerOption(BuildContext context, String imagePath) {
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
      File tempImage = File(photo.path);
      var image_id = await ApiImageUpload().singleImageUpload(context,tempImage);
      setState((){
        if(imagePath == "_idcard"){
          _idcard = tempImage;
          _idcard_imageId = image_id!;
        }
        if (imagePath == "_treadlicence") {
          _treadlicence = tempImage;
          _treadlicence_image_id = image_id!;
        }
      });
      ToastUtil.showShortToast("Image Uploaded Successfully");
      Navigator.pop(context);
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  //Api Call for data
  void callApiForManagehotelData(int htl_id) async {

    //Api Implement here
    var data = await ApiManageHotel().get_ApiHotelById(htl_id);
    if (data != null && _apidatacheck == 1) {
      setState(() {
        _apidatacheck = 2;
        response = data;
        initState();
      });
    }
  }

  //Api Post Data
  void postApiManageData() {
    if(_htl_name_controller.text ==""||_address_controller.text == ""){
      ToastUtil.showShortToast("Required All Fiels");
    }else{
        TotalHoteltList().postApiUpdateHotel(context,_hotel_id,_htl_name_controller.text,_represen_name_controller.text,_represen_email_controller.text,_website_url_controller.text,_mobile_no_controller.text,_idcard_imageId,_treadlicence_image_id,_address_controller.text);
    }
  }

}
