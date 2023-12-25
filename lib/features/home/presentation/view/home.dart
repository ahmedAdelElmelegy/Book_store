import 'package:book_app/core/utils/Go_router.dart';
import 'package:book_app/core/widgets/CustomTextfield.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/home/presentation/manager/NewsetBookDetailes/newset_book_detiles_cubit.dart';
import 'package:book_app/features/home/presentation/view/widgets/AppbarText.dart';
import 'package:book_app/features/home/presentation/view/widgets/CustomActionButtom.dart';
import 'package:book_app/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
            )),
        title: const AppbarText(
          text: 'BookStore',
        ),
        actions: [
          CustomActionButtom(
            onPressed: () {
              GoRouter.of(context).push(search);
            },
          )
        ],
      ),
      body: const HomeViewBody(),
    );
  }
}
