part of 'simular_book_details_cubit.dart';

sealed class SimularBookDetailsState extends Equatable {
  const SimularBookDetailsState();

  @override
  List<Object> get props => [];
}

final class SimularBookDetailsInitial extends SimularBookDetailsState {}

final class SimularBookDetailsLoading extends SimularBookDetailsState {}

final class SimularBookDetailsSucess extends SimularBookDetailsState {
  final List<BookModel> books;

  const SimularBookDetailsSucess({required this.books});
}

final class SimularBookDetailsFailed extends SimularBookDetailsState {
  final String erorrMassage;

  const SimularBookDetailsFailed({required this.erorrMassage});
}
