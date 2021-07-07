import 'package:flutter/material.dart';
import './Booking.dart';

void main() {
  runApp(MaterialApp(
    title: 'Bowmoor Sailing Club',
    home: BowmoorMain(),
    theme: ThemeData(
        appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(fontFamily: 'OpenSans', fontSize: 30)))),
  ));
}

class BowmoorMain extends StatelessWidget {
  const BowmoorMain({Key? key}) : super(key: key);
  void _startMenu(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    final List<Text> users = <Text>[
      const Text('Android'),
      const Text('IOS'),
      const Text('MAc'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Bowmoor Sailing Club'),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,

          children: <Widget>[
            //blue menu
            Container(
              height: 60,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Menu'),
              ),
            ),
            //first box 'About us'
            ListTile(
              title: Text('About us'),
              //little arrow option menu
              trailing: DropdownButton<String>(
                //contents
                items: <String>['Welcome', 'Members Booking', 'News', 'History']
                    .map((String value) {
                  //items in dropdown
                  return DropdownMenuItem<String>(
                    //each item is given value
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                //click on arrow content
                onChanged: (v) {
                  if (v == 'Members Booking') {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Booking()));
                  } else {}
                },
              ),
            ),
            ListTile(
              title: Text('Calendar'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('On The Water'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Racing'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Training'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Contact US'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Card(
            child: Container(
                height: MediaQuery.of(context).size.height *
                    0.6, // ignore this, cos I am giving height to the container
                width: MediaQuery.of(context).size.width *
                    0.5, // ignore this, cos I am giving width to the container
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('FrontPage.png'),
                )),
                alignment: Alignment
                    .bottomCenter, // This aligns the child of the container
                child: Padding(
                    padding: EdgeInsets.only(
                        bottom: 10.0), //some spacing to the child from bottom
                    child: Text('Welcome To Bowmoor Sailing Club',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold)))),
          ),
          Container(
              child: Card(
                  child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        "With year round access to the water and facilities Bowmoor Sailing Club, located in the Cotswolds in Gloucestershire, caters for all types of watersports from sailing to open water swimming. Whether you’re an experienced racer looking for competition, or someone who has never been on the water before, we have something for everyone. We’re a friendly family club which offers year round racing, RYA endorsed training for both adults and children and multiple activities along with great facilities and an active social calendar.",
                        style: TextStyle(
                          color: Colors.blue[600],
                          fontSize: 15,
                        ),
                      )))),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: <Widget>[
                        Image(
                          image: AssetImage('HandsFaceSpace_thumb.png'),
                        ),
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            "The following rules and guidance have been detailed by the Government and are effective from 17 May  2021.  The overarching guidelines for Govt guidance that come into are ‘Hands. Face. Space’: Hands[…]",
                            style: TextStyle(
                                color: Colors.blue[800], fontSize: 15),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: <Widget>[
                        Image(
                          image: AssetImage('HandsFaceSpace_thumb.png'),
                        ),
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            "The following rules and guidance have been detailed by the Government and are effective from 17 May  2021.  The overarching guidelines for Govt guidance that come into are ‘Hands. Face. Space’: Hands[…]",
                            style: TextStyle(
                                color: Colors.blue[800], fontSize: 15),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: <Widget>[
                        Image(
                          image: AssetImage('HandsFaceSpace_thumb.png'),
                        ),
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            "The following rules and guidance have been detailed by the Government and are effective from 17 May  2021.  The overarching guidelines for Govt guidance that come into are ‘Hands. Face. Space’: Hands[…]",
                            style: TextStyle(
                                color: Colors.blue[800], fontSize: 15),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            child: Center(
              child: Text('What we offer'),
            ),
          ),
          Container(
            child: Center(
              child: Text('Contact US'),
            ),
          ),
        ],
      ),
    );
  }
}
