import 'package:flutter/material.dart' ;
import 'package:hoel_booking_app/Core/Network/Api/ApiEvent.dart';
import 'package:hoel_booking_app/screens/event_list_add_view.dart';
import 'package:hoel_booking_app/screens/event_update_view.dart';
import 'package:hoel_booking_app/screens/event_view.dart';
import 'package:hoel_booking_app/utils/AppColors.dart';
import '../Model/ApiResponseEventList.dart';
import '../utils/alertDialouge.dart';


class EventListView extends StatefulWidget {
  const EventListView({Key? key}) : super(key: key);

  @override
  State<EventListView> createState() => _EventListViewState();
}

class _EventListViewState extends State<EventListView> {

  //Variable declear here......
  List<EventsResponseList> _events=[] ;
  @override
  void initState() {
    Future.delayed(Duration.zero,(){
      callApiEventList();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("All Events"),
        actions: [
          IconButton(
              onPressed: () {
                OpenDialouge.openDialouge(context);
              },
              icon: Icon(Icons.filter_list)),
        ],
      ),
      body:ListView.builder(
      itemCount: _events.length
      ,itemBuilder: (context,index){
        print(_events[index].id);
        return item_Card(size,index);
      }),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => AddEventList()));
      },child: Text("+"),),
    );
  }
  
  Widget item_Card (Size size,int index){
    return Container(
      color: Colors.white70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                  height: size.height*.15,
                  width: size.width*.30,
                  child:(_events[index].image_url == null)? Image(image: AssetImage("images/app-logo.png"))
              : Image.network(_events[index].image_url!),),
              SizedBox(width: 10,),
              Container(
                width: size.width*.62,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Title : "+_events[index].title!,style: TextStyle(fontSize: 18,color: AppColor.skyBlue),),
                    Text("Price : "+_events[index].price!.toString() ,style: TextStyle(fontSize: 18,color: Colors.blue),),
                    SizedBox(height: size.height*.03,),
                    Text(_events[index].days!,style: TextStyle(fontSize: 18,color: Colors.green),),
                    FittedBox(
                      child: Row(children: [
                        MaterialButton(onPressed: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (_) => EventView(_events[index].id!)));
                        },
                          child: Text("View"),
                          color: Colors.blueAccent,),
                        MaterialButton(onPressed: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (_) => EventUpdateView(_events[index].id!)));
                        },
                          child: Text("Edit"),
                          color: Colors.yellowAccent,),
                        MaterialButton(onPressed: (){
                          callApiDeletEvent(_events[index].id!);
                        },
                          child: Text("Del"),
                          color: Colors.redAccent,),
                      ],),
                    )
                  ],
                ),
              )
            ],
          ),
          Divider()
        ],
      ),
    );
  }

  void callApiEventList() async {
    var data = await TotalEventList().get_ApiEventList(context);
    setState((){
      _events = data!;
    });
  }

  void callApiDeletEvent(int event_id) async{
    int? refresh = await TotalEventList().ApiDeletEvent(event_id);
    if(refresh ==1){
      initState();
    }
  }
}

