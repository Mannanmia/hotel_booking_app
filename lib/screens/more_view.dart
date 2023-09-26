import 'package:flutter/material.dart';
import 'package:hoel_booking_app/Core/Network/Api/profile_response.dart';
import 'package:hoel_booking_app/Model/profile_response.dart';
import 'package:hoel_booking_app/screens/room_availability.dart';
import 'package:hoel_booking_app/screens/booking_history.dart';
import 'package:hoel_booking_app/screens/career_List_view.dart';
import 'package:hoel_booking_app/screens/career_add_view.dart';
import 'package:hoel_booking_app/screens/career_application_view.dart';
import 'package:hoel_booking_app/screens/career_approval_list.dart';
import 'package:hoel_booking_app/screens/changePassword_view.dart';
import 'package:hoel_booking_app/screens/enqueryReport.dart';
import 'package:hoel_booking_app/screens/event_List_View.dart';
import 'package:hoel_booking_app/screens/event_booking_repost_view.dart';
import 'package:hoel_booking_app/screens/event_list_add_view.dart';
import 'package:hoel_booking_app/screens/hotel_add_view.dart';
import 'package:hoel_booking_app/screens/hotel_list_view.dart';
import 'package:hoel_booking_app/screens/myWallet.dart';
import 'package:hoel_booking_app/screens/my_profile_view.dart';
import 'package:hoel_booking_app/screens/payouts_view.dart';
import 'package:hoel_booking_app/screens/tour_List_View.dart';
import 'package:hoel_booking_app/screens/tour_availability_view.dart';
import 'package:hoel_booking_app/screens/tour_booking_report_view.dart';
import 'package:hoel_booking_app/screens/tour_list_add_view.dart';
import 'package:hoel_booking_app/screens/varification_data_view.dart';
import 'package:hoel_booking_app/utils/AppColors.dart';
import 'package:expandable/expandable.dart';

import '../utils/alertDialouge.dart';
import 'event_availibility_view.dart';

class MoreView extends StatefulWidget {
  const MoreView({Key? key}) : super(key: key);

  @override
  State<MoreView> createState() => _MoreViewState();
}

class _MoreViewState extends State<MoreView> {
  GetProfileResponse? res;

  @override
  void initState() {
    getProfileData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("More"),
        actions: [
          IconButton(onPressed: () {
            OpenDialouge.openDialouge(context);
          }, icon: Icon(Icons.filter_list)),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: AppColor.moreColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.white70,
                child: Row(
                  children: [
                    Container(
                      height: size.height * .2,
                      width: size.width *0.4,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          child: (res?.data?.avatarUrl == null)? Image.asset("images/launcher_icon.png"):
                          Image.network(res!.data!.avatarUrl!,),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Vendor",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(
                          height: size.height * .01,
                        ),
                        Text(
                          res?.data?.name ?? "",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(
                          height: size.height * .01,
                        ),
                        Text(
                          "Member science Oct 2021",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              SizedBox(
                height: size.height * .01,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(size.width*0.015, 0, 0, 0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => MyWallet()));
                  },
                  color: AppColor.moreColor,
                  textColor: Colors.white,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "My Wallet",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * .01,
              ),
              BuiltCard("Manage Hotel", size, "All Hotels", "Add Hotel",
                  "Availability","Booking Reports"),
              BuiltCard("Manage Package", size, "All Packages", "Add Package",
                  "Availability", "Booking Reports"),
              BuiltCard("Manage Career", size, "All Careers", "Add Career",
                  "Career Applications", "Approval List"),
              BuiltCard("Manage Event", size, "All Events", "Add Event",
                  "Availability", "Booking Reports"),
              Padding(
                padding: EdgeInsets.fromLTRB(size.width*0.015, 0, 0, 0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => EnqueryReport()));
                  },
                  color:  AppColor.moreColor,
                  textColor: Colors.white,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Enquiry Reports",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(size.width*0.015, 0, 0, 0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => PayoutsView()));
                  },
                  color: AppColor.moreColor,
                  textColor: Colors.white,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Payouts",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(size.width*0.015, 0, 0, 0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => VerificationView()));
                  },
                  color: AppColor.moreColor,
                  textColor: Colors.white,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Verifications",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(size.width*0.015, 0, 0, 0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => MyProfile()));
                  },
                  color: AppColor.moreColor,
                  textColor: Colors.white,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "My Profile",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(size.width*0.015, 0, 0, 0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => ChangePassowrd()));
                  },
                  color: AppColor.moreColor,
                  textColor: Colors.white,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Change Password",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(size.width*0.015, 0, 0, 0),
                child: MaterialButton(
                  onPressed: () {
                    OpenDialouge.openDialouge(context);
                  },
                  color:AppColor.moreColor,
                  textColor: Colors.white,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Log Out",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  void getProfileData() async{
    var data =await ApiProfileData().getProfile();
    setState(() {
      res = data! as GetProfileResponse;
    });
  }

  Widget BuiltCard(String titel, Size size, String data1, String data2,
          String data3, String data4) =>
      Padding(
          padding: EdgeInsets.all(8.0),
          child: Card(
            color: AppColor.moreColor,
            child: ExpandablePanel(
              header: Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Text(
                  "$titel",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              collapsed: Container(),
              expanded: Column(
                children: [
                  Container(
                    width: size.width * 1,
                    child: MaterialButton(
                      onPressed: () {
                        OnPressed(titel, data1);
                      },
                      color: Colors.indigo,
                      textColor: Colors.white,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                            child: Text(data1)),
                      ),
                    ),
                  ),
                  Container(
                    width: size.width * 1,
                    child: MaterialButton(
                      onPressed: () {
                        OnPressed(titel, data2);
                      },
                      color: Colors.indigo,
                      textColor: Colors.white,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                            child: Text(data2)),
                      ),
                    ),
                  ),
                  Container(
                    width: size.width * 1,
                    child: MaterialButton(
                      onPressed: () {
                        OnPressed(titel, data3);
                      },
                      color: Colors.indigo,
                      textColor: Colors.white,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                            child: Text(data3)),
                      ),
                    ),
                  ),
                  Container(
                    width: size.width * 1,
                    child: MaterialButton(
                      onPressed: () {
                        OnPressed(titel, data4);
                      },
                      color: Colors.indigo,
                      textColor: Colors.white,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                            child: Text(data4)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ));

  void OnPressed(String titel, String data) {
    switch (titel) {
      case "Manage Package":
        {
          switch (data) {
            case "All Packages":
              {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) =>const TourListView()));
              }
              break;
            case "Add Package":
              {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) =>const AddTourList()));
              }
              break;
            case "Availability":
              {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) =>const TourAvailabilityView()));
              }
              break;
            case "Booking Reports":
              {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) =>const TourBookingReportView()));
              }
              break;
          }
        }
        break;
      case "Manage Career":
        {
          switch (data) {
            case "All Careers":
              {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) =>CareerListView()));
              }
              break;
            case "Add Career":
              {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) =>const AddCarrerView()));
              }
              break;
            case "Career Applications":
              {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) =>const CareerApplicationView()));
              }
              break;
            case "Approval List":
              {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) =>const CareerApprovalList()));
              }
              break;
          }
        }
        break;
      case "Manage Event":
        {
          switch (data) {
            case "All Events":
              {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) =>const EventListView()));
              }
              break;
            case "Add Event":
              {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) =>const AddEventList()));
              }
              break;
            case "Availability":
              {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => EventAvailibilityView()));
              }
              break;
            case "Booking Reports":
              {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) =>const EventBookingReportView()));
              }
              break;
          }
        }
        break;
      case "Manage Hotel":
        {
          switch (data){
            case "All Hotels":
              {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) =>const HotelListView()));
              }
              break;
            case "Add Hotel":
              {
                Navigator.push(
                    context,MaterialPageRoute(builder: (_) =>const HotelAddView()));
              }
              break;
            case "Availability":
              {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) =>const Available_BookedView()));
              }
              break;
            case "Booking Reports":
              {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) =>const BookingHistory()));
              }
            break;
          }
        }
        break;
    }
  }
}
