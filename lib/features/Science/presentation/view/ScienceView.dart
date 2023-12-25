import 'package:book_app/core/widgets/CustomErrorMassge.dart';
import 'package:book_app/core/widgets/CustomLoadingIndicatior.dart';
import 'package:book_app/core/widgets/CustomTextfield.dart';
import 'package:book_app/features/Science/presentation/manager/cubit/science_book_cubit.dart';
import 'package:book_app/features/Science/presentation/view/widgets/Custom_science_list_view_item.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/home/presentation/view/widgets/AppbarText.dart';
import 'package:book_app/features/home/presentation/view/widgets/CustomActionButtom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScienceView extends StatefulWidget {
  const ScienceView({super.key});

  @override
  State<ScienceView> createState() => _ScienceViewState();
}

class _ScienceViewState extends State<ScienceView> {
  List<BookModel> books = [];
  List<BookModel> filterBooks = [];
  bool isSearch = false;
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: isSearch ? appText() : searchicon(),
        body: BlocBuilder<ScienceBookCubit, ScienceBookState>(
          builder: (context, state) {
            var cubit = BlocProvider.of<ScienceBookCubit>(context);
            if (state is ScienceBookSucess) {
              books = state.books;
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: filterBooks.isNotEmpty
                      ? filterBooks.length
                      : state.books.length,
                  itemBuilder: (context, index) => GestureDetector(
                      onTap: () {},
                      child: CustomScienceBooksListViewItem(
                        books: filterBooks.isNotEmpty
                            ? filterBooks[index]
                            : state.books[index],
                      )),
                ),
              );
            } else if (state is ScienceBookFailed) {
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
        text: 'Science',
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
          hintText: "Science",
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
