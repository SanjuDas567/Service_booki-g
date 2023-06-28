class ApiResponse<T> {
  bool success;
  T? data;
  String? errorMessage;

  ApiResponse({
    required this.success,
    this.data,
    this.errorMessage,
  });

  factory ApiResponse.withSuccess(T data) {
    return ApiResponse<T>(
      success: true,
      data: data,
    );
  }

  factory ApiResponse.withError(String errorMessage) {
    return ApiResponse<T>(
      success: false,
      errorMessage: errorMessage,
    );
  }
}