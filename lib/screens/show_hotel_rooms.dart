import 'package:flutter/material.dart';

class ShowHotelRooms extends StatefulWidget {

  @override
  State<ShowHotelRooms> createState() => _ShowHotelRoomsState();
}

class _ShowHotelRoomsState extends State<ShowHotelRooms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hotel Rooms"),
      ),
      body: Center(
        child: Text("Hotel Rooms are not Found.",style: TextStyle(fontSize: 20,color: Colors.black),),
      ),
    );
  }
}
