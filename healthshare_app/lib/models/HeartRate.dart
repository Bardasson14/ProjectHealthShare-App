
class HeartRate{
  int heartRate;
  int measurements;

  HeartRate({
    this.heartRate,
    this.measurements
  });

  factory HeartRate.fromJson(Map<String, dynamic> json) => new HeartRate(
    heartRate: json["heartRate"],
    measurements: json["measurements"]
  );

  Map<String, dynamic> toJson() => {
    "heartRate": heartRate,
    "measurements": measurements
  };
}