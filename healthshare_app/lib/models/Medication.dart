import 'dart:convert';

class Medication{
  int patient;
  String name;
  String dose;
  DateTime time;
  bool taken;

  Medication({
    this.patient,
    this.name,
    this.dose, 
    this.time, 
    this.taken
  });

  factory Medication.fromJson(Map<String, dynamic> json) => new Medication(
    patient: json["patient"],
    name: json["name"],
    dose: json["dose"],
    time: json["2019-07-10 ${json["time"]}:00"],
    taken: json["taken"],
  );

  Map<String, dynamic> toJson() => {
    "patient": patient,
    "name": name,
    "dose": dose,
    "time": time,
    "taken": taken
  };

  String nameStr(){
    String d = this.name;
    if (d.length > 13){
      d = "${d.substring(0, 10)}...";
    }
    return d;
  }

  String timeStr(){
    String h = this.time.hour.toString().padLeft(2, '0');
    String m = this.time.hour.toString().padLeft(2, '0');
    return "$h:$m";
  }
}