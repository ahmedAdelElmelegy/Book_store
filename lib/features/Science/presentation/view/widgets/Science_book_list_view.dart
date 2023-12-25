import 'package:book_app/core/widgets/CustomErrorMassge.dart';
import 'package:book_app/core/widgets/CustomLoadingIndicatior.dart';
import 'package:book_app/features/Computer/presentation/view/widgets/Custom_computer_books_list_view_item.dart';
import 'package:book_app/features/Science/presentation/manager/cubit/science_book_cubit.dart';
import 'package:book_app/features/Science/presentation/view/widgets/Custom_science_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScienceBookListView extends StatelessWidget {
  const ScienceBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScienceBookCubit, ScienceBookState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<ScienceBookCubit>(context);
        if (state is ScienceBookSucess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) => GestureDetector(
                  onTap: () {},
                  child: CustomScienceBooksListViewItem(
                    books: state.books[index],
                  )),
            ),
          );
        } else if (state is ScienceBookFailed) {
          return CustomErorrFailure(failureMassage: state.errorMassage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
