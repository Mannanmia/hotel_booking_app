import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hoel_booking_app/Core/Network/Api/reviceTOtalRoom.dart';
import 'package:hoel_booking_app/screens/booking_history.dart';
import 'package:hoel_booking_app/screens/dashboard_view.dart';
import 'package:hoel_booking_app/screens/more_view.dart';
import 'room_availability.dart';
import 'booking_request_view.dart';

class DashBoardNavigationBar extends StatefulWidget{
  @override
  State<DashBoardNavigationBar> createState() => _DashBoardNavigationBarState();
}

// Bottom Navigation Design here
class _DashBoardNavigationBarState extends State<DashBoardNavigationBar> {
  int navigation_state =0;

  //Variable Part

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }
  final screens = [
    DashBoardView(),                    //0
    BookingRequestView(),               //1
    BookingHistory(),                   //2
    Available_BookedView(),             //3
    MoreView(),                         //4
  ];

  //Code Part
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // DashBoard View.......
      body:screens[navigation_state],

      //Bottom Navigion Var...........
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigation_state,

        onTap: (index) {
          setState(() {
            navigation_state = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          label: "DashBoard",
        ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_outlined),
            label: "Request",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Booking"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.calendar), label: "Availability"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.more_horiz,
              ),
              label: "More"),
        ],
      ),
    );
  }
}



