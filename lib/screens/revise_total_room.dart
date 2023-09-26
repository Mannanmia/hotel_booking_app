import 'package:flutter/material.dart';
import 'package:hoel_booking_app/Core/Network/Api/reviceTOtalRoom.dart';
import 'package:hoel_booking_app/screens/room_view.dart';
import 'package:hoel_booking_app/screens/update_room_features.dart';
import 'package:hoel_booking_app/utils/toast_utils.dart';
import '../Model/totalRoomResponse.dart';
import '../utils/alertDialouge.dart';

class ReviseTotalRoom extends StatefulWidget {
  const ReviseTotalRoom({Key? key}) : super(key: key);

  @override
  State<ReviseTotalRoom> createState() => _ReviseTotalRoomState();
}

class _ReviseTotalRoomState extends State<ReviseTotalRoom> {
  //Variable part here .....
  List<RoomsResponse> _rooms=[] ;
  var _htlname ="";

  @override
  void initState() {
    Future.delayed(Duration.zero,(){
      callApiRoomList();
    });
  }
  //Code Part......
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Revise Total Room"),
        actions: [
          IconButton(onPressed: () {
            OpenDialouge.openDialouge(context);
          }, icon: Icon(Icons.filter_list)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              color: Colors.white70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _htlname,
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                /*  Text(
                    "--Select Service--",
                    style: TextStyle(color: AppColor.skyBlue),
                  ),*/
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: _rooms.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: itemCard(size,index),
                    );
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        child: Text("+"),
      ),
    );
  }

  //List View Items create here............
  Widget itemCard(Size size,int index) {
    return Container(
      color: Colors.white70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                  height: size.height*.20,
                  width: size.width*.20,
                  child:(_rooms[index].image_url == null)? Image(image: AssetImage("images/app-logo.png"))
                      :Image.network(_rooms[index].image_url!,fit: BoxFit.fill,)),
              SizedBox(width: 10,),
              Container(
                width: size.width*.72,
                child: FittedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_rooms[index].title!,style: TextStyle(fontSize: 20),),
                      Text("Room Number : "+_rooms[index].number!,style: TextStyle(fontSize: 20),),
                      Text("Price : "+_rooms[index].price!,style: TextStyle(fontSize: 20),),
                      Text("Status : "+_rooms[index].status!,style: TextStyle(fontSize: 20),),
                      Text("Last Update : 10/5/2022 23:25",style: TextStyle(fontSize: 20),),
                      Row(children: [
                        MaterialButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> ShowRoomDetails(_rooms[index].id!)));
                        },
                        child: Text("View"),
                        color: Colors.blueAccent,),
                        MaterialButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> UpdateRoomFeature()));
                        },
                          child: Text("Edit"),
                        color: Colors.yellowAccent,),
                        MaterialButton(onPressed: (){
                          callApiDeleteRoom(_rooms[index].id!);
                        },
                          child: Text("Del"),
                        color: Colors.redAccent,),
                        MaterialButton(onPressed: (){
                          ToastUtil.showShortToast("Hiding");
                        },
                          child: Text("Make hide"),
                        color: Colors.grey,),
                      ],)
                    ],
                  ),
                ),
              )
            ],
          ),
          Divider()
        ],
      ),
    );
  }

  //call api for room List
  void callApiRoomList() async{
      var data = await TotalRoomList().get_ApiTotalRoom(context);
      setState((){
        _rooms = data!;
        _htlname = data[0].htl_name!;
      });
  }


  void callApiDeleteRoom(int room_id) async{
    int? refresh = await TotalRoomList().apiDeleteRoom(room_id);
    if(refresh ==1){
      initState();
    }
  }

}
