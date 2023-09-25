import 'package:flutter/material.dart';
import '../utils/AppColors.dart';

class BookingRequistForm extends StatefulWidget {
  const BookingRequistForm({Key? key}) : super(key: key);

  @override
  State<BookingRequistForm> createState() => _BookingRequistFormState();
}

class _BookingRequistFormState extends State<BookingRequistForm> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking Request"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.filter_list)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                    Text(
                      "--Select Service--",
                      style: TextStyle(color: AppColor.skyBlue),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                color: Colors.white70,
                width: size.width * 1,
                height: size.height*1,
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Container(
                            width: size.width * .30,
                            height: size.height * .04,
                            child:   Text(
                              "Applicant : ",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          Container(
                            width: size.width * .65,
                            height: size.height * .04,
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Zakir",
                              ),
                            ),
                          )
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
                            width: size.width * .30,
                            height: size.height * .04,
                            child:   Text(
                              "Room : ",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          Container(
                            width: size.width * .65,
                            height: size.height * .04,
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "C6/C5",
                              ),
                            ),
                          )
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
                            width: size.width * .30,
                            height: size.height * .04,
                            child:   Text(
                              "Nid/id/Licence No :",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          Container(
                            width: size.width * .65,
                            height: size.height * .04,
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Nid Number",
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            width: size.width * .30,
                            height: size.height * .04,
                            child:   Text(
                              "Guest :",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          Container(
                            width: size.width * .65,
                            height: size.height * .04,
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Karim",
                              ),
                            ),
                          )
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
                            width: size.width * .30,
                            height: size.height * .04,
                            child:   Text(
                              "Relation :",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          Container(
                            width: size.width * .65,
                            height: size.height * .04,
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Father",
                              ),
                            ),
                          )
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
                            width: size.width * .30,
                            height: size.height * .04,
                            child:   Text(
                              "Nid/id/Licence No :",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          Container(
                            width: size.width * .65,
                            height: size.height * .04,
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Nid Number",
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            width: size.width * .30,
                            height: size.height * .04,
                            child:   Text(
                              "Cheld :",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          Container(
                            width: size.width * .65,
                            height: size.height * .04,
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Arnob",
                              ),
                            ),
                          )
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
                            width: size.width * .30,
                            height: size.height * .04,
                            child:   Text(
                              "Relation :",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          Container(
                            width: size.width * .65,
                            height: size.height * .04,
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Father",
                              ),
                            ),
                          )
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
                            width: size.width * .30,
                            height: size.height * .04,
                            child:   Text(
                              "Nid/id/Licence No :",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          Container(
                            width: size.width * .65,
                            height: size.height * .04,
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Nid Number",
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(),
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        "Add Guest !!",
                        style: TextStyle(fontSize: 14, color: Colors.green),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Total Adult: 2",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        Text(
                          "Total Children: 1",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                    Divider(),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            width: size.width * .30,
                            height: size.height * .04,
                            child:   Text(
                              "Form :",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          Container(
                            width: size.width * .65,
                            height: size.height * .04,
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Dhaka/Gazipur",
                              ),
                            ),
                          )
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
                            width: size.width * .30,
                            height: size.height * .04,
                            child:   Text(
                              "Perpose :",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          Container(
                            width: size.width * .65,
                            height: size.height * .04,
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Travelling",
                              ),
                            ),
                          )
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
                            width: size.width * .30,
                            height: size.height * .04,
                            child:   Text(
                              "Address:",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          Container(
                            width: size.width * .65,
                            height: size.height * .04,
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "412/10,Ibrahimpur,Dhaka",
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Depature : ",
                              style: TextStyle(fontSize: 14),
                            ),
                            Container(
                              width: size.width * .35,
                              height: size.height * .04,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "14/11/22",
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Arrive : ",
                              style: TextStyle(fontSize: 14),
                            ),
                            Container(
                              width: size.width * .25,
                              height: size.height * .04,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "17/11/20",
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Booking No : 152846",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        Text(
                          "Charge : 12536 BDT",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            width: size.width * .30,
                            height: size.height * .04,
                            child:   Text(
                              "Phone Number :",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          Container(
                            width: size.width * .65,
                            height: size.height * .04,
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "016816",
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(onPressed: (){}, child:Text(
                          "Reset",
                          style: TextStyle(fontSize: 14),
                        ), ),
                        ElevatedButton(onPressed: (){}, child:Text(
                          "Submit",
                          style: TextStyle(fontSize: 14),
                        ), ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
