import 'package:book_app/core/utils/ApiServices.dart';
import 'package:book_app/core/utils/Go_router.dart';
import 'package:book_app/core/utils/Style.dart';
import 'package:book_app/features/Computer/data/Repo/ComputerRepoImp.dart';
import 'package:book_app/features/Computer/presentation/manager/fetch_programing_book/featch_programing_books_cubit.dart';
import 'package:book_app/features/Navgat_home/presentation/manager/cubit/navigat_betwen_screen_cubit.dart';
import 'package:book_app/features/Science/data/Repo/ScienceRepoimp.dart';
import 'package:book_app/features/Science/presentation/manager/cubit/science_book_cubit.dart';
import 'package:book_app/features/Sports/data/Repo/SportRepoImpl.dart';
import 'package:book_app/features/Sports/presentation/manager/cubit/featch_sport_book_cubit.dart';
import 'package:book_app/features/home/data/Repo/HomeRepImp.dart';
import 'package:book_app/features/home/presentation/manager/FeaturesBooksDetailes/features_book_details_cubit.dart';
import 'package:book_app/features/home/presentation/manager/NewsetBookDetailes/newset_book_detiles_cubit.dart';
import 'package:book_app/features/profile/presentation/manager/cubit/profile_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const BookApp());
}

class BookApp extends StatelessWidget {
  const BookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavigatBetwenScreenCubit(),
        ),
        BlocProvider(
          create: (context) => ProfileCubit()..getTheme(),
        ),
        BlocProvider(
            create: (context) => FeaturesBookDetailsCubit(
                  HomeRepoImpl(
                    apiServices: ApiServices(
                      Dio(),
                    ),
                  ),
                )..fetchFeaturesBooks()),
        BlocProvider(
            create: (context) => NewsetBookDetilesCubit(
                  HomeRepoImpl(
                    apiServices: ApiServices(
                      Dio(),
                    ),
                  ),
                )..fetchNewsetBooks()),
        BlocProvider(
            create: (context) => ScienceBookCubit(
                  ScienceRepoimp(
                    apiServices: ApiServices(
                      Dio(),
                    ),
                  ),
                )..fetchSciencebook()),
        BlocProvider(
            create: (context) => FeatchSportBookCubit(
                  SportRepoImp(
                    apiServices: ApiServices(
                      Dio(),
                    ),
                  ),
                )..fetchSportbooks()),
        BlocProvider(
            create: (context) => FeatchProgramingBooksCubit(
                  ComputerRepoImp(
                    apiServices: ApiServices(
                      Dio(),
                    ),
                  ),
                )..fetchComputerBooks()),
      ],
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<ProfileCubit>(context);
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: Style.themeData(isDark: cubit.darktheme, context: context),
            routerConfig: router,
          );
        },
      ),
    );
  }
}
