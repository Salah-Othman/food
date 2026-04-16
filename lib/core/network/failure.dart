import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;
  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('اتصالك بالإنترنت ضعيف، خد وقت طويل.');
      case DioExceptionType.sendTimeout:
        return ServerFailure('فشل في إرسال البيانات للسيرفر.');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('السيرفر اتأخر في الرد، حاول تاني.');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('تم إلغاء طلبك للسيرفر.');
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure('مفيش اتصال بالإنترنت.');
        }
        return ServerFailure('حصل خطأ غير متوقع، حاول لاحقاً.');
      default:
        return ServerFailure('أوبس! فيه حاجة غلط حصلت.');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['message'] ?? 'خطأ في المصادقة أو الطلب.');
    } else if (statusCode == 404) {
      return ServerFailure('الطلب اللي بتدور عليه مش موجود (404).');
    } else if (statusCode == 500) {
      return ServerFailure('مشكلة من السيرفر، جرب كمان شوية.');
    } else {
      return ServerFailure('حصل خطأ، كود الخطأ: $statusCode');
    }
  }
}