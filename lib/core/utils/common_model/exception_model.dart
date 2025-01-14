class ExceptionModel {
  final int? code;
  final String? message;
  final String? details; 

  ExceptionModel({this.code, required this.message, this.details});

  @override
  String toString() {
    return 'Exception => (code: $code, message: $message, details: $details)';
  }
}