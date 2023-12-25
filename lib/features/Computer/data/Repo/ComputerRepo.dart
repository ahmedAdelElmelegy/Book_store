import 'package:book_app/core/errors/Failures.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class ComputerRepo {
  Future<Either<Failure, List<BookModel>>> fetchProgramingBooks();
  Future<Either<Failure, List<BookModel>>> fetchsimularBooks(
      {required String category});
}
