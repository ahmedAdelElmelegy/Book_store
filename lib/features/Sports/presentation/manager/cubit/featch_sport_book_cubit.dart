import 'package:bloc/bloc.dart';
import 'package:book_app/features/Sports/data/Repo/SportRepo.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

part 'featch_sport_book_state.dart';

class FeatchSportBookCubit extends Cubit<FeatchSportBookState> {
  FeatchSportBookCubit(this.sportRepo) : super(FeatchSportBookInitial());
  final SportRepo sportRepo;
  Future<void> fetchSportbooks() async {
    emit(FeatchSportBookLoading());
    var result = await sportRepo.fetchSportBooks();
    result.fold((failure) {
      emit(FeatchSportBookFailure(errorMassage: failure.toString()));
    }, (books) {
      emit(FeatchSportBookSucess(books: books));
    });
  }
}
