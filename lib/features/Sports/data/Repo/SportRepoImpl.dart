import 'package:book_app/core/errors/Failures.dart';
import 'package:book_app/core/utils/ApiServices.dart';
import 'package:book_app/features/Sports/data/Repo/SportRepo.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SportRepoImp extends SportRepo {
  final ApiServices apiServices;

  SportRepoImp({required this.apiServices});

  @override
  Future<Either<Failure, List<BookModel>>> fetchSportBooks() async {
    try {
      var data = await apiServices.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=subject:Sport');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
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
