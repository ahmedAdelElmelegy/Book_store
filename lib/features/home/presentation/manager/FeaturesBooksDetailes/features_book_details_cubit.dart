import 'package:bloc/bloc.dart';
import 'package:book_app/features/home/data/Repo/HomeRepo.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

part 'features_book_details_state.dart';

class FeaturesBookDetailsCubit extends Cubit<FeaturesBookDetailsState> {
  FeaturesBookDetailsCubit(this.homeRepo) : super(FeaturesBookDetailsInitial());
  final HomeRepo homeRepo;
  Future<void> fetchFeaturesBooks() async {
    emit(FeaturesBookDetailsLoading());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold((failure) {
      emit(FeaturesBookDetailsFailure(erorrMassage: failure.toString()));
    }, (books) {
      emit(FeaturesBookDetailsSucess(books: books));
    });
  }
}
