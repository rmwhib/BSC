import 'package:bsc/bookingDetails.dart';
import 'package:flutter/material.dart';

class SeeBookings extends StatelessWidget {
  final List<BookingDetails> bookingslist;
  const SeeBookings({Key? key, required this.bookingslist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
            itemCount: bookingslist.length,
            itemBuilder: (context, index) {
              return ListTile(title: Text(bookingslist[index].email));
            }));
  }
}
