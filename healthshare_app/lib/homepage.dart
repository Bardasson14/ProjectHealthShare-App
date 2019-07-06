import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/src/widgets/framework.dart';


class Homepagebody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 30)),
        
          Center (
            child: Text(
              "WELCOME, MR. JOSEPH",
              style: TextStyle(
                decoration: TextDecoration.none,
                fontFamily: 'SourceSansPro',
                fontSize: 30,      
                fontWeight: FontWeight.w400,         
              ),
            ),
          ),
          Row (
            children: <Widget>[
              CarerPhoto(),
              CarerPhoto(),
            ]
          ),
          Divider(color: Colors.black,
          
            ),
          Text(
            "Next medication doses:",
          
            style: TextStyle(
              fontFamily: 'Dosis',
              fontWeight: FontWeight.w600,
              fontSize: 25,            
            )
          ),
           Cards(),
           Cards()
        ],
      )
    );
  } 
}

//class _CarerPhoto extends StatefulWidget{
//  @override
 // State<StatefulWidget> createState() {
 //   return CarerPhoto();
 // }
//}
class CarerPhoto extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('imgs/Personicon.png');

    return Container(        
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[           
            Padding(padding: EdgeInsets.only(left:160, top:50, right:30)),
            FlatButton(
              onPressed: (){
                menu(context);
              },
              padding: EdgeInsets.all(0),
              child: Image.asset('imgs/Personicon.png'),
            ),
            //Image(image: assetImage, width:100, height: 120,),
            Text(
              "Lorem",
              style: TextStyle(
                decoration: TextDecoration.none,
                fontFamily: 'Dosis',
                fontSize: 20
              )
              ),
          ],
        )
    );
  }
  void menu(BuildContext context){
    
    var numero = AlertDialog(
      title: Text("\ +INFO"),
      content: Text("\ Not ready yet."),
    );
    showDialog(
      context: context,
      builder: (BuildContext context){
        return numero;
      }
    );
  }
}

/*class Card1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Card();
  }
}
class _Card extends State<Card1>{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: 330,
      height: 80,
      child: Row(children: <Widget>[
        Padding(padding: EdgeInsets.symmetric(horizontal: 10),),
        Flexible(child:TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: 'Remédio',
            icon: Icon(Icons.healing),
                ),
              )
            )      
          ],
        ),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blue),
        color: Colors.white   
       //   borderRadius: BorderRadius.all(Radius.circular(10))
      ),
    );
  }
}
*/

class Cards extends StatelessWidget{
  
  @override
  String medicineName;
  String clockAlarmTime;
  String doseQt;

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: 330,
      height: 90,
      child: Column(children: <Widget>[
        Padding(padding: EdgeInsets.all(5),),
           
            ListTile(
             leading:
               //padding: EdgeInsets.all(30),
                Text(
                  
                  "1x",
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'SourceSansPro',
                  fontWeight: FontWeight.w900,
                )),
             
             title: Text("   PURAN T4",
             style: 
              TextStyle(
                fontFamily: 'SourceSansPro',
                fontSize: 30,
                fontWeight: FontWeight.w900,
              )),
              trailing:
                Text("15:00",
                style: TextStyle(
                  fontSize:25
                )),
           )
          ],
        ),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.blue),
        color: Colors.white   
       //   borderRadius: BorderRadius.all(Radius.circular(10))
      ),
    );
  }

}