import 'package:book_app/core/widgets/Custom_text.dart';
import 'package:book_app/features/home/presentation/view/widgets/CustomBook_image_list_view.dart';
import 'package:book_app/features/home/presentation/view/widgets/Custom_new_book_List_view.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
      SliverToBoxAdapter(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.orange,
                    highlightColor: Colors.red,
                    period: const Duration(seconds: 12),
                    child: const CustomText(
                      text: 'My Books',
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(
                    height: size.height * .02,
                  ),
                  const CustomBookImageListview(),
                  SizedBox(
                    height: size.height * .02,
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.orange,
                    highlightColor: Colors.red,
                    period: const Duration(seconds: 12),
                    child: const CustomText(
                      text: 'See Also',
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(
                    height: size.height * .02,
                  ),
                ],
              ))),
      const SliverToBoxAdapter(
        child: CustomNewbookListview(),
      )
    ]);
  }
}
