
class BloodPressure{

  String bloodPressure;
  int measurements;

  BloodPressure({
    this.bloodPressure,
    this.measurements
  });

  factory BloodPressure.fromJson(Map<String, dynamic> json) => new BloodPressure(
    bloodPressure: json["bloodPressure"],
    measurements: json["measurements"]
  );

  Map<String, dynamic> toJson() => {
    "bloodPressure": bloodPressure,
    "measurements": measurements,

  };
}