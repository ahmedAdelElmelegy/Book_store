import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/home/presentation/view/widgets/CusotomAppbarbookdetailsView.dart';
import 'package:book_app/features/home/presentation/view/widgets/SimularBookDetailes.dart';
import 'package:book_app/features/home/presentation/view/widgets/bookAction.dart';
import 'package:book_app/features/home/presentation/view/widgets/bookRating.dart';
import 'package:book_app/features/home/presentation/view/widgets/booksDetailsSection.dart';
import 'package:flutter/material.dart';

class BookViewBody extends StatelessWidget {
  const BookViewBody({super.key, required this.books});
  final BookModel books;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    height: size.height * .04,
                  ),
                ),
                const CustomAppBarBookDetailesView(),
                BookDetailsSection(book: books),
                Expanded(
                  child: SizedBox(
                    height: size.height * .02,
                  ),
                ),
                BookRating(
                  count: books.volumeInfo.pageCount.toString(),
                  size: size,
                ),
                Expanded(
                  child: SizedBox(
                    height: size.height * .02,
                  ),
                ),
                BookAction(
                  book: books,
                ),
                Expanded(
                  child: SizedBox(
                    height: size.height * .08,
                  ),
                ),
                const SimmilerBooksDetailes(),
                Expanded(
                  child: SizedBox(
                    height: size.height * .01,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
