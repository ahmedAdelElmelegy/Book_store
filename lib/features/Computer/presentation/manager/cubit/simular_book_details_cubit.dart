import 'package:bloc/bloc.dart';
import 'package:book_app/features/Computer/data/Repo/ComputerRepo.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

part 'simular_book_details_state.dart';

class SimularBookDetailsCubit extends Cubit<SimularBookDetailsState> {
  SimularBookDetailsCubit(this.computerRepo)
      : super(SimularBookDetailsInitial());
  ComputerRepo computerRepo;
  Future<void> fetchSimularBooks({required String category}) async {
    emit(SimularBookDetailsLoading());
    var result = await computerRepo.fetchsimularBooks(category: category);
    result.fold((failure) {
      emit(SimularBookDetailsFailed(erorrMassage: failure.toString()));
    }, (books) {
      emit(SimularBookDetailsSucess(books: books));
    });
  }
}
