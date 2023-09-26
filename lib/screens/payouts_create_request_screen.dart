import 'package:flutter/material.dart';

class PayoutsRequestPage extends StatefulWidget {
  PayoutsRequestPage({super.key});

  @override
  State<PayoutsRequestPage> createState() => _PayoutsRequestPageState();
}

class _PayoutsRequestPageState extends State<PayoutsRequestPage> {
  String method = "Select One";

  var methods =[
    "Select One",
    "Dbbl minimum 500",
    "Bkash minimum 500"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payouts Request"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                      child: Text("Available For Payouts")),
                  Flexible(
                    flex: 2,
                    child: TextField(
                      controller: null,
                      decoration: InputDecoration(
                          border: OutlineInputBorder()),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      flex: 1,
                      child: Text("Amount")),
                  Flexible(
                    flex: 2,
                    child: TextField(
                      controller: null,
                      decoration: InputDecoration(
                          border: OutlineInputBorder()),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      flex: 1,
                      child: Text("Note to admin")),
                  Flexible(
                    flex: 2,
                    child: TextField(
                      maxLines: 3,
                      controller: null,
                      decoration: InputDecoration(
                          border: OutlineInputBorder()),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      flex: 1,
                      child: Text("Payment Method")),
                  Flexible(
                    flex: 2,
                    child: DropdownButton(
                      value: method,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: methods.map((items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),

                      onChanged: (String? newValue) {
                        setState(() {
                          method = newValue!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 100),
                child: Row(
                  children: [
                    MaterialButton(onPressed: (){
                      Navigator.pop(context);
                    },
                      color: Colors.grey,
                    child: Text("close"),),
                    SizedBox(width: 10,),
                    MaterialButton(onPressed: (){},
                      color: Colors.green,
                    child: Text("Send Request"),),
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
