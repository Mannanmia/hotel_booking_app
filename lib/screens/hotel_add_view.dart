import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hoel_booking_app/Core/Network/Api/ApiHotelList.dart';
import 'package:hoel_booking_app/utils/AppColors.dart';
import 'package:image_picker/image_picker.dart';
import '../Core/Network/Api/ApiUploadPicture.dart';
import '../utils/alertDialouge.dart';
import '../utils/toast_utils.dart';

class HotelAddView extends StatefulWidget {
  const HotelAddView({Key? key}) : super(key: key);

  @override
  State<HotelAddView> createState() => _HotelAddViewState();
}

class _HotelAddViewState extends State<HotelAddView> {
    //Variable Part.................
  TextEditingController _htl_name_controller = TextEditingController();
  TextEditingController _represen_name_controller = TextEditingController();
  TextEditingController _represen_email_controller = TextEditingController();
  TextEditingController _website_url_controller = TextEditingController();
  TextEditingController _mobile_no_controller = TextEditingController();
  TextEditingController _address_controller = TextEditingController();
  TextEditingController _hotel_content = TextEditingController();
  TextEditingController _hotel_youtubelink = TextEditingController();
  TextEditingController _hotel_checkIn = TextEditingController();
  TextEditingController _hotel_checkOut = TextEditingController();
  TextEditingController _hotel_mindaybefor = TextEditingController();
  TextEditingController _hotel_mindayStay = TextEditingController();
  TextEditingController _hotel_price = TextEditingController();
  TextEditingController _hotel_sell_price = TextEditingController();
  String _dropdownvalue = 'Select District';
  var _all_district = [
    'Select District',
    'Bagerhat','Bandarban','Barguna','Barisal','Bhola','Bogra','Brahmanbaria','Chandpur','Chittagong','Chuadanga','Comilla','Coxs Bazar','Dhaka','Dinajpur','Faridpur','Feni','Gaibandha','Gazipur','Gopalganj','Habiganj','Jamalpur','Jessore','Jhalokati','Jhenaidah','Joypurhat','Khagrachari','Khulna','Kishoreganj','Kurigram','Kushtia','Lakshmipur','Lalmonirhat','Madaripur','Magura','Manikganj','Maulvibazar','Meherpur','Munshiganj','Mymensingh','Naogaon','Narail','Narayanganj','Narsingdi','Natore','Nawabganj','Netrokona','Nilphamari','Pabna','Panchagarh','Patuakhali','Pirojpur','Rajbari','Rajshahi','Rangamati','Rangpur','Satkhira','Shariatpur','Sherpur','Sirajgonj','Sunamganj','Sylhet','Tangail','Thakurgaon'
  ];
  File? _idcard;
  File? _treadlicence;
  String _idcard_imageId ="";
  String _treadlicence_image_id ="";
  File? _htlImage;
  File? _htlFeatureImage;
  String _htlImage_id ="";
  String _featured_image_id ="";
  String map_lat = "null";
  String map_lng= "null";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Hotel"),
        actions: [
          IconButton(
              onPressed: () {
                OpenDialouge.openDialouge(context);
              },
              icon: Icon(Icons.filter_list)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 5,),
            Expanded(child:Container(
              color: Colors.white70,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //view iteams implement here
                    itemTextFieldBuild(size, "Hotel Name", "See Palace",_htl_name_controller),
                    SizedBox(height: 5,),
                    itemTextFieldBuild(size, "Content", "Something about hotel",_hotel_content),
                    SizedBox(height: 5,),
                    itemTextFieldBuild(size, "Youtube Link", "youtube.com/sumith",_hotel_youtubelink),
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
                          child: Text("NID Card :",style: TextStyle(fontSize: 15),),
                          width:size.width*.33,
                          height: 40,),
                        Container(
                          child:MaterialButton(
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
                          child: MaterialButton(
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
                    SizedBox(height: 5,),
                    //Id card Picker call here
                    Row(
                      children: [
                        Container(
                          child: Text("Hotel Image :",style: TextStyle(fontSize: 15),),
                          width:size.width*.33,
                          height: 40,),
                        Container(
                          child:MaterialButton(
                            color: Colors.white70,
                            onPressed: () {
                              imageDialouge(context, "hotel_image",_htlImage);
                            },
                            child: Text("Browse"),
                          ),
                          width: size.width * .62,
                          height: 40,
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    //Id card Picker call here
                    Row(
                      children: [
                        Container(
                          child: Text("Fetured Image :",style: TextStyle(fontSize: 15),),
                          width:size.width*.33,
                          height: 40,),
                        Container(
                          child:MaterialButton(
                            color: Colors.white70,
                            onPressed: () {
                              imageDialouge(context, "FeturedImage",_htlFeatureImage);
                            },
                            child: Text("Browse"),
                          ),
                          width: size.width * .62,
                          height: 40,
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: size.height*0.05,
                          width: size.width*.45,
                          child: TextField(
                            controller: _hotel_checkIn,
                            decoration: InputDecoration(
                              hintText: "11:30",
                              labelText: "Time For Check In",
                              border: OutlineInputBorder(),),
                          ),
                        ),
                        Container(
                          height: size.height*0.05,
                          width: size.width*.45,
                          child: TextField(
                            controller: _hotel_checkOut,
                            decoration: InputDecoration(
                              hintText: "11:00",
                              labelText: "Time For Check Out",
                              border: OutlineInputBorder(),),
                          ),
                        ),
                      ],),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: size.height*0.05,
                          width: size.width*.45,
                          child: TextField(
                            controller: _hotel_mindaybefor,
                            decoration: InputDecoration(
                              hintText: "Ex-3",
                              labelText: "Min Day Before Booking",
                              border: OutlineInputBorder(),),
                          ),
                        ),
                        Container(
                          height: size.height*0.05,
                          width: size.width*.45,
                          child: TextField(
                            controller: _hotel_mindayStay,
                            decoration: InputDecoration(
                              hintText: "Ex-2",
                              labelText: "Min Day Stay",
                              border: OutlineInputBorder(),),
                          ),
                        ),
                      ],),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: size.height*0.05,
                          width: size.width*.45,
                          child: TextField(
                            controller: _hotel_price,
                            decoration: InputDecoration(
                              hintText: "10000Tk",
                              labelText: "Hotel Cost",
                              border: OutlineInputBorder(),),
                          ),
                        ),
                        Container(
                          height: size.height*0.05,
                          width: size.width*.45,
                          child: TextField(
                            controller: _hotel_sell_price,
                            decoration: InputDecoration(
                              hintText: "15000Tk",
                              labelText: "Sale Hotel Price",
                              border: OutlineInputBorder(),),
                          ),
                        ),
                      ],),
                    SizedBox(height: 5,),
                    itemTextFieldBuild(size, "Address : ", "12/3-East Ibrahimpur,Dhaka",_address_controller),
                    SizedBox(height: 5,),
                    //Location picker here.....
                    Row(
                      children: [
                        Container(
                          child: Text("Google Location :",style: TextStyle(fontSize: 15),),
                          width:size.width*.33,
                          height: size.height*0.04,),
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
                          height: size.height*0.04,
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
                              _address_controller.clear();
                               map_lat = "null";
                               map_lng= "null";
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
                          child: Text("Add Hotel",style: TextStyle(color: Colors.white),),
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
      )
    );
  }

  Widget itemTextFieldBuild(Size size,String name , String hintText,TextEditingController controller){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Text(name,style: TextStyle(fontSize: 15),),
          width:size.width*.33,),
        Container(
            height: size.height*0.05,
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
                        if(imagePath == "hotel_image"){
                          _htlImage_id = image_id!;
                        }
                        if(imagePath == "FeturedImage"){
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
        if(imagePath == "_idcard"){
          _idcard = tempImage;
        }
        if (imagePath == "_treadlicence") {
          _treadlicence = tempImage;
        }
        if(imagePath == "hotel_image"){
          _htlImage = tempImage;
        }
        if(imagePath =="FeturedImage"){
          _htlFeatureImage = tempImage;
        }
      });
      Navigator.pop(context);
      if(imagePath == "_idcard"){
        imageDialouge(context, imagePath, _idcard);

      }
      if (imagePath == "_treadlicence") {
        imageDialouge(context, imagePath, _treadlicence);
      }
      if(imagePath == "hotel_image"){
        imageDialouge(context, imagePath, _htlImage);
      }
      if(imagePath =="FeturedImage"){
        imageDialouge(context, imagePath, _htlFeatureImage);
      }

    } catch (error) {
      debugPrint(error.toString());
    }
  }

  void postApiManageData() {
    if(_htl_name_controller.text ==""||_address_controller.text == ""){
      ToastUtil.showShortToast("Required All Fiels");
    }else{
      TotalHoteltList().postApiAddHotel(context,_htl_name_controller.text,_represen_name_controller.text,_represen_email_controller.text,_website_url_controller.text,_mobile_no_controller.text,_idcard_imageId,_treadlicence_image_id,_address_controller.text,
      _hotel_content.text,_hotel_youtubelink.text,_htlImage_id,_featured_image_id,_hotel_checkIn.text,_hotel_checkOut.text,
      _hotel_mindaybefor.text,_hotel_mindayStay.text,_hotel_price.text,_hotel_sell_price.text,map_lat,map_lng);
    }
  }
}
