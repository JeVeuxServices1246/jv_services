class ApiResponse {
  bool status;
  String message;
  dynamic data;
  ApiResponse(
      {required this.status, required this.message, required this.data});

  factory ApiResponse.fromJson(Map<dynamic, dynamic> json) {
    return ApiResponse(
      status: json['status'],
      message: json['message'],
      data: json['data'],
    );
  }
}
