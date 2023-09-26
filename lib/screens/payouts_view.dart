import 'package:flutter/material.dart';
import 'package:hoel_booking_app/Core/Network/Api/payouts_all_apis.dart';
import 'package:hoel_booking_app/Model/payouts_response.dart';
import 'package:hoel_booking_app/screens/payouts_create_request_screen.dart';
import 'package:hoel_booking_app/utils/AppColors.dart';
import 'package:hoel_booking_app/utils/alertDialouge.dart';

class PayoutsView extends StatefulWidget {
  const PayoutsView({Key? key}) : super(key: key);

  @override
  State<PayoutsView> createState() => _PayoutsViewState();
}

class _PayoutsViewState extends State<PayoutsView> {
  //variable part
 PayoutsResponse res = PayoutsResponse();
 TextEditingController _dbblContriller = TextEditingController();
 TextEditingController _bkashContriller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    getPayoutsResponse();
  }
  //Code Part
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Payouts"),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: size.width*1,
                  color: Colors.white70,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Setup Account",style: TextStyle(fontSize: 25),),
                      Text("To Create payout Request",style: TextStyle(fontSize: 15,color: Colors.black45),),
                      MaterialButton(color: AppColor.yaleBlue,onPressed: (){
                        openDialouge(context,size);
                      },child: Text("Create & Setup Account",style: TextStyle(color: Colors.white),),)
                    ],
                  ),
                ),
              ),
              Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: size.width*1,
                color: Colors.white70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Current Balance",style: TextStyle(fontSize: 25),),
                        Text("Payout Balance",style: TextStyle(fontSize: 15,color: Colors.black45),),
                        Row(
                          children: [
                            (res.status != null) ? Text ("BDT "+res.paysdata!.availablePayoutAmount.toString(),style: TextStyle(color: AppColor.skyBlue,fontSize: 20),):Text("0"),
                            SizedBox(width: 50,),
                           // MaterialButton(color: AppColor.yaleBlue,onPressed: (){},child: Text("Add Request ",style: TextStyle(color: Colors.white),),)
                          ],
                        )
                      ],
                    ),
                    MaterialButton(color: AppColor.yaleBlue,onPressed: (){
                      
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> PayoutsRequestPage()));
                    },child: Text("Create Request",style: TextStyle(color: Colors.white),),)
                  ],
                ),
              ),
            ),
              Divider(color: Colors.black,),
              Text("Payout History",style: TextStyle(fontSize: 20,color: AppColor.moreColor ),),
              SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(width: size.width*.20,
                          child: Text("#",style: TextStyle(color: Colors.blueAccent),)),
                      Container(width: size.width*.20,
                          child: Text("Amount",style: TextStyle(color: Colors.blueAccent),)),
                      Container(width: size.width*.20,
                          child: Text("Payout Method",style: TextStyle(color: Colors.blueAccent),)),
                      Container(width: size.width*.20,
                          child: Text("Date Request",style: TextStyle(color: Colors.blueAccent),)),
                      Container(width: size.width*.20,
                          child: Text("Notes",style: TextStyle(color: Colors.blueAccent),)),
                      Container(width: size.width*.25,
                          child: Text("Date Processed",style: TextStyle(color: Colors.blueAccent),)),
                      Container(width: size.width*.25,
                          child: Text("Status",style: TextStyle(color: Colors.blueAccent),)),
                    ],
                  ),
                  SizedBox(height:size.height *.03 ,),
                  Row(
                    children: [
                      Container(width: size.width*.20,
                          child: Text("3",style: TextStyle(color: Colors.blueAccent),)),
                      Container(width: size.width*.20,
                          child: Text("18130",style: TextStyle(color: Colors.blueAccent),)),
                      Container(width: size.width*.20,
                          child: Text("DBBL to Test",style: TextStyle(color: Colors.blueAccent),)),
                      Container(width: size.width*.20,
                          child: Text("28/1/2023",style: TextStyle(color: Colors.blueAccent),)),
                      Container(width: size.width*.20,
                          child: Text("",style: TextStyle(color: Colors.blueAccent),)),
                      Container(width: size.width*.25,
                          child: Text("",style: TextStyle(color: Colors.blueAccent),)),
                      Container(width: size.width*.25,
                          child: Text("initial",style: TextStyle(color: Colors.blueAccent),)),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void getPayoutsResponse() async{
    var data = await ApiPayouts().getPayouts(context);
    setState(() {
      res = data!;
      _dbblContriller.text = data.paysdata!.mothods!.bank!.user.toString();
      _bkashContriller.text = data!.paysdata!.mothods!.bkash!.user!.toString();
    });
  }


  //Showing Dialouge
   Future openDialouge(BuildContext context,Size size) => showDialog(
      context: context,
      builder: (context) =>Dialog(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: size.height*0.3,
              width: size.width*1 ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Setup Payouts Account",style: TextStyle(fontSize: 18,color: AppColor.moreColor),),
                  Divider(color: Colors.black,),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                      SizedBox(width: 50,
                          child: Text("#")),
                      SizedBox(width: size.width * 0.2,
                          child: Text("Method")),
                      SizedBox(
                          child: Text("Your Account"))
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                      SizedBox(width: 50,
                          child: Text("#1")),
                      SizedBox(width: size.width * 0.2,
                          child: Text(res.paysdata!.payouts![0].name.toString())),
                      SizedBox(width: size.width*0.4,
                          child: TextField(
                            controller: _dbblContriller,
                            decoration: InputDecoration(
                              border: OutlineInputBorder()
                            ),
                          ))
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                      SizedBox(width: 50,
                          child: Text("#2")),
                      SizedBox(width: size.width * 0.2,
                          child: Text(res.paysdata!.payouts![1].name.toString())),
                      SizedBox(width: size.width*0.4,
                          child: TextField(
                            controller: _bkashContriller,
                            decoration: InputDecoration(
                            border: OutlineInputBorder()
                          ),))
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        color: AppColor.naviBlue,
                        onPressed: (){
                        Navigator.pop(context);
                      }, child: Text("Close",style: TextStyle(color: Colors.white)),
                      ),
                      MaterialButton(
                        color: AppColor.naviBlue,
                          onPressed: (){



                          }, child: Text("Save Change",style: TextStyle(color: Colors.white),)),
                    ],
                  )
                ]
              ),
            ),
          )
      ));
}




