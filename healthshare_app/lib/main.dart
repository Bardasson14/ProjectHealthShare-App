import 'package:flutter/material.dart';
import 'homepage.dart';


void main(){
  runApp(
    MaterialApp(
      home: Scaffold(

          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.all(20),
              children: <Widget>[
                SizedBox(
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
                leading: Icon( Icons.ac_unit,
                color: Colors.blue,),
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
          body: HomepageBody(),
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
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
      
      fixedColor: Colors.blueAccent,
      currentIndex: currentTab,

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
    
    );
  }
}
