import 'package:flutter/material.dart';

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
            "Próximos medicamentos",
          
            style: TextStyle(
              fontFamily: 'Dosis',
              fontWeight: FontWeight.w600,
              fontSize: 25,
              
            )
          ),
          Card(
            
          ),
          
        ],
      )
    );
  } 
}

class CarerPhoto extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('imgs/Personicon.png');
            
    return Container(
        
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            
            Padding(padding: EdgeInsets.only(left:160, top:50, right:30)),
            Image(image: assetImage, width:100, height: 120,),
            Text(
              "Lorem",
              style: TextStyle(
                decoration: TextDecoration.none,
                fontFamily: 'Dosis',
                fontSize: 20
              )
              ),
            Card(
              child: Column()
            )
          ],
        )
    );
  }
}