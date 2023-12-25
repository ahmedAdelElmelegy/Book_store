part of 'science_book_cubit.dart';

sealed class ScienceBookState extends Equatable {
  const ScienceBookState();

  @override
  List<Object> get props => [];
}

final class ScienceBookInitial extends ScienceBookState {}

final class ScienceBookLoading extends ScienceBookState {}

final class ScienceBookSucess extends ScienceBookState {
  final List<BookModel> books;

  const ScienceBookSucess({required this.books});
}

final class ScienceBookFailed extends ScienceBookState {
  final String errorMassage;

  const ScienceBookFailed({required this.errorMassage});
}
