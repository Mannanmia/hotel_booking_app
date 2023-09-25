import 'package:flutter/material.dart';

import '../utils/alertDialouge.dart';

class TourBookingReportView extends StatefulWidget {
  const TourBookingReportView({Key? key}) : super(key: key);

  @override
  State<TourBookingReportView> createState() => _TourBookingReportViewState();
}

class _TourBookingReportViewState extends State<TourBookingReportView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking Report"),
        actions: [
          IconButton(onPressed: () {
            OpenDialouge.openDialouge(context);
          }, icon: Icon(Icons.filter_list)),
        ],
      ),
      body: Center(
        child: Text("No Booking Found",style: TextStyle(fontSize: 20),),
      ),
    );
  }
}
