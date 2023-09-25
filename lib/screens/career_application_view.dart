import 'package:flutter/material.dart';
import '../utils/alertDialouge.dart';

class CareerApplicationView extends StatefulWidget {
  const CareerApplicationView({Key? key}) : super(key: key);

  @override
  State<CareerApplicationView> createState() => _CareerApplicationViewState();
}

class _CareerApplicationViewState extends State<CareerApplicationView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Career Application"),
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
            Row(
              children: [
                Container(
                  width: size.width*0.23,
                    child: Text("Application")),
                Container(
                  width: size.width*0.23,
                    child: Text("Date")),
                Container(
                  width: size.width*0.23,
                    child: Text("Cv")),
                Container(
                  width: size.width*0.23,
                    child: Text("Status")),
              ],
            ),
            SizedBox(height: size.height*0.02,),
            Row(
              children: [
                Container(
                  width: size.width*0.23,
                    child: Text("Dev.MH ")),
                Container(
                  width: size.width*0.23,
                    child: Text("08/10/2022")),
                Container(
                  width: size.width*0.23,
                    child: Text("Not Found!")),
                Container(
                  width: size.width*0.23,
                    child: Column(
                      children: [
                        Text("Accepted"),
                        MaterialButton(onPressed: (){},child: Text("Details"),color: Colors.white70,)
                      ],
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
