import 'package:flutter/material.dart';
import 'package:hoel_booking_app/utils/alertDialouge.dart';

class EnqueryReport extends StatefulWidget {
  const EnqueryReport({Key? key}) : super(key: key);

  @override
  State<EnqueryReport> createState() => _EnqueryReportState();
}

class _EnqueryReportState extends State<EnqueryReport> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Enquery Report"),
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
        child: Container(
          width: size.width*1 ,
          color: Colors.white70,
          child: Text("NO Data Found"),
        ),
      ),
    );
  }
}
