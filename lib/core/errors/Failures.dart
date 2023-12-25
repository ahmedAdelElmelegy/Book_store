import 'package:dio/dio.dart';

abstract class Failure {
  final String erorrMassage;

  Failure(this.erorrMassage);
}

class ServerFailure extends Failure {
  ServerFailure(super.erorrMassage);

  factory ServerFailure.fromDioExeption(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure('connection timeout ApiServer');
      case DioErrorType.sendTimeout:
        return ServerFailure(' Sendtimeout ApiServer');
      case DioErrorType.receiveTimeout:
        return ServerFailure('receiveTimeout ApiServer');
      case DioErrorType.badCertificate:
        return ServerFailure('BadCertificate ApiServer');
      case DioErrorType.badResponse:
        return ServerFailure.fromResponce(
            dioError.response!.statusCode!, dioError.response!.data); //
      case DioErrorType.cancel:
        return ServerFailure('Cancel ApiServer');
      case DioErrorType.connectionError:
        return ServerFailure(' ConnectionErorr ApiServer');
      case DioErrorType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Erorr,Please Try again');
      default:
        return ServerFailure('Opps  There  was  an erorr ,Please try again');
    }
  }
  factory ServerFailure.fromResponce(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['erorr']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request  not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server erorr , Please try later');
    } else {
      return ServerFailure('Opps  There  was  an erorr ,Please try again');
    }
  }
}
