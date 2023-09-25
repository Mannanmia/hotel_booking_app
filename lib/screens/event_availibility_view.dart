import 'package:flutter/material.dart';
import 'package:hoel_booking_app/Model/ApiResponseEventList.dart';
import 'package:hoel_booking_app/Model/event_availability_list.dart';
import 'package:hoel_booking_app/utils/AppColors.dart';
import 'package:intl/intl.dart';

import '../Core/Network/Api/ApiEvent.dart';
import '../utils/alertDialouge.dart';

class EventAvailibilityView extends StatefulWidget {
  const EventAvailibilityView({Key? key}) : super(key: key);

  @override
  State<EventAvailibilityView> createState() => _EventAvailibilityViewState();
}

class _EventAvailibilityViewState extends State<EventAvailibilityView> {
  TextEditingController _startdate = TextEditingController();
  TextEditingController _enddate = TextEditingController();
  TextEditingController _maxGuest = TextEditingController();
  TextEditingController _price = TextEditingController();
  bool _isChecked = false;
  int isSelected =9999;
  List<EventsResponseList> _events=[] ;
  List<EventAvailabilityList> avaiLivilityLists =[];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      callApiEventList();
    });
    super.initState();
  }

  //Code Part
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Event Availability"),
        actions: [
          IconButton(
              onPressed: () {
                OpenDialouge.openDialouge(context);
              },
              icon: Icon(Icons.filter_list)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height*0.37,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _events.length,
                  itemBuilder: (context,index){
                    return InkWell(
                      onTap: (){
                        callApiAvailability(_events[index].id!);
                        isSelected= index;
                      },
                      child: Text(
                        _events[index].title!,style: TextStyle(fontSize: 30,color: isSelected ==index?Colors.green:AppColor.yaleBlue),),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 10,),
            SizedBox(
              height: size.height *0.5,
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: avaiLivilityLists.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4) , itemBuilder: (context,index){
                return  GestureDetector(
                  onTap: (){
                    openActionDialouge(context, size);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white),
                      child: FittedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                DateFormat('yyyy-MM-dd').format(DateTime.now().add(Duration(days: index))),
                                style: TextStyle(color: Colors.blue),
                              ),
                              SizedBox(
                                height: size.height*.01,
                              ),
                              Text(
                                avaiLivilityLists[index].title ?? "Not Found",
                                style: TextStyle(color: Colors.blue),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
  Future openActionDialouge(BuildContext context,Size size) => showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder:(context,setState)=> AlertDialog(
          content: SizedBox(
            height: size.height*0.45,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Date Information"),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Start Date :"),
                    SizedBox(
                      width: size.width*0.45,
                      child: TextField(
                        onTap: () async{
                          DateTime? datePicker = await showDatePicker(context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(DateTime.now().year),
                              lastDate: DateTime(2030));
                          setState(()=> this._startdate.text = datePicker!.year.toString()+"/"+datePicker.month.toString()+"/"+datePicker.day.toString());
                        },
                        controller: _startdate,
                        decoration: InputDecoration(
                          hintText: "2029/06/25",
                          labelText: "Start Date",
                          border: OutlineInputBorder(),),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("End Date :"),
                    SizedBox(
                      width: size.width*0.45,
                      child: TextField(
                        onTap: () async{
                          DateTime? datePicker = await showDatePicker(context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(DateTime.now().year),
                              lastDate: DateTime(2030));
                          setState(()=> this._enddate.text = datePicker!.year.toString()+"/"+datePicker.month.toString()+"/"+datePicker.day.toString());
                        },
                        controller: _enddate,
                        decoration: InputDecoration(
                          hintText: "2029/06/25",
                          labelText: "End Date",
                          border: OutlineInputBorder(),),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Max Guest :"),
                    SizedBox(
                      width: size.width*0.45,
                      child: TextField(
                        controller: _maxGuest,
                        decoration: InputDecoration(
                          hintText: "7",
                          labelText: "Guest",
                          border: OutlineInputBorder(),),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Price :"),
                    SizedBox(
                      width: size.width*0.45,
                      child: TextField(
                        controller: _price,
                        decoration: InputDecoration(
                          hintText: "1125",
                          labelText: "Price",
                          border: OutlineInputBorder(),),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("Status : "),
                    Checkbox(value: _isChecked, onChanged: (value){
                      setState(()=> this._isChecked = value!);
                    }),
                    InkWell(child: Text("Aviable For Booking"),onTap: (){
                      if(_isChecked){
                        setState(()=> this._isChecked = false);
                      }else{
                        setState(()=> this._isChecked = true);
                      }
                    },)
                  ],
                ),
                MaterialButton(
                  color: AppColor.naviBlue,
                  onPressed: (){

                  },child: Text("Save Change",style: TextStyle(color: Colors.white),),)
              ],),
          ),
        ),
      ));


  void callApiEventList() async {
    var data = await TotalEventList().get_ApiEventList(context);
    setState((){
      _events = data!;
    });
  }

  void callApiAvailability(int eventId) async{
    var availableList = await TotalEventList().apiGetAvailabiliyList(eventId,DateFormat('yyyy-MM-dd').format(DateTime.now()), DateFormat('yyyy-MM-dd').format(DateTime.now().add(Duration(days: 30))));
    setState(() {
      avaiLivilityLists = availableList!;
    });
  }
}
