import 'package:flutter/material.dart';
import 'package:hoel_booking_app/Core/Network/Api/reviceTOtalRoom.dart';
import 'package:hoel_booking_app/Model/room_response.dart';

class ShowRoomDetails extends StatefulWidget {
  int _roomId;
  ShowRoomDetails(this._roomId);

  @override
  State<ShowRoomDetails> createState() => _ShowRoomDetailsState(_roomId);
}

class _ShowRoomDetailsState extends State<ShowRoomDetails> {
  //variable part
  int _roomId;
  _ShowRoomDetailsState(this._roomId);
  bool visibility = false;
  @override
  void initState() {
    Future.delayed(Duration.zero,(){
      callApiRoomData ();
    });
    super.initState();
  }
  RoomResponse res = RoomResponse("", "","","","","","","");


  //codepart
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Room Detais"),
      ),
      body: Visibility(
        visible: visibility,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: size.height*0.25,
                    child: Image.network(res.image),
                  ),
                  SizedBox(height: 5,),
                  Text("Titel : "+res.titel,style: TextStyle(fontSize: 18),),
                  SizedBox(height: 5,),
                  Text((res.content ==null)?"Content : Content Not Found":"Content : ${res.content}",style: TextStyle(fontSize: 18),),
                  SizedBox(height: 5,),
                  Text("Price : "+res.prince,style: TextStyle(fontSize: 18),),
                  SizedBox(height: 5,),
                  Text("Beads : "+res.bead,style: TextStyle(fontSize: 18),),
                  SizedBox(height: 5,),
                  Text("Rome Size : "+res.size,style: TextStyle(fontSize: 18),),
                  SizedBox(height: 5,),
                  Text("Adult  : "+res.adult,style: TextStyle(fontSize: 18),),
                  SizedBox(height: 5,),
                  Text("Children : "+res.childern,style: TextStyle(fontSize: 18),),
                  SizedBox(height: 5,),
                ],
          ),
        ),
      ),
    );
  }

  void callApiRoomData() async{
    RoomResponse? data =await TotalRoomList().getApiRoom(context,_roomId );
    print(data);
    setState(() {
      res = data!;
      visibility= true;
    });
  }
}
