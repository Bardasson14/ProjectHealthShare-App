
class Meal{
  int patient;
  String mealType;
  DateTime time;
  bool eaten;

  Meal({
    this.patient, 
    this.mealType,
    this.time,
    this.eaten
  });

  factory Meal.fromJson(Map<String, dynamic> json) => new Meal(
      patient: json["patient"],
      mealType: json["mealType"],
      time: json["time"],
      eaten: json["eaten"]
  );

  Map<String, dynamic> toJson() => {
    "patient": patient,
    "mealType": mealType,
    "time": time,
    "eaten": eaten
  };

  String mealTypeStr(){
    String d = this.mealType;
    if (d.length > 12){
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