import 'package:book_app/core/widgets/CustomErrorMassge.dart';
import 'package:book_app/core/widgets/CustomLoadingIndicatior.dart';
import 'package:book_app/core/widgets/CustomTextfield.dart';
import 'package:book_app/features/Sports/presentation/manager/cubit/featch_sport_book_cubit.dart';
import 'package:book_app/features/Sports/presentation/view/widgets/CutomBookListViewItem.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/home/presentation/view/widgets/AppbarText.dart';
import 'package:book_app/features/home/presentation/view/widgets/CustomActionButtom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SportView extends StatefulWidget {
  const SportView({super.key});

  @override
  State<SportView> createState() => _SportViewState();
}

class _SportViewState extends State<SportView> {
  List<BookModel> books = [];
  List<BookModel> filterBooks = [];
  bool isSearch = false;
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: isSearch ? appText() : searchicon(),
        body: BlocBuilder<FeatchSportBookCubit, FeatchSportBookState>(
          builder: (context, state) {
            var cubit = BlocProvider.of<FeatchSportBookCubit>(context);

            if (state is FeatchSportBookSucess) {
              books = state.books;
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: filterBooks.isNotEmpty
                      ? filterBooks.length
                      : state.books.length,
                  itemBuilder: (context, index) => CustomSportBooksListViewItem(
                    books: filterBooks.isNotEmpty
                        ? filterBooks[index]
                        : state.books[index],
                  ),
                ),
              );
            } else if (state is FeatchSportBookFailure) {
              return CustomErorrFailure(failureMassage: state.errorMassage);
            } else {
              return const CustomLoadingIndicator();
            }
          },
        ));
  }

  void addDatatoFilteredData({required String input}) {
    setState(() {
      filterBooks = books
          .where((element) =>
              element.volumeInfo.title!.toLowerCase().startsWith(input))
          .toList();
    });
  }

  PreferredSizeWidget searchicon() {
    return AppBar(
      leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
          )),
      title: const AppbarText(
        text: 'Sport',
      ),
      actions: [
        CustomActionButtom(
          onPressed: () {
            setState(() {
              isSearch = true;
            });
          },
        )
      ],
    );
  }

  PreferredSizeWidget appText() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: CustomTextField(
          hintText: "search",
          onChanged: (input) {
            addDatatoFilteredData(input: input);
          },
          controller: searchController),
      actions: [
        IconButton(
            onPressed: () {
              setState(() {
                searchController.text = "";
              });
            },
            icon: const Icon(
              Icons.clear,
              color: Colors.red,
            )),
      ],
    );
  }
}
