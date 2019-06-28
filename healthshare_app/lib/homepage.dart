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
              "BEM VINDO SR EDMILSON!",
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
            "Próximas overdoses",
          
            style: TextStyle(
              fontFamily: 'Dosis',
              fontWeight: FontWeight.w600,
              fontSize: 25,            
            )
          ),
           Card1(),
           Card1()
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
      title: Text("\esgbsg"),
      content: Text("\aejgb"),
    );
    showDialog(
      context: context,
      builder: (BuildContext context){
        return numero;
      }
    );
  }
}

class Card1 extends StatefulWidget{
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
