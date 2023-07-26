// model.dart
class SearchModel {
  final List<String> makes;
  final List<String> models;
  final String message;

  SearchModel(
      {required this.makes, required this.models, required this.message});

  factory SearchModel.fromJson(Map<dynamic, dynamic> json) {
    return SearchModel(
      makes: List<String>.from(json['makes']),
      models: List<String>.from(json['models']),
      message: json['message'],
    );
  }
}
