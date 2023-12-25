import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  bool darktheme = false;
  static const themData = 'ThemData';
  bool get isDark => darktheme;

  setThem(bool value) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    shared.setBool(themData, value);
    darktheme = value;
    emit(ProfileChangeModeSucess());
  }

  Future<bool> getTheme() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    darktheme = shared.getBool(themData) ?? false;
    emit(ProfileChangeModeSucess());
    return darktheme;
  }
}
