import 'package:flutter/material.dart';
import 'package:hoel_booking_app/Core/Network/Api/apiTourList.dart';
import 'package:hoel_booking_app/Model/ApiResponseTourList.dart';
import 'package:hoel_booking_app/screens/tour_list_add_view.dart';
import 'package:hoel_booking_app/screens/tour_update_view.dart';
import 'package:hoel_booking_app/screens/tour_view.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import '../utils/AppColors.dart';
import '../utils/alertDialouge.dart';

class TourListView extends StatefulWidget {
  const TourListView({Key? key}) : super(key: key);

  @override
  State<TourListView> createState() => _TourListViewState();
}

class _TourListViewState extends State<TourListView> {

  //variables part
  List<ToursResponse> _tours =[] ;

  @override
  void initState() {
    Future.delayed(Duration.zero,(){
      callApiTourList();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("All Packages"),
          actions: [
            IconButton(
                onPressed: () {
                  OpenDialouge.openDialouge(context);
                },
                icon: Icon(Icons.filter_list)),
          ],
        ),
        body:ListView.builder(
            itemCount: _tours.length
            ,itemBuilder: (context,index){
          return item_Card(size,index);
        }),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => AddTourList()));
      },child: Text("+"),),
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
                Container(
                    height: size.height*.15,
                    width: size.width*.30,
                    child:(_tours[index].image_url == null)? Image(image: AssetImage("images/app-logo.png"))
                :Image.network(_tours[index].image_url!)),
                SizedBox(width: 10,),
                Container(
                  width: size.width*.62,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Titel : "+_tours[index].title!,style: TextStyle(fontSize: 18,color: AppColor.skyBlue),),
                      Text("Price  : "+_tours[index].price! ,style: TextStyle(fontSize: 18,color: Colors.blue),),
                      Text("Duration : "+_tours[index].duration!+" Hours",style: TextStyle(fontSize: 18,color: Colors.green),),
                      Text("Start at : "+_tours[index].start_at!,style: TextStyle(fontSize: 18,color: Colors.green),),
                      FittedBox(
                        child: Row(children: [
                          MaterialButton(onPressed: (){
                            Navigator.push(
                                context, MaterialPageRoute(builder: (_) => TourView()));
                          },
                            child: Text("View"),
                            color: Colors.blueAccent,),
                          MaterialButton(onPressed: (){
                            Navigator.push(
                                context, MaterialPageRoute(builder: (_) => TourUpdateView(_tours[index].id!)));
                          },
                            child: Text("Edit"),
                            color: Colors.yellowAccent,),
                          MaterialButton(onPressed: (){
                            callApiDeletTour(_tours[index].id!);
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
           const Divider()
          ],
        ),
      ),
      onTap: (){
       /* Navigator.push(
            context, MaterialPageRoute(builder: (_) => AddTourList()));*/
      },
    );
  }

  void callApiTourList() async{
    var data = await TotalTourList().get_ApiTourList(context);
    setState(() {
      _tours = data!;
    });
  }

  void callApiDeletTour(int tour_id) async{
    int? refresh = await TotalTourList().ApiDeletTour(tour_id);
    if(refresh ==1){
      initState();
    }
  }
}
