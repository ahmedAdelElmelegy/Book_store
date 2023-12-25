import 'package:bloc/bloc.dart';
import 'package:book_app/features/Science/data/Repo/ScienceRepo.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

part 'science_book_state.dart';

class ScienceBookCubit extends Cubit<ScienceBookState> {
  ScienceBookCubit(this.scienceRepo) : super(ScienceBookInitial());
  final ScienceRepo scienceRepo;
  Future<void> fetchSciencebook() async {
    emit(ScienceBookLoading());
    var result = await scienceRepo.feturesScienceBook();
    result.fold((failure) {
      emit(ScienceBookFailed(errorMassage: failure.toString()));
    }, (books) {
      emit(ScienceBookSucess(books: books));
    });
  }
}
