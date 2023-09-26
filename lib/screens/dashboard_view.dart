import 'package:flutter/material.dart';
import 'package:hoel_booking_app/screens/LoginView.dart';
import 'package:hoel_booking_app/screens/room_availability.dart';
import 'package:hoel_booking_app/screens/booking_request_view.dart';
import 'package:hoel_booking_app/screens/manage_hotel_view.dart';
import 'package:hoel_booking_app/screens/revise_total_room.dart';
import 'package:hoel_booking_app/utils/alertDialouge.dart';
import '../Core/Network/Api/ApiDashBoard.dart';
import '../Model/dashboardResponse.dart';
import '../utils/AppColors.dart';
import '../utils/app_values.dart';
import '../utils/shared_pref_utils.dart';

class DashBoardView extends StatefulWidget{
  const DashBoardView({Key? key}) : super(key: key);

  @override
  State<DashBoardView> createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> {
  //Variable part...
  bool visibility = false;
  DashboardResponse response = DashboardResponse("Loading..","Loading..",0, "Loading..","Loading..", 0,0,"Loading..","Loading..","Loading..", "Loading..","Loading..", "Loading..", "Loading..", "Loading..", "Loading..", "Loading..", "Loading..");


  @override
  initState()  {
    callApiForDashboardData();
    super.initState();
  }

  //code part
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: [
          IconButton(
              onPressed: () {
                OpenDialouge.openDialouge(context);
              },
              icon:const Icon(Icons.filter_list)),
        ],
      ),
      body: Visibility(
        visible: visibility,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
               const SizedBox(height: 5,),
                //hotel name  select service and more design here
                Container(
                  color: Colors.white70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width*0.53,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(response.htl_name ?? 'Add Hotel',style: const TextStyle(fontSize: 18),),
                            const SizedBox(height: 5,),
                            Text(response.htl_address ?? '',style:const TextStyle(fontSize: 15),),
                          ],
                        ),
                      ),
                     // Text("--Select Service--",style: TextStyle(color: AppColor.skyBlue),),
                      const SizedBox(width: 10,),
                      InkWell(onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_) => ManageHotel()));
                      },child:const Icon(Icons.edit))
                    ],
                  ),
                ),
                const SizedBox(height: 5,),
                //Pending earning booking service design here
                Container(
                  height: 80,
                  color: Colors.white70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: AppValues.height_50,
                        width: AppValues.height_80,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColor.yaleBlue),
                          borderRadius: BorderRadius.circular(AppValues.margin_10),
                        ),
                        child: FittedBox(
                          child: Column(
                            children: [
                              const Text("Pending",
                                  style: TextStyle(color: AppColor.yaleBlue)),
                              const SizedBox(height: AppValues.margin_4),
                               Text(response.pending!,
                                  style: const TextStyle(color: AppColor.violet)),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: AppValues.height_50,
                        width: AppValues.height_80,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColor.yaleBlue),
                          borderRadius: BorderRadius.circular(AppValues.margin_10),
                        ),
                        child: FittedBox(
                          child: Column(
                            children: [
                              const Text("Earning",
                                  style: TextStyle(color: AppColor.yaleBlue)),
                              const SizedBox(height: AppValues.margin_4),
                              Text(response.earning!,
                                  style: const TextStyle(color: AppColor.violet)),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: AppValues.height_50,
                        width: AppValues.height_80,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColor.yaleBlue),
                          borderRadius: BorderRadius.circular(AppValues.margin_10),
                        ),
                        child: FittedBox(
                          child: Column(
                            children: [
                              const Text("Booking",
                                  style: TextStyle(color: AppColor.yaleBlue)),
                              const SizedBox(height: AppValues.margin_4),
                              Text(response.booking.toString(),
                                  style: const TextStyle(color: AppColor.violet)),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: AppValues.height_50,
                        width: AppValues.height_80,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColor.yaleBlue),
                          borderRadius: BorderRadius.circular(AppValues.margin_10),
                        ),
                        child: FittedBox(
                          child: Column(
                            children: [
                              const Text("Service",
                                  style: TextStyle(color: AppColor.yaleBlue)),
                              const SizedBox(height: AppValues.margin_4),
                              Text(response.service.toString(),
                                  style: const TextStyle(color: AppColor.violet)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5,),
                //Date Picker  and booking rooms , request design here
                Container(
                  color: Colors.white70,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: AppValues.iconSize_20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(response.date!,
                              style:  const TextStyle(
                                  color: AppColor.skyBlue, fontSize: AppValues.size_14),
                            ),
                            /*const Text(
                              "-select date-",
                              style: TextStyle(
                                  color: AppColor.skyBlue, fontSize: AppValues.size_14),
                            ),*/
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: AppValues.margin_10),
                        child: Column(
                          children: [
                            const Divider(color: AppColor.centerTextColor),
                            ListTile(
                              title: Text(response.totalRoom!),
                              subtitle: Text(response.totalRoomTitel!),
                              trailing: InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (_)=>const ReviseTotalRoom()));
                                },
                                child:const Text("More", style: TextStyle(color: AppColor.yaleBlue)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: AppValues.margin_10),
                        child: Column(
                          children: [
                            const Divider(color: AppColor.centerTextColor),
                            ListTile(
                              title: Text(response.availableRoom!),
                              subtitle: Text(response.availableRoomTitle!),
                              trailing: InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (_)=>const Available_BookedView()));
                                },
                                child:const Text("More", style: TextStyle(color: AppColor.yaleBlue)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: AppValues.margin_10),
                        child: Column(
                          children: [
                            const Divider(color: AppColor.centerTextColor),
                            ListTile(
                              title: Text(response.bookingRequest!),
                              subtitle: Text(response.bookingRequestTitle!),
                              trailing: InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (_)=>const BookingRequestView()));
                                },
                                child:const Text("More", style: TextStyle(color: AppColor.yaleBlue)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      /*Padding(
                        padding: const EdgeInsets.symmetric(vertical: AppValues.margin_10),
                        child: Column(
                          children: [
                            const Divider(color: AppColor.centerTextColor),
                            ListTile(
                              title: Text(response.bookingReview!),
                              subtitle: Text(response.bookingReviewTitle!),
                              trailing: InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (_)=>const BookingHistory()));
                                },
                                child:const Text("More", style: TextStyle(color: AppColor.yaleBlue)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: AppValues.margin_10),
                        child: Column(
                          children: [
                            const Divider(color: AppColor.centerTextColor),
                            ListTile(
                              title: Text(response.wantANewRoom!),
                              subtitle: Text(response.wantANewRoomTItle!),
                              trailing: InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (_)=>const BookingRequistForm()));
                                },
                                child:const Text("More", style: TextStyle(color: AppColor.yaleBlue)),
                              ),
                            ),
                          ],
                        ),
                      ),*/
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Alart Dialouge......

  //Call Api for data..........
  void callApiForDashboardData() async {
    var data = await ApiDashboard().get_Apiresponse();
    if(data == null){
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginPage()));
    }
    else{
      setState(() {
        response = data;
        SharedPrefUtil.writeInt("htl_id", data.htl_id as int);
        visibility = true;
      });
    }
  }
}