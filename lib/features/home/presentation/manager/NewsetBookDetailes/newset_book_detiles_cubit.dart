import 'package:bloc/bloc.dart';
import 'package:book_app/features/home/data/Repo/HomeRepo.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

part 'newset_book_detiles_state.dart';

class NewsetBookDetilesCubit extends Cubit<NewsetBookDetilesState> {
  NewsetBookDetilesCubit(this.homeRepo) : super(NewsetBookDetilesInitial());
  final HomeRepo homeRepo;

  Future<void> fetchNewsetBooks() async {
    emit(NewsetBookDetilesLoading());
    var result = await homeRepo.fetchNewsBooks();
    result.fold((failure) {
      emit(NewsetBookDetilesFailed(erorrMassage: failure.toString()));
    }, (books) {
      books = books;
      emit(NewsetBookDetilesSucess(books: books));
    });
  }

  bool isSearch = false;
  void search() {
    isSearch = !isSearch;
  }
}
