import 'package:book_app/core/widgets/CustomErrorMassge.dart';
import 'package:book_app/core/widgets/CustomLoadingIndicatior.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/home/presentation/manager/FeaturesBooksDetailes/features_book_details_cubit.dart';
import 'package:book_app/features/home/presentation/view/widgets/CusotmBook_Image_List_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBookImageListview extends StatelessWidget {
  const CustomBookImageListview({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<FeaturesBookDetailsCubit, FeaturesBookDetailsState>(
        builder: (context, state) {
      if (state is FeaturesBookDetailsSucess) {
        return SizedBox(
            height: size.height * .33,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  CustomBookImageListItem(books: state.books[index]),
            ));
      } else if (state is FeaturesBookDetailsFailure) {
        return CustomErorrFailure(failureMassage: state.erorrMassage);
      } else {
        return const CustomLoadingIndicator();
      }
    });
  }
}
