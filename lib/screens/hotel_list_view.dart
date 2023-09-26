import 'package:flutter/material.dart';
import 'package:hoel_booking_app/Core/Network/Api/ApiHotelList.dart';
import 'package:hoel_booking_app/Core/Network/Api/ApiManageHotel.dart';
import 'package:hoel_booking_app/Model/ApiResponseHotelList.dart';
import 'package:hoel_booking_app/screens/hotel_add_view.dart';
import 'package:hoel_booking_app/screens/hotel_update_view.dart';
import 'package:hoel_booking_app/screens/hotel_view.dart';
import 'package:hoel_booking_app/screens/show_hotel_rooms.dart';
import '../utils/AppColors.dart';
import '../utils/alertDialouge.dart';

class HotelListView extends StatefulWidget {
  const HotelListView({Key? key}) : super(key: key);

  @override
  State<HotelListView> createState() => _HotelListViewState();
}

class _HotelListViewState extends State<HotelListView> {
  //Variable Parts
  List<HotelResponse> _hotls =[] ;

  void initState() {
    Future.delayed(Duration.zero,(){
      callApiHotelList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title:const Text("All Hotels"),
        actions: [
          IconButton(
              onPressed: () {
                OpenDialouge.openDialouge(context);
              },
              icon:const Icon(Icons.filter_list)),
        ],
      ),
      body:ListView.builder(
          itemCount: _hotls.length
          ,itemBuilder: (context,index){
        return item_Card(size,index);
      }),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const HotelAddView()));
      },child:const Text("+"),),
    );
  }

  Widget item_Card (Size size, int index){
    return InkWell(
      child: Container(
        color: Colors.white70,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                    height: size.height*.15,
                    width: size.width*.30,
                    child:(_hotls[index].image_id == null) ?const Image(image: AssetImage("images/app-logo.png"))
                :Image.network(_hotls[index].image_id!)),
               const SizedBox(width: 10,),
                SizedBox(
                  width: size.width*.62,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name : ${_hotls[index].title!}",style:const TextStyle(fontSize: 18,color: AppColor.skyBlue),),
                      Text((_hotls[index].address == null)?"Address : ":"Address  : ${_hotls[index].address!}",style: const TextStyle(fontSize: 18,color: Colors.blue),),
                      Text("Phone : ${_hotls[index].phone!}",style:const TextStyle(fontSize: 18,color: Colors.green),),
                      FittedBox(
                        child: Row(children: [
                          MaterialButton(onPressed: (){
                            Navigator.push(
                                context, MaterialPageRoute(builder: (_) => const HotelView()));
                          },
                            child: const Text("View"),
                            color: Colors.blueAccent,),
                          MaterialButton(onPressed: (){
                            Navigator.push(
                                context, MaterialPageRoute(builder: (_) => HotelUpdateView(_hotls[index].id!)));
                          },
                            child:const Text("Edit"),
                            color: Colors.yellowAccent,),
                          MaterialButton(onPressed: (){
                            callApiDeleteHotel(_hotls[index].id!);
                          },
                            child:const Text("Del"),
                            color: Colors.redAccent,),
                        ],),
                      )
                      //Text("Start at : ",style: TextStyle(fontSize: 20,color: Colors.green),),
                    ],
                  ),
                )
              ],
            ),
            const Divider()
          ],
        ),
      ),
      onTap: (){
         Navigator.push(
            context, MaterialPageRoute(builder: (_) => ShowHotelRooms()));
      },
    );
  }

  void callApiHotelList() async{
    var data = await TotalHoteltList().get_ApiHotelList(context);
    setState(() {
      _hotls = data!;
    });
  }


  void callApiDeleteHotel(int htl_id) async{
    int? refresh = await ApiManageHotel().ApiDeletHotel(htl_id);
    if(refresh ==1){
       initState();
    }
  }

}
