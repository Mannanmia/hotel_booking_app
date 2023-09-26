import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hoel_booking_app/Core/Network/Api/ApiManageHotel.dart';
import 'package:hoel_booking_app/Core/Network/Api/ApiUploadPicture.dart';
import 'package:hoel_booking_app/Model/manageHotelResponse.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import '../utils/AppColors.dart';
import '../utils/alertDialouge.dart';
import '../utils/toast_utils.dart';


class ManageHotel extends StatelessWidget {
  const ManageHotel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manage Hotel"),
        actions: [
          IconButton(
              onPressed: () {
                OpenDialouge.openDialouge(context);
              },
              icon:const Icon(Icons.filter_list)),
        ],
      ),
      body: ManageHotelView(),
    );
  }
}

class ManageHotelView extends StatefulWidget {
  const ManageHotelView({Key? key}) : super(key: key);

  @override
  State<ManageHotelView> createState() => _ManageHotelViewState();
}

class _ManageHotelViewState extends State<ManageHotelView> {
  //Variable part......
  ManageHotelResponse response = ManageHotelResponse("", null, null, null,
      null, null, null, null, null, null,"", null, null, null);
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
    callApiForManagehotelData();
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
  }

  //Code part........
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
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
                // Text("--Select Service--",style: TextStyle(color: AppColor.skyBlue),),
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
                        child: MaterialButton(
                                color: Colors.white70,
                                onPressed: () {
                                  imageDialouge(context, "_idcard",_idcard);
                                },
                                child: Text("Browse"),
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
                        child:MaterialButton(
                                color: Colors.white70,
                                onPressed: () {
                                  imageDialouge(context,"_treadlicence",_treadlicence);
                                },
                                child: Text("Browse"),
                              ),
                        width: size.width * .62,
                        height: 40,
                      ),
                    ],
                  ),
                  // SizedBox(height: 5,),
                  // itemTextFieldBuild(size, "Password : ", "testygool",_password_controller),
                  SizedBox(height: 5,),
                  itemTextFieldBuild(size, "Address : ", "12/3-East Ibrahimpur,Dhaka",_address_controller),
                  SizedBox(height: 15,),
                  //Location picker here.....
                  Row(
                    children: [
                      Container(
                        child: Text("Google Location :",style: TextStyle(fontSize: 15),),
                        width:size.width*.33,
                        height: 40,),
                      Container(
                        child:(response.map_lng == null)?MaterialButton(onPressed: () async{
                             var data = await getGoogleLocation();
                             setState(() {
                               response.map_lat = data.latitude.toString();
                               response.map_lng= data.longitude.toString();
                             });
                        },child: Text("Pick Location"),color: Colors.white70,):InkWell(
                          child: Text(
                            "Lat : " +
                                response.map_lat! +
                                " lan : " +
                                response.map_lng!,
                            style: TextStyle(fontSize: 15),
                          ),
                          onTap: () async{
                              var data = await getGoogleLocation();
                             setState(() {
                               response.map_lat = data.latitude.toString();
                               response.map_lng= data.longitude.toString();
                             });
                          },
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
                            response.map_lng=null;
                            response.map_lat = null;
                          });
                        },
                        child: Text("Reset",style: TextStyle(color: Colors.white),),
                        color: AppColor.naviBlue,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      MaterialButton(
                        onPressed: () {
                          postApiManageData();
                        },
                        child: Text("Submit",style: TextStyle(color: Colors.white),),
                        color: AppColor.naviBlue,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
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
                          if(imagePath == "_idcard"){
                            _idcard_imageId = image_id!;
                          }
                          if (imagePath == "_treadlicence") {
                           _treadlicence_image_id = image_id!;
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
        if(imagePath == "_idcard"){
          _idcard = tempImage;
        }
        if (imagePath == "_treadlicence") {
          _treadlicence = tempImage;
        }
      });
      Navigator.pop(context);
      if(imagePath == "_idcard"){
       imageDialouge(context, imagePath, _idcard);

      }
      if (imagePath == "_treadlicence") {
       imageDialouge(context, imagePath, _treadlicence);
      }

    } catch (error) {
      debugPrint(error.toString());
    }
  }

  //Api Call for data
  void callApiForManagehotelData() async {
    var data = await ApiManageHotel().get_ApiHotel();
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
     ApiManageHotel().postApiUpdateHotel(context,_htl_name_controller.text,_represen_name_controller.text,_represen_email_controller.text,_website_url_controller.text,_mobile_no_controller.text,_idcard_imageId,_treadlicence_image_id,_address_controller.text,_dropdownvalue);
  }
}
