import 'package:book_app/core/utils/ApiServices.dart';
import 'package:book_app/features/Computer/data/Repo/ComputerRepoImp.dart';
import 'package:book_app/features/Science/data/Repo/ScienceRepo.dart';
import 'package:book_app/features/Science/data/Repo/ScienceRepoimp.dart';
import 'package:book_app/features/Sports/data/Repo/SportRepoImpl.dart';
import 'package:book_app/features/home/data/Repo/HomeRepImp.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void getset() {
  getIt.registerSingleton<ApiServices>(ApiServices(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      apiServices: getIt.get<ApiServices>(),
    ),
  );
  getIt.registerSingleton<ScienceRepoimp>(
    ScienceRepoimp(
      apiServices: ApiServices(
        Dio(),
      ),
    ),
  );
  getIt.registerSingleton<ComputerRepoImp>(
    ComputerRepoImp(
      apiServices: ApiServices(
        Dio(),
      ),
    ),
  );
  getIt.registerSingleton<SportRepoImp>(
    SportRepoImp(
      apiServices: ApiServices(
        Dio(),
      ),
    ),
  );
}
