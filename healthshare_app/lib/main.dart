import 'package:flutter/material.dart';
import 'homepage.dart';

void main(){
  runApp(
    MaterialApp(
      home: Scaffold(

          drawer: Drawer(),
        appBar: AppBar(
          title: 
            Text(
              "Project Health",
              
              //centerTitle: true,
              style: TextStyle(
                decoration: TextDecoration.none,
                fontFamily: 'Quicksand',
                fontSize: 25,
              )),
            centerTitle: true,
          ),
          body: Homepagebody(),
          bottomNavigationBar: BottomNavBar(),
        ),
      )
  );
}

class BottomNavBar extends StatefulWidget{
  @override
  State <StatefulWidget> createState() {
    return _BottomNavBarState();
  } 
}

class _BottomNavBarState extends State<BottomNavBar>{
  
  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
      fixedColor: Colors.blueAccent,
      currentIndex: 0,
      items: [
        BottomNavigationBarItem(
          icon: new Icon(Icons.home),
          title: new Text('Página inicial'),),
        BottomNavigationBarItem(
          icon: new Icon(Icons.mic),
          title: new Text('Fale com o app'),),
        
        BottomNavigationBarItem(
          icon: new Icon(Icons.healing),
          title: new Text('Cheque sua saúde'),),
        
        
      ]
    );
  }
}
