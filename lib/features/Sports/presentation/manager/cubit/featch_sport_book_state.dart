part of 'featch_sport_book_cubit.dart';

sealed class FeatchSportBookState extends Equatable {
  const FeatchSportBookState();

  @override
  List<Object> get props => [];
}

final class FeatchSportBookInitial extends FeatchSportBookState {}

final class FeatchSportBookLoading extends FeatchSportBookState {}

final class FeatchSportBookSucess extends FeatchSportBookState {
  final List<BookModel> books;

  const FeatchSportBookSucess({required this.books});
}

final class FeatchSportBookFailure extends FeatchSportBookState {
  final String errorMassage;

  const FeatchSportBookFailure({required this.errorMassage});
}
