enum AppThemeMode {
  light,
  dark,
  system;

  String toJson() => name;
  
  static AppThemeMode fromJson(String json) {
    return AppThemeMode.values.firstWhere(
      (mode) => mode.name == json,
      orElse: () => AppThemeMode.system,
    );
  }
}