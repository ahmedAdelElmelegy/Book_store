import 'package:bloc/bloc.dart';
import 'package:book_app/core/utils/app_color.dart';
import 'package:book_app/features/Computer/presentation/view/Computer_view.dart';
import 'package:book_app/features/Science/presentation/view/ScienceView.dart';
import 'package:book_app/features/Sports/presentation/view/SportView.dart';
import 'package:book_app/features/home/presentation/view/home.dart';
import 'package:book_app/features/profile/presentation/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

part 'navigat_betwen_screen_state.dart';

class NavigatBetwenScreenCubit extends Cubit<NavigatBetwenScreenState> {
  NavigatBetwenScreenCubit() : super(NavigatBetwenScreenInitial());
  int currentIndex = 0;
  void navigation(int index) {
    currentIndex = index;
    emit(NavigatBetwenScreenSucess());
  }

  List<Widget> screens = [
    Home(),
    ComputerView(),
    ScienceView(),
    SportView(),
    ProfileView(),
  ];
  List<NavigationDestination> items = const [
    NavigationDestination(
        icon: Icon(IconlyLight.home),
        selectedIcon: Icon(IconlyBold.home),
        label: 'home'),
    NavigationDestination(
        icon: Icon(Icons.computer),
        selectedIcon: Icon(Icons.computer),
        label: 'Programing'),
    NavigationDestination(
        icon: Icon(Icons.science),
        selectedIcon: Icon(Icons.science),
        label: 'Scinece'),
    NavigationDestination(
        icon: Icon(Icons.sports),
        selectedIcon: Icon(Icons.sports),
        label: 'Sport'),
    NavigationDestination(
        icon: Icon(IconlyLight.profile),
        selectedIcon: Icon(IconlyBold.profile),
        label: 'Profile')
  ];

  // ];

  // final item = const <Widget>[
  //   Icon(
  //     Icons.home,
  //     size: 30,
  //   ),
  //   Icon(
  //     Icons.computer,
  //     size: 30,
  //   ),
  //   Icon(Icons.science),
  //   Icon(
  //     Icons.sports,
  //     size: 30,
  //   ),
  //   Icon(
  //     IconlyBold.user2,
  //     size: 30,
  //   )
  // ];
}
