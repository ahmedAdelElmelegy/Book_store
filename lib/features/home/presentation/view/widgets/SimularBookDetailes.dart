import 'package:book_app/core/widgets/Custom_text.dart';
import 'package:book_app/features/home/presentation/view/widgets/SmullierBooksListView.dart';

import 'package:flutter/material.dart';

class SimmilerBooksDetailes extends StatelessWidget {
  const SimmilerBooksDetailes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: CustomText(
            text: 'You can  also like',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: size.height * .03,
        ),
        const SmillierBooksListview(),
      ],
    );
  }
}
