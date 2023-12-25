import 'package:book_app/core/function/getText.dart';
import 'package:book_app/core/function/lauchurl.dart';
import 'package:book_app/core/widgets/CusotmButtom.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookAction extends StatelessWidget {
  const BookAction({
    super.key,
    required this.book,
  });
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          CustomButtom(
            onPressed: () {},
            textColor: Colors.black,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
            fontSize: 20,
            text: 'Free',
            bagroundColor: Colors.white,
          ),
          CustomButtom(
            onPressed: () async {
              if (book.volumeInfo.previewLink == null) {
                return;
              } else {
                launchUrlPreview(book, context);
              }
            },
            textColor: Colors.white,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16)),
            fontSize: 20,
            text: gettext(book),
            bagroundColor: const Color(0xffEf8262),
          ),
        ],
      ),
    );
  }
}
