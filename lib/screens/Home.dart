import 'package:flutter/material.dart';
import 'HomeMain.dart';
import 'OfferMain.dart';

class HomeScreen extends StatefulWidget {

  static final route = "/home";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  PageController _myController = PageController(
    initialPage: 0
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: PageView(
        controller: _myController,
        children: <Widget>[
          HomeMain(),
          OfferMain()
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.grey[500], Colors.grey[700]]
            ),
            shape: BoxShape.circle
          ),
          child: Center(child: Icon(Icons.add))
        ),
        onPressed: () {},
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.person_pin, size: 30), 
                onPressed: () => _myController.animateToPage(0, duration: Duration(seconds: 1), curve: Curves.ease)
              ),
              IconButton(
                icon: Icon(Icons.local_offer, size: 30), 
                onPressed: () => _myController.animateToPage(1, duration: Duration(seconds: 1), curve: Curves.ease)
              )
            ],
          ),
        )
      ),
    );
  }
}