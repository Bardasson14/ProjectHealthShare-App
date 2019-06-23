import 'package:flutter/material.dart';

class Homepagebody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top:30)),
            
          Center (
            child: Text(
              "BEM VINDO SR EDMILSON!",
              style: TextStyle(
                fontSize: 25,               
              ),
            ),
          ),
          Row (
            children: <Widget>[
              
              CarerPhoto(),
              CarerPhoto(),
            ]
          )
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
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(left:30, top:30)),
            Image(image: assetImage, width:200, height: 200,),
            Text("Lorem"),
          ],
        )
    );
  }
}