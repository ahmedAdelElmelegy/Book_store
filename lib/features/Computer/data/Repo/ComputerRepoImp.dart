import 'package:book_app/core/errors/Failures.dart';
import 'package:book_app/core/utils/ApiServices.dart';
import 'package:book_app/features/Computer/data/Repo/ComputerRepo.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ComputerRepoImp extends ComputerRepo {
  final ApiServices apiServices;

  ComputerRepoImp({required this.apiServices});
  @override
  Future<Either<Failure, List<BookModel>>> fetchProgramingBooks() async {
    try {
      var data = await apiServices.get(
          endPoint:
              'volumes?Filtering=free-ebooks&Sorting=newest&q=subject:Programming');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(
          ServerFailure.fromDioExeption(e),
        );
      }
      return left(ServerFailure(
        e.toString(),
      ));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchsimularBooks(
      {required String category}) async {
    try {
      var data = await apiServices.get(
          endPoint:
              'volumes?Filtering=free-ebooks&Sorting=newest&q=subject:Programming');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(
          ServerFailure.fromDioExeption(e),
        );
      }
      return left(ServerFailure(
        e.toString(),
      ));
    }
  }
}
