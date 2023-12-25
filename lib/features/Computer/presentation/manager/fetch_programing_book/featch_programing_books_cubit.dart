import 'package:bloc/bloc.dart';
import 'package:book_app/features/Computer/data/Repo/ComputerRepo.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

part 'featch_programing_books_state.dart';

class FeatchProgramingBooksCubit extends Cubit<FeatchProgramingBooksState> {
  FeatchProgramingBooksCubit(this.computerRepo)
      : super(FeatchProgramingBooksInitial());
  final ComputerRepo computerRepo;
  Future<void> fetchComputerBooks() async {
    emit(FeatchProgramingBooksLoading());
    var result = await computerRepo.fetchProgramingBooks();
    result.fold((failure) {
      emit(FeatchProgramingBooksFailure(errorMassage: failure.toString()));
    }, (books) {
      emit(FeatchProgramingBooksSucess(books: books));
    });
  }
}
