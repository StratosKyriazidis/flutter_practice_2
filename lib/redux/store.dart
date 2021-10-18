class AppState {
  String height = '';
  String weight = '';
  String age = '';
  String bmi = '';
  String bmiStatus = '';
  bool isMale = true;

  AppState({
    required this.height,
    required this.weight,
    required this.age,
    required this.bmi,
    required this.bmiStatus,
    required this.isMale,
  });

  AppState copyWith({
    String? height,
    String? weight,
    String? age,
    String? bmi,
    String? bmiStatus,
    bool? isMale,
  }) {
    return AppState(
      height: height ?? this.height,
      weight: weight ?? this.weight,
      age: age ?? this.age,
      bmi: bmi ?? this.bmi,
      bmiStatus: bmiStatus ?? this.bmiStatus,
      isMale: isMale ?? this.isMale,
    );
  }

  factory AppState.initial() {
    return AppState(
      height: '180',
      weight: '60',
      age: '20',
      bmi: '20',
      bmiStatus: 'Nice',
      isMale: true,
    );
  }
}
