import 'package:book_app/core/widgets/Custom_text.dart';
import 'package:flutter/material.dart';

class CustomNewsetRate extends StatelessWidget {
  const CustomNewsetRate({
    super.key,
    required this.size,
    required this.printType,
  });
  final String printType;

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            const Icon(
              Icons.content_copy,
              size: 25,
            ),
            SizedBox(
              width: size.width * .01,
            ),
            CustomText(
              text: printType,
              fontSize: 18,
            )
          ],
        ),
        SizedBox(
          width: size.width * .1,
        ),
        Row(
          children: [
            const Icon(
              Icons.star,
              color: Colors.orange,
              size: 25,
            ),
            CustomText(
              text: '4.0',
              fontSize: 18,
            )
          ],
        ),
      ],
    );
  }
}
