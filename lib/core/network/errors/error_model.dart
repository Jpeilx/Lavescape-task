class ErrorModel {
  int? statusCode;
  late String message;
  ErrorModel.fromjson(Map<String, dynamic> json) {
    statusCode = json['status'];
    message = json['message'];
  }
}
