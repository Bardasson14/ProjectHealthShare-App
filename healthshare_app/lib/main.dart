import 'package:flutter/material.dart';
import 'package:healthshare_app/sensors.dart';
import 'homepage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MainApp());

class MainApp extends StatefulWidget{

  @override
  State<StatefulWidget> createState(){
    return MainAppState();  
  }
}

var pageList = [
  HomePageBody(),
  HomePageBody(),
  SensorsPage(),
];


class MainAppState extends State<MainApp>{
  int _selectedPage = 0;


  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(

          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.all(20),
              children: <Widget>[
                SizedBox(
                  width: 220,
                  height: 150,
                  child: DrawerHeader(
                    child: Text('Contatos de emergência',
                      style:
                        TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        )),
                    decoration: BoxDecoration(
                      
                      color: Colors.blue,
                      ),
                  ),
                ),
              ListTile(
                leading: Icon(Icons.local_hospital,
                color: Colors.red,),
                title: Text("SAMU (192)", 
                style: TextStyle(
                  fontSize: 18
                ),),
                trailing: 
                  MaterialButton(
                    onPressed: (){
                      CallsAndMessagesService c = CallsAndMessagesService();
                      c.call("192");
                    },
                    height: 35,
                    minWidth: 35,
                    child:
                      Icon(Icons.call,
                        color: Colors.green,)
                  ),
                ),
              
              ListTile(
                leading: Icon(Icons.security,
                color: Colors.blue,),
                title: Text("POLÍCIA MILITAR (190)", 
                style: TextStyle(
                  fontSize: 18
                ),),
                trailing: 
                  MaterialButton(
                    onPressed: (){
                      CallsAndMessagesService c = CallsAndMessagesService();
                      c.call("190");
                      
                    },
                    height: 35,
                    minWidth: 35,
                    child:
                      Icon(Icons.call,
                        color: Colors.green,)
                  ),
                ),
                ListTile(
                leading: Icon(FontAwesomeIcons.fire,
                color: Colors.deepOrange,),
                title: Text("BOMBEIROS (193)", 
                style: TextStyle(
                  fontSize: 18
                ),),
                trailing: 
                  MaterialButton(
                    onPressed: (){
                      CallsAndMessagesService c = CallsAndMessagesService();
                      c.call("193");
                      
                    },
                    height: 25,
                    minWidth: 25,
                    child:
                      Icon(Icons.call,
                        color: Colors.green,)
                    ,
                  ),
                ),
              ],
            )
          ),
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
          body: pageList[_selectedPage],
          bottomNavigationBar: 
            BottomNavigationBar(
              
              fixedColor: Colors.blueAccent,
              currentIndex: _selectedPage,
              onTap: (int index){
                setState(() {
                  _selectedPage = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                    
                  icon: new Icon(Icons.home),
                  title: new Text('Página inicial'),),
                BottomNavigationBarItem(
                  icon: new Icon(Icons.mic),
                  title: new Text('Fale com o App'),),
                
                BottomNavigationBarItem(
                  icon: new Icon(Icons.healing),
                  title: new Text('Cheque sua saúde'),),
            
                  
              ],
              //onTap: _onTap,
            
            ),
        
        ),
      );
  }
}

