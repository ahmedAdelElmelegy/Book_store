import 'package:book_app/core/models/Profile_model.dart';
import 'package:book_app/core/utils/Constant.dart';
import 'package:book_app/core/utils/assets.dart';
import 'package:book_app/core/widgets/Custom_text.dart';
import 'package:book_app/features/profile/presentation/manager/cubit/profile_cubit.dart';
import 'package:book_app/features/profile/presentation/view/widgets/CustomProfile_List_view_Item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .01,
        ),
        const Visibility(
            visible: false,
            child: CustomText(
              text: 'please login  to have unlimited access',
              fontSize: 22,
              fontWeight: FontWeight.bold,
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Theme.of(context).colorScheme.background,
                child: CircleAvatar(
                  radius: 28,
                  backgroundColor: Theme.of(context).cardColor,
                  backgroundImage: const NetworkImage(
                      'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?w=900&t=st=1697276951~exp=1697277551~hmac=5aea6edd8bd852ee6b8efb094c18894341ee58e4641b80f0e3e1d982289dabf9'),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .05,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Ahmed Adel',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    text: 'Coding.with.ahmed@gmail.com',
                    fontSize: 18,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .03,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 13),
          child: CustomText(
            text: 'General',
            fontSize: 21,
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .01,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .32,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: Constant.items.length,
                itemBuilder: (context, index) => CustomProfileListViewItem(
                      profileModel: Constant.items[index],
                      onPressed: () {},
                    )),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 13),
          child: Divider(
            thickness: .5,
            color: Colors.grey,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 13),
          child: CustomText(
            text: 'Settings',
            fontSize: 21,
            fontWeight: FontWeight.w900,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              var cubit = BlocProvider.of<ProfileCubit>(context);
              return SwitchListTile(
                  value: cubit.darktheme,
                  title: Row(
                    children: [
                      const CircleAvatar(
                        radius: 16,
                        backgroundImage: AssetImage(Assets.imagesProfileTheme),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .05,
                      ),
                      Text(
                        cubit.darktheme ? 'Dark mode' : 'Light mode',
                        style: const TextStyle(fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  onChanged: (bool value) {
                    cubit.setThem(value);
                  });
            },
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 13),
          child: Divider(
            thickness: .5,
            color: Colors.grey,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 13),
          child: CustomText(
            text: 'Others',
            fontSize: 21,
            fontWeight: FontWeight.w900,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: CustomProfileListViewItem(
              profileModel: ProfileModel(
                  image: Assets.imagesProfilePrivacy,
                  title: 'Privacy & Policy')),
        ),
        Center(
            child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(30)),
          ),
          onPressed: () {},
          icon: const Icon(Icons.login),
          label: const Text('Login'),
        )),
      ],
    );
  }
}
