import 'package:book_app/core/models/Profile_model.dart';
import 'package:book_app/core/widgets/Custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class CustomProfileListViewItem extends StatelessWidget {
  const CustomProfileListViewItem(
      {super.key, required this.profileModel, this.onPressed});
  final ProfileModel profileModel;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 16,
            backgroundImage: AssetImage(profileModel.image!),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .05,
          ),
          CustomText(
            text: profileModel.title,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          const Spacer(),
          IconButton(
              onPressed: onPressed, icon: const Icon(IconlyLight.arrowRight2))
        ],
      ),
    );
  }
}
