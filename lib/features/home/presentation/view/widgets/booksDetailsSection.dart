import 'package:book_app/core/widgets/Custom_text.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({
    super.key,
    required this.book,
  });
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: SizedBox(
            height: size.height * .3,
            child: AspectRatio(
                aspectRatio: 2.6 / 4,
                child: FancyShimmerImage(
                    imageUrl: book.volumeInfo.imageLinks?.thumbnail ?? '')),
          ),
        ),
        SizedBox(
          height: size.height * .04,
        ),
        CustomText(
          text: book.volumeInfo.title ?? "",
          fontSize: 30,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: size.height * .01,
        ),
        Opacity(
          opacity: .7,
          child: CustomText(
            text: book.volumeInfo.authors![0],
            fontSize: 18,
          ),
        ),
        SizedBox(
          height: size.height * .005,
        ),
      ],
    );
  }
}
