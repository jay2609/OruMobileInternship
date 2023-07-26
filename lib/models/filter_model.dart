class FiltersModel {
  final List<String> make;
  final List<String> condition;
  final List<String> storage;
  final List<String> ram;
  final String message;

  FiltersModel({
    required this.make,
    required this.condition,
    required this.storage,
    required this.ram,
    required this.message,
  });

  factory FiltersModel.fromJson(Map<String, dynamic> json) {
    return FiltersModel(
      make: List<String>.from(json['make'] ?? []),
      condition: List<String>.from(json['condition'] ?? []),
      storage: List<String>.from(json['storage'] ?? []),
      ram: List<String>.from(json['ram'] ?? []),
      message: json['message'] ?? '',
    );
  }
}
