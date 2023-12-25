import 'package:book_app/core/utils/Go_router.dart';
import 'package:book_app/core/widgets/CustomErrorMassge.dart';
import 'package:book_app/core/widgets/CustomLoadingIndicatior.dart';
import 'package:book_app/features/home/presentation/manager/NewsetBookDetailes/newset_book_detiles_cubit.dart';
import 'package:book_app/features/home/presentation/view/widgets/Custom_list_view_new_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';

class CustomNewbookListview extends StatelessWidget {
  const CustomNewbookListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBookDetilesCubit, NewsetBookDetilesState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<NewsetBookDetilesCubit>(context);
        if (state is NewsetBookDetilesSucess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.books.length,
              itemBuilder: (context, index) =>
                  CustomNewBookListItem(books: state.books[index]),
            ),
          );
        } else if (state is NewsetBookDetilesFailed) {
          return CustomErorrFailure(failureMassage: state.erorrMassage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
