import 'package:flutter/material.dart';

import '../utils/alertDialouge.dart';

class EventBookingReportView extends StatefulWidget {
  const EventBookingReportView({Key? key}) : super(key: key);

  @override
  State<EventBookingReportView> createState() => _EventBookingReportViewState();
}

class _EventBookingReportViewState extends State<EventBookingReportView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking Report"),
        actions: [
          IconButton(
              onPressed: () {
                OpenDialouge.openDialouge(context);
              },
              icon: Icon(Icons.filter_list)),
        ],
      ),
      body: Center(
        child: Text("No Booking Found",style: TextStyle(fontSize: 20),),
      ),
    );
  }
}
