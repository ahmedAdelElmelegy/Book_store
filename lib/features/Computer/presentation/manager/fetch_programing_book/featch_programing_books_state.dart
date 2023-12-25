part of 'featch_programing_books_cubit.dart';

sealed class FeatchProgramingBooksState extends Equatable {
  const FeatchProgramingBooksState();

  @override
  List<Object> get props => [];
}

final class FeatchProgramingBooksInitial extends FeatchProgramingBooksState {}

final class FeatchProgramingBooksLoading extends FeatchProgramingBooksState {}

final class FeatchProgramingBooksSucess extends FeatchProgramingBooksState {
  final List<BookModel> books;

  const FeatchProgramingBooksSucess({required this.books});
}

final class FeatchProgramingBooksFailure extends FeatchProgramingBooksState {
  final String errorMassage;

  const FeatchProgramingBooksFailure({required this.errorMassage});
}
