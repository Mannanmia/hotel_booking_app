import 'package:flutter/material.dart';

import '../utils/alertDialouge.dart';

class CareerApprovalList extends StatefulWidget {
  const CareerApprovalList({Key? key}) : super(key: key);

  @override
  State<CareerApprovalList> createState() => _CareerApprovalListState();
}

class _CareerApprovalListState extends State<CareerApprovalList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Approval List"),
        actions: [
          IconButton(
              onPressed: () {
                OpenDialouge.openDialouge(context);
              },
              icon: Icon(Icons.filter_list)),
        ],
      ),
      body: Center(
        child: Text("NO Data Found"),
      ),
    );
  }
}
