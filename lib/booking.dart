import 'package:bsc/bookingDetails.dart';
import 'package:bsc/seeBookings.dart';
import 'package:flutter/material.dart';

class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  var typeActivity = '';
  var selectActivity = '';
  var date;
  var email = '';
  var phoneNumber = '';

  String typeAct = 'Sailing';
  String selectAct = 'RS nero';

  final List<String> actsList = [
    'Sailing',
    'Windsurfing',
    'Swimming',
    'Racing'
  ];
  final List<String> clubboat = ['RS nero', 'RS zest', 'RS feva', 'RS tera'];

  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

  DateTime selectedDate = DateTime.now();

  //final typeActivityController = TextEditingController();
  //final selectActivityController = TextEditingController();
  final emailController = TextEditingController();
  final amountController = TextEditingController();

  final List<BookingDetails> bookings = [];

  void submitData() {
    //final enteredTitle = titleController.text;
    setState(() {
      //typeActivity = typeActivityController.text;
      //selectActivity = selectActivityController.text;
      email = emailController.text;
      phoneNumber = amountController.text;
    });
    Navigator.of(context).pop();
  }

  void _saveDetails() {
    print(typeActivity);
    print(selectActivity);
    print(emailController.text);
    print(amountController.text);

    final newBD = BookingDetails(
        id: DateTime.now().toString(),
        activity: typeActivity,
        activityDetails: selectActivity,
        //date: selectedDate,
        email: emailController.text,
        phone: amountController.text);

    setState(() {
      bookings.add(newBD);
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2020, 7),
          lastDate: DateTime(2101));
      if (picked != null && picked != selectedDate)
        setState(() {
          selectedDate = picked;
        });
    }

    return Scaffold(
        appBar: AppBar(title: Text('Members Booking')),
        body: ListView(
          children: <Widget>[
            Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Welcome to our Activity Booking System for use by members only. The booking system will remain in place when we open from 29/03/21. This will allow us to manage the number of members on site at any one time, allowing us to maintain social distancing.To get a better idea of what slots are available when, we now have a visual timetable',
                  style: TextStyle(
                    color: Colors.blue[600],
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.grey[100],
              child: Column(
                children: <Widget>[
                  //Type
                  Card(
                    child: Row(
                      children: <Widget>[
                        Expanded(flex: 1, child: Text('Type of Activity')),
                        Expanded(
                          flex: 3,
                          child: DropdownButton<String>(
                            value: typeAct,
                            //contents
                            onChanged: (String? value2) {
                              setState(() {
                                typeActivity = value2!;
                                typeAct = value2;
                              });
                            },
                            items: actsList
                                .map<DropdownMenuItem<String>>((String item) {
                              //items in dropdown
                              return DropdownMenuItem<String>(
                                //each item is given value
                                value: item,
                                child: new Text(item),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    //],
                    //),
                  ),
                  //Activity
                  Card(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(flex: 1, child: Text('Select Activity')),
                        Expanded(
                          flex: 3,
                          child: DropdownButton<String>(
                            //contents
                            value: selectAct,
                            items: (typeActivity == 'Sailing')
                                ? clubboat.map((String value) {
                                    //items in dropdown
                                    return DropdownMenuItem(
                                      //each item is given value
                                      value: value,
                                      child: new Text(value),
                                    );
                                  }).toList()
                                : clubboat.map((String value) {
                                    //items in dropdown
                                    return DropdownMenuItem(
                                      //each item is given value
                                      value: value,
                                      child: new Text(value),
                                    );
                                  }).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                selectActivity = value!;
                                selectAct = value;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  //Date
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ElevatedButton(
                            style: style,
                            onPressed: () => _selectDate(context),
                            child: const Text('Select Date'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //Email
                  Card(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(flex: 1, child: Text('Email')),
                        Expanded(
                          flex: 3,
                          child: TextField(
                            decoration: InputDecoration(labelText: 'Email'),
                            controller: emailController,
                            //onSubmitted: (_) => submitData(),
                            //onChanged: (val) => {titleInput = val},
                          ),
                        )
                      ],
                    ),
                  ),
                  //Phone
                  Card(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(flex: 1, child: Text('Phone')),
                        Expanded(
                          flex: 3,
                          child: TextField(
                            decoration: InputDecoration(labelText: 'Phone No.'),
                            controller: amountController,
                            //onSubmitted: (_) => submitData(),
                            //onChanged: (val) => {titleInput = val},
                          ),
                        )
                      ],
                    ),
                  ),
                  //Submit
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ElevatedButton(
                            style: style,
                            onPressed: () => _saveDetails(),
                            child: const Text('Submit'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //See Bookings
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ElevatedButton(
                            style: style,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SeeBookings(bookingslist: bookings)),
                              );
                            },
                            child: const Text('See Bookings'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
