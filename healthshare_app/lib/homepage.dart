import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'models/Meal.dart';
import 'models/Medication.dart';
import 'dart:async';

class CallsAndMessagesService {
  void call(String number) => launch("tel:$number");
  void sendSms(String number) => launch("sms:$number");
  void sendEmail(String email) => launch("mailto:$email");
}

Medication medFromJson(String str) {
  final jsonData = json.decode(str);
  dynamic sla = jsonData['meds'][0];
  Medication med = Medication.fromJson(sla);
  return med;
}

Future<Medication> getMeds() async {
  String url = "https://project-health.herokuapp.com/api/meds?patient_id=1";
  final response = await http.get('$url');
  return medFromJson(response.body);
}

class HomePageBody extends StatelessWidget{
 
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 20)),
          
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
              Contact(photoDir: "imgs/Personicon.png", contactName: "Dustin", contactPhone: "21972390695",),
              Contact(photoDir: "imgs/Personicon.png", contactName: "Laura",),
            ]
          ),
          Divider(
            color: Colors.black,
          ),
          Text(
            "Próximo medicamento:",
            style: TextStyle(
              fontFamily: 'Dosis',
              fontWeight: FontWeight.w600,
              fontSize: 30,            
            )
          ),
           //MedicineCards(clockAlarmTime: "4:00", doseQt: "760mg", medicineName: "Paracetamol", ),
           Text("\nPróxima refeição:",
           style: TextStyle(
              fontFamily: 'Dosis',
              fontWeight: FontWeight.w600,
              fontSize: 30,            
            )
            ),
            //MealCards(clockAlarmTime: "8:30", label: "Café da Manhã",),

        ],
      )
    );
  } 
}

class Contact extends StatelessWidget{

  String photoDir;
  String contactName;
  String contactPhone;

  Contact({Key key, this.photoDir, this.contactName, this.contactPhone});

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
                menu(context, this.contactPhone, this.contactName);
              },
              padding: EdgeInsets.all(0),
              child: Image.asset(this.photoDir),
            ),
            //Image(image: assetImage, width:100, height: 120,),
            Text(
              this.contactName,
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
  void menu(BuildContext context, String contactPhone, String contactName){
    List<String> recipients;
    Dialog d = new Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    child: Container(
      height: 200,
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.0),
          ),
          
          Text(" NOME: ${contactName}\nTELEFONE: ${contactPhone}\n",
            style: TextStyle(
              fontSize:22
            )),
          Row(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              Padding(
                padding: EdgeInsets.only(left:10, right:10),
                child: MaterialButton(
                minWidth: 30,
                height: 30,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                padding: EdgeInsets.all(20),
                child: Icon(Icons.phone,
                  color: Colors.green),
                color: Colors.white,
                onPressed: (){
                  CallsAndMessagesService c = CallsAndMessagesService();
                  if (contactPhone!=null){
                    c.call(contactPhone);
                  }
                  else{

                  }
                }   

              ))
              ,
              Padding(
                padding: EdgeInsets.only(left:10, right:10),
                child: MaterialButton(
                minWidth: 30,
                height: 30,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                padding: EdgeInsets.all(20),
                child: Icon(Icons.healing,
                  color: Colors.red),
                color: Colors.white,
                onPressed: (){
                  if (contactPhone!=null){
                    //CÓDIGO PARA ENVIO DE SMS AUTOMÁTICO
                    if (!recipients.contains(contactPhone))
                      recipients.add(contactPhone);
                    String message = "PROJECT HEALTH ALERTA:\n {username} PRECISA DE AJUDA! ENTRE EM CONTATO O MAIS RÁPIDO POSSÍVEL!";
                    //_sendSMS(message, recipients);
                    print("Mensagem enviada com sucesso");
                  }
                  else{
                    //ALERTDIALOG INDICANDO ERRO
                  }
                }   

              )),
              Padding(
                padding: EdgeInsets.only(left:10, right:10),
                child: MaterialButton(
                minWidth: 30,
                height: 30,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                padding: EdgeInsets.all(20),
                child: Icon(Icons.sms,
                  color: Colors.deepOrange),
                color: Colors.white,
                onPressed: (){
                  CallsAndMessagesService c = CallsAndMessagesService();
                  c.sendSms(contactPhone);
                }   

              ))
            ],
          )
        ],
      ),  
    ),
  );

    showDialog(
      context: context,
      builder: (BuildContext context){
        return d;
      }
    );
  }

  
}


class MedicineCards extends StatelessWidget{
  Medication medication;
  
  MedicineCards({Key key, Medication medication}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: 330, 
      height: 90,
      child: 
      
      Column(children: FutureBuilder <Medication> [
        Padding(padding: EdgeInsets.all(5),),
            ListTile(
             leading:
               //padding: EdgeInsets.all(30),
                Text(
                  medication.dose,
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'SourceSansPro',
                  fontWeight: FontWeight.w900,
                )),
             
             title: Text("   " + medication.name,
             style: 
              TextStyle(
                fontFamily: 'SourceSansPro',
                fontSize: 25,
                fontWeight: FontWeight.w900,
                
                )
              ),
              
              trailing:
                Text(
                  medication.timeStr(),
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


class MealCards extends StatelessWidget{
  Meal meal;
  MealCards({Key key, Meal meal}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: 330,
      height: 90,
      child: Column(children: <Widget>[
        Padding(padding: EdgeInsets.all(5),),
            ListTile(
             title: Text("   " + meal.mealType,
             style: 
              TextStyle(
                fontFamily: 'SourceSansPro',
                fontSize: 30,
                fontWeight: FontWeight.w900,
              )),
              trailing:
                Text(
                  meal.timeStr(),
                style: TextStyle(
                  fontSize:25
                )
              ),
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

