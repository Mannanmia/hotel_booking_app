import 'package:flutter/material.dart';
import 'package:hoel_booking_app/Model/ApiResponseCarrer.dart';
import 'package:hoel_booking_app/screens/career_add_view.dart';
import 'package:hoel_booking_app/screens/career_update_view.dart';
import 'package:hoel_booking_app/screens/carrer_view.dart';
import '../Core/Network/Api/ApiCarrerList.dart';
import '../utils/AppColors.dart';
import '../utils/alertDialouge.dart';

class CareerListView extends StatefulWidget {

  @override
  State<CareerListView> createState() => _CareerListViewState();
}

class _CareerListViewState extends State<CareerListView> {

  //Variable parts
  List<CarrerResponse> _careers =[] ;

  @override
  void initState() {
    Future.delayed(Duration.zero,(){
      callApiCareerList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Manage Career"),
        actions: [
          IconButton(
              onPressed: () {
                OpenDialouge.openDialouge(context);
              },
              icon: Icon(Icons.filter_list)),
        ],
      ),
      body: ListView.builder(
          itemCount: _careers.length
          ,itemBuilder: (context,index){
        return item_Card(size,index);
      }),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => AddCarrerView()));
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
                    child:(_careers[index].image_url == null) ?Image(image: AssetImage("images/app-logo.png"))
                :Image.network(_careers[index].image_url!)),
                SizedBox(width: 10,),
                Container(
                  width: size.width*.62,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Titel : "+_careers[index].title!,style: TextStyle(fontSize: 18,color: AppColor.skyBlue),),
                     // Text("Price  : ",style: TextStyle(fontSize: 20,color: Colors.blue),),
                     // Text("Duration : "" Hours",style: TextStyle(fontSize: 20,color: Colors.green),),
                      Text("DeadLine : ",style: TextStyle(fontSize: 18,color: Colors.green),),
                      FittedBox(
                        child: Row(children: [
                          MaterialButton(onPressed: (){
                            Navigator.push(
                                context, MaterialPageRoute(builder: (_) => CareerView()));
                          },
                            child: Text("View"),
                            color: Colors.blueAccent,),
                          MaterialButton(onPressed: (){
                            Navigator.push(
                                context, MaterialPageRoute(builder: (_) => CareerUpdateView(_careers[index].id!)));
                          },
                            child: Text("Edit"),
                            color: Colors.yellowAccent,),
                          MaterialButton(onPressed: () async{
                            int? ref = await TotalCareerList().ApiDeletCarrer(_careers[index].id!);
                            if(ref == 1){
                              setState(() {});
                            }
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
      ),
      onTap: (){
        /* Navigator.push(
            context, MaterialPageRoute(builder: (_) => AddTourList()));*/
      },
    );
  }

  void callApiCareerList()  async {
    var data = await TotalCareerList().get_ApiCarrierList(context);
    setState(() {
      _careers = data!;
    });
  }
}
