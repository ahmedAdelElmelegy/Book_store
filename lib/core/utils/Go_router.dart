import 'package:book_app/core/utils/ApiServices.dart';
import 'package:book_app/features/Navgat_home/presentation/view/Navgate_view.dart';
import 'package:book_app/features/Splash/presentation/view/Splash_view.dart';
import 'package:book_app/features/home/data/Repo/HomeRepImp.dart';
import 'package:book_app/features/home/data/Repo/HomeRepo.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/home/presentation/manager/Simularbook/simulat_book_cubit.dart';
import 'package:book_app/features/home/presentation/view/book_View.dart';
import 'package:book_app/features/home/presentation/view/home.dart';
import 'package:book_app/features/home/presentation/view/widgets/Search.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

const String home = '/home';
const String bookview = '/bookview';
const String navigateHome = '/NavigateHome';
const String search = '/search';
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => Home(),
    ),
    GoRoute(
      path: '/NavigateHome',
      builder: (context, state) => const NavigateHome(),
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) => SearchPage(),
    ),
    GoRoute(
      path: '/bookview',
      builder: (context, state) => BlocProvider(
        create: (context) => SimulatBookCubit(
          HomeRepoImpl(
            apiServices: ApiServices(
              Dio(),
            ),
          ),
        ),
        child: BookView(
          books: state.extra as BookModel,
        ),
      ),
    ),
  ],
);
