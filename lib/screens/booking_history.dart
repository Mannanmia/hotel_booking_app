import 'package:flutter/material.dart';
import 'package:hoel_booking_app/Core/Network/Api/api_booking_response.dart';
import 'package:hoel_booking_app/Model/booking_history_response.dart';
import 'package:hoel_booking_app/utils/alertDialouge.dart';

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
                    height: size.height * .10,
                    width: size.width * .22,
                  ),
                  Container(
                    child: Center(child: Text("Execution Time")),
                    height: size.height * .10,
                    width: size.width * .22,
                  ),
                  Container(
                    child: Center(child: Text("Amount")),
                    height: size.height * .10,
                    width: size.width * .22,
                  ),
                  Container(
                    child: Center(child: Text("Action")),
                    height: size.height * .10,
                    width: size.width * .22,
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
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.white70,
                    child: Row(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Text(
                                  "Title : ${bookingHistoryResponse.rows![index].title}"),
                              Text(
                                  "Order Date : ${bookingHistoryResponse.rows![index].date}"),
                              Text(
                                  "Status : ${bookingHistoryResponse.rows![index].status}"),
                            ],
                          ),
                          width: size.width * .22,
                        ),
                        Container(
                          child: Column(
                            children: [
                              Text(
                                  "Check in : ${bookingHistoryResponse.rows![index].startDate}"),
                              Text(
                                  "Check Out : ${bookingHistoryResponse.rows![index].endDate}"),
                              //  Text("General *1 = 10"),
                            ],
                          ),
                          width: size.width * .22,
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "Total :  ${bookingHistoryResponse.rows![index].total}"),
                              Text(
                                  "Paid : ${bookingHistoryResponse.rows![index].paid}"),
                              Text(
                                  "Remain : ${bookingHistoryResponse.rows![index].due}"),
                            ],
                          ),
                          width: size.width * .22,
                        ),
                        Container(
                          child: Column(
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    openDetailsDialouge(context, size,index);
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.info),
                                      Spacer(),
                                      Text("Details")
                                    ],
                                  )),
                              ElevatedButton(
                                  onPressed: () {},
                                  child: Row(
                                    children: [
                                      Icon(Icons.fax),
                                      Spacer(),
                                      Text("Invoice")
                                    ],
                                  )),
                              ElevatedButton(
                                  onPressed: () {
                                    openActionDialouge(context, size,bookingHistoryResponse!.rows![index].id!);
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.attractions_outlined),
                                      Spacer(),
                                      Text("Action")
                                    ],
                                  )),
                            ],
                          ),
                          width: size.width * .29,
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
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
   Future openActionDialouge(BuildContext context, Size size,int bookingId) =>
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: FittedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          postActionStatus(context,bookingId,"completed");
                        },
                        child: Text("-> Make As : Completed"),
                      ),
                      TextButton(
                        onPressed: () {
                          postActionStatus(context,bookingId,"processing");
                        },
                        child: Text("-> Make As : Processing"),
                      ),
                      TextButton(
                        onPressed: () {
                          postActionStatus(context,bookingId,"confirmed");
                        },
                        child: Text("-> Make As : Confirmed"),
                      ),
                      TextButton(
                        onPressed: () {
                          postActionStatus(context,bookingId,"cancelled");
                        },
                        child: Text("-> Make As : Canceled"),
                      ),
                      TextButton(
                        onPressed: () {
                          postActionStatus(context,bookingId,"paid");
                        },
                        child: Text("-> Make As : paid"),
                      ),
                      TextButton(
                        onPressed: () {
                          postActionStatus(context,bookingId,"unpaid");
                        },
                        child: Text("-> Make As : Un Paid"),
                      ),
                      TextButton(
                        onPressed: () {
                          postActionStatus(context,bookingId,"partial_payment");
                        },
                        child: Text("-> Make As : Partially Payment"),
                      ),
                    ],
                  ),
                ),
              ));

  //Dialouge for Details Button
  Future openDetailsDialouge(BuildContext context, Size size,int index) =>
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Booking Id : #${bookingHistoryResponse!.rows![index].id}"),
                      Divider(
                        color: Colors.black,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Booking Status "),
                          Text("${bookingHistoryResponse!.rows![index].status}"),
                        ],
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Booking Date "),
                          Text("${bookingHistoryResponse!.rows![index].date}"),
                        ],
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Pay Method"),
                          Text("${bookingHistoryResponse!.rows![index].gateway!.name}"),
                        ],
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Vendor "),
                          Text("${bookingHistoryResponse!.rows![index].name}"),
                        ],
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Start Date "),
                          Text("${bookingHistoryResponse!.rows![index].startDate}"),
                        ],
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("End Date "),
                          Text("${bookingHistoryResponse!.rows![index].endDate}"),
                        ],
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Night  "),
                          Text("${bookingHistoryResponse!.rows![index].duration}"),
                        ],
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Adult  "),
                          Text(""),
                        ],
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Children "),
                          Text(""),
                        ],
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Duplex Super *2 "),
                          Text("\$ 18000 "),
                        ],
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      Center(child: Text("Details : ")),
                      Divider(
                        color: Colors.black,
                      ),
                      Text("Extra Price : "),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Lunch "),
                          Text("\$ 1800"),
                        ],
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Tea "),
                          Text("\$ 120"),
                        ],
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Service Fee "),
                          Text("\$ 100"),
                        ],
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total :  "),
                          Text("\$ ${bookingHistoryResponse!.rows![index].total}"),
                        ],
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Paid :  "),
                          Text("\$ ${bookingHistoryResponse!.rows![index].paid}"),
                        ],
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Remaining :  "),
                          Text("\$ ${bookingHistoryResponse!.rows![index].due}"),
                        ],
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      Center(
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Close")))
                    ],
                  ),
                ),
              ));

  //Api Call for Booking History
  void getBookingResponse() async {
    BookingHistoryResponse? data =
        await ApiBookingHistory().get_ApiBookingHistory(context);
    setState(() {
      bookingHistoryResponse = data!;
    });
  }

  void postActionStatus(var context,int bookingId, String condition) async{
    bool? status = await ApiBookingHistory().postActionStatuss(context,bookingId, condition);
    Navigator.pop(context);
    setState(() {
      initState();
    });
  }
}
