import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fit_kit/fit_kit.dart';

class SensorsPage extends StatelessWidget{
  
  String heartRate = "";
  String bloodPressure = "";

  @override
  Widget build(BuildContext context){
    return Container(
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 35)),
      
          Center (
            child: Text(
              "CHEQUE SUA SAÚDE",
              style: TextStyle(
                decoration: TextDecoration.none,
                fontFamily: 'SourceSansPro',
                fontSize: 30,      
                fontWeight: FontWeight.w400,         
              ),
            ),
          ),
    
            
          Padding(
            padding: EdgeInsets.only(top:40),
            child: Container(
              margin: EdgeInsets.only(top: 10),
              width: 330,
              height: 140,
              
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.blue),
                color: Colors.white,
              ),

              child: Column(

                children: <Widget>[
                  SizedBox(
                    height: 70,
                    child:
                      Center(
                        child: ListTile(
                        
                          leading: 
                            Icon(FontAwesomeIcons.heartbeat,
                                color: Colors.red),
                          title: Text("\BATIMENTOS CARDÍACOS",
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: "Dosis",                              
                            ),
                            ),
                          trailing: MaterialButton(
                            minWidth: 30,
                            color: Colors.green,
                            child: Icon(Icons.play_arrow,
                              color: Colors.white,),
                              onPressed:(){
                                _asyncHeartRateInputDialog(context);
                              } ,
                          ),
                          
                        )
                      ),
                  ),
                  SizedBox(
                    height: 60,
                    child:
                      Center(
                        child: ListTile(
                          title: Text("\ÚLTIMO RESULTADO",
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: "Dosis",                              
                            ),
                            ),
                          trailing: Container(
                            width: 60,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.red,
                            ),
                            child: Column(
                              children: <Widget>[
                                Text(heartRate,
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                  ),),
                                Text("bpm",
                                 style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                  ),)
                              ],
                            )
                          )
                          
                        )
                      ),
                  )
                ],
              ),
              
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top:40),
            child: Container(
              margin: EdgeInsets.only(top: 10),
              width: 330,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.blue),
                color: Colors.white,
              ),
              child: Column(

                children: <Widget>[
                  SizedBox(
                    height: 70,
                    child:
                      Center(
                        child: ListTile(
                        
                          leading: 
                            Icon(FontAwesomeIcons.solidHeart,
                            
                                color: Colors.red),
                          title: Text("\PRESSÃO ARTERIAL",
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: "Dosis",                              
                            ),
                            ),
                          trailing: MaterialButton(
                            minWidth: 30,
                            color: Colors.green,
                            child: Icon(Icons.play_arrow,
                              color: Colors.white,),
                              onPressed:(){
                                _asyncBloodPressureInputDialog(context);
                              } ,
                          ),
                          
                        )
                      ),
                  ),
                  SizedBox(
                    height: 60,
                    child:
                      Center(
                        child: ListTile(
                        
                          title: Text("\ÚLTIMO RESULTADO",
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: "Dosis",                              
                            ),
                            ),
                          trailing: Container(
                            width: 60,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.red,
                            ),
                            child: Column(
                              children: <Widget>[
                                Text(bloodPressure,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                  ),),
                                Text("pas",
                                 style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                  ),)
                              ],
                            )
                          )
                          
                        )
                      ),
                  )
                ],
              ),
              
            ),
          ),
          
         
          ],
     
        ),
    );
  }

Future<String> _asyncBloodPressureInputDialog(BuildContext context) async {
  return showDialog <String>(
    context: context,
    barrierDismissible: false, // dialog is dismissible with a tap on the barrier
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Entre com a pressão arterial: '),
        content: new Row(
          children: <Widget>[
            new Expanded(
                child: new TextField(
              autofocus: true,
              decoration: new InputDecoration(
                  labelText: 'Pressão arterial', hintText: 'ex.: 12/8'),
              onChanged: (value) {
                bloodPressure = value;
              },
            ))
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop(bloodPressure);
            },
          ),
        ],
      );
    },
  );
}

Future<String> _asyncHeartRateInputDialog(BuildContext context) async {
  return showDialog <String>(
    context: context,
    barrierDismissible: false, // dialog is dismissible with a tap on the barrier
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Entre com a quantidade de batimentos por minuto: '),
        content: new Row(
          children: <Widget>[
            new Expanded(
                child: new TextField(
              autofocus: true,
              decoration: new InputDecoration(
                  labelText: 'BPM', hintText: 'ex.: 100'),
              onChanged: (value) {
                heartRate = value;
              },
            ))
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop(heartRate);
            },
          ),
        ],
      );
    },
  );
 }
}
