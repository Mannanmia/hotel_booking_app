import 'package:flutter/material.dart';
import 'package:hoel_booking_app/Core/Network/Api/api_booking_response.dart';
import 'package:hoel_booking_app/Model/booking_history_response.dart';
import 'package:hoel_booking_app/utils/alertDialouge.dart';
import '../utils/AppColors.dart';

class BookingHistory extends StatefulWidget {
  const BookingHistory({Key? key}) : super(key: key);

  @override
  State<BookingHistory> createState() => _BookingHistoryState();
}

class _BookingHistoryState extends State<BookingHistory> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getBookingResponse();
    });
    super.initState();
  }

  BookingHistoryResponse bookingHistoryResponse = BookingHistoryResponse();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking History"),
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
                        "Hotel : See palace",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Cox's Bazar",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                 /* Text(
                    "--Select Service--",
                    style: TextStyle(color: AppColor.skyBlue),
                  ),*/
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    child: Center(child: Text("Info")),
                    height: size.height*.10,
                    width: size.width*.22,
                  ),
                  Container(
                    child: Center(child: Text("Execution Time")),
                    height: size.height*.10,
                    width: size.width*.22,
                  ),
                  Container(
                    child: Center(child: Text("Amount")),
                    height: size.height*.10,
                    width: size.width*.22,
                  ),
                  Container(
                    child: Center(child: Text("Action")),
                    height: size.height*.10,
                    width: size.width*.22,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: bookingHistoryResponse.rows?.length ?? 0,
                itemBuilder: (context,index){
                  return Container(
                    color: Colors.white70,
                    child: Row(
                      children: [
                        Container(
                          child: Column(
                            children: [
                                Text("Title : ${bookingHistoryResponse.rows![index].title}"),
                              Text("Order Date : ${bookingHistoryResponse.rows![index].date}"),
                               Text("Status : ${bookingHistoryResponse.rows![index].status}"),
                            ],
                          ),
                          width: size.width*.22,
                        ),
                        Container(
                          child: Column(
                            children: [
                              Text("Check in : ${bookingHistoryResponse.rows![index].startDate}"),
                              Text("Check Out : ${bookingHistoryResponse.rows![index].endDate}"),
                              //  Text("General *1 = 10"),
                            ],
                          ),
                          width: size.width*.22,
                        ),
                        Container(
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Total :  ${bookingHistoryResponse.rows![index].total}"),
                              Text("Paid : ${bookingHistoryResponse.rows![index].paid}"),
                              Text("Remain : ${bookingHistoryResponse.rows![index].due}"),
                            ],
                          ),
                          width: size.width*.22,
                        ),
                        Container(
                          child: Column(
                            children: [
                              ElevatedButton(onPressed: (){
                                openDetailsDialouge(context, size);
                              }, child: Row(children: [
                                Icon(Icons.info),
                                Spacer(),
                                Text("Details")
                              ],)),
                              ElevatedButton(onPressed: (){

                              }, child: Row(children: [
                                Icon(Icons.fax),
                                Spacer(),
                                Text("Invoice")
                              ],)),
                              ElevatedButton(onPressed: (){
                                openActionDialouge(context,size);
                              }, child: Row(children: [
                                Icon(Icons.attractions_outlined),
                                Spacer(),
                                Text("Action")
                              ],)),
                            ],
                          ),
                          width: size.width*.29,
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context,index){
                  return Divider();
                },
              ),
            )
          ],
        ),
      ),
    );
  }


  //Dialouge for Open Action button
  static Future openActionDialouge(BuildContext context,Size size) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: FittedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("-> Make As : Complete"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("-> Make As : Processing"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("-> Make As : Confirmed"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("-> Make As : Canceled"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("-> Make As : paid"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("-> Make As : Un Paid"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("-> Make As : Partially Payment"),
            ),
          ],),
        ),
      ));

  //Dialouge for Details Button
  static Future openDetailsDialouge(BuildContext context,Size size) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                    Text("Booking Id : #19"),
              Divider(color: Colors.black,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Booking Status "),
                  Text("Processing"),
                ],
              ),
              Divider(color: Colors.black,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Booking Date "),
                  Text("26/10/2021"),
                ],
              ),
              Divider(color: Colors.black,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Payment Method "),
                  Text("Bkash"),
                ],
              ),
              Divider(color: Colors.black,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Vendor "),
                  Text("Dev.MH "),
                ],
              ),
              Divider(color: Colors.black,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Start Date "),
                  Text("10/12/2020 "),
                ],
              ),
              Divider(color: Colors.black,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("End Date "),
                  Text("15/12/2020 "),
                ],
              ),
              Divider(color: Colors.black,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Night  "),
                  Text("5 "),
                ],
              ),
              Divider(color: Colors.black,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Adult  "),
                  Text("2 "),
                ],
              ),
              Divider(color: Colors.black,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Children "),
                  Text("2 "),
                ],
              ),
              Divider(color: Colors.black,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Duplex Super *2 "),
                  Text("\$ 18000 "),
                ],
              ),
              Divider(color: Colors.black,),
              Center(child: Text("Details : ")),
              Divider(color: Colors.black,),
              Text("Extra Price : "),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Lunch "),
                  Text("\$ 1800"),
                ],
              ),
              Divider(color: Colors.black,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Tea "),
                  Text("\$ 120"),
                ],
              ),
              Divider(color: Colors.black,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Service Fee "),
                  Text("\$ 100"),
                ],
              ),
              Divider(color: Colors.black,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total :  "),
                  Text("\$ 19620"),
                ],
              ),
              Divider(color: Colors.black,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Paid :  "),
                  Text("\$ 0"),
                ],
              ),
              Divider(color: Colors.black,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Remaining :  "),
                  Text("\$ 19620"),
                ],
              ),
              Divider(color: Colors.black,),
              Center(child: ElevatedButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text("Close")))
            ],),
        ),
      ));

  //Api Call for Booking History
  void getBookingResponse()async{
    BookingHistoryResponse? data = await ApiBookingHistory().get_ApiBookingHistory(context);
    setState(() {
        bookingHistoryResponse = data!;
    });
  }
}
