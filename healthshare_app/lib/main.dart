import 'package:flutter/material.dart';
import 'homepagebody.dart';

void main(){
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Project Health")),
            
          ),
          body: Homepagebody(),
        ),
      )
  );
}


