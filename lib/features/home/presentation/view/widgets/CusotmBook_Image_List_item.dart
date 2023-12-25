import 'package:book_app/core/widgets/Custom_text.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class CustomBookImageListItem extends StatelessWidget {
  const CustomBookImageListItem({super.key, required this.books});
  final BookModel books;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: SizedBox(
        width: size.width * .37,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 2.8 / 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FancyShimmerImage(
                  imageUrl: books.volumeInfo.imageLinks?.thumbnail ?? '',
                ),
              ),
            ),
            CustomText(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              text: books.volumeInfo.title.toString(),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              maxLines: 2,
            )
          ],
        ),
      ),
    );
  }
}
