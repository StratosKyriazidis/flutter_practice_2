class AppState {
  String height = '';
  String weight = '';
  String age = '';
  bool isMale = true;

  AppState({
    required this.height,
    required this.weight,
    required this.age,
    required this.isMale,
  });

  AppState copyWith({
    String? height,
    String? weight,
    String? age,
    bool? isMale,
  }) {
    return AppState(
      height: height ?? this.height,
      weight: weight ?? this.weight,
      age: age ?? this.age,
      isMale: isMale ?? this.isMale,
    );
  }

  factory AppState.initial() {
    return AppState(
      height: '180',
      weight: '60',
      age: '20',
      isMale: true,
    );
  }
}
