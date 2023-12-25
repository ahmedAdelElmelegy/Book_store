import 'package:book_app/core/widgets/CustomErrorMassge.dart';
import 'package:book_app/core/widgets/CustomLoadingIndicatior.dart';
import 'package:book_app/features/home/presentation/manager/Simularbook/simulat_book_cubit.dart';
import 'package:book_app/features/home/presentation/view/widgets/CustomSimularImage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SmillierBooksListview extends StatelessWidget {
  const SmillierBooksListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimulatBookCubit, SimulatBookState>(
      builder: (context, state) {
        if (state is SimulatBookSucess) {
          return SizedBox(
              height: MediaQuery.of(context).size.height * .17,
              child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => CustomSimularImage(
                        image: state.books[index].volumeInfo.imageLinks
                                ?.thumbnail ??
                            '',
                      )));
        } else if (state is SimulatBookFailure) {
          return CustomErorrFailure(failureMassage: state.erorrMassage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
