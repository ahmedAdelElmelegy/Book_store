import 'package:book_app/core/utils/Go_router.dart';
import 'package:book_app/core/utils/assets.dart';
import 'package:book_app/core/widgets/Custom_text.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/home/presentation/view/widgets/Custom_newset_rate.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomScienceBooksListViewItem extends StatelessWidget {
  const CustomScienceBooksListViewItem({super.key, required this.books});
  final BookModel books;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(bookview, extra: books);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: SizedBox(
          height: size.height * .15,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 2.8 / 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: FancyShimmerImage(
                      imageUrl: books.volumeInfo.imageLinks?.thumbnail ?? ''),
                ),
              ),
              SizedBox(
                width: size.width * .03,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: books.volumeInfo.title.toString(),
                      fontSize: 25,
                      maxLines: 2,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: size.height * .01,
                    ),
                    CustomText(
                      text: books.volumeInfo.authors?[0] ?? '',
                      fontSize: 16,
                    ),
                    SizedBox(
                      height: size.height * .01,
                    ),
                    CustomNewsetRate(
                      size: size,
                      printType: books.volumeInfo.pageCount.toString(),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.bookmark_border, size: 25)
            ],
          ),
        ),
      ),
    );
  }
}
