import 'package:get_storage/get_storage.dart';

class GetStorageCacheHelper {
  static final GetStorage _appBox = GetStorage();

  static Future<void> init() async => await GetStorage.init();

//===============================================================

  static Future<void> cacheTheme({required bool? value}) async {
    await _appBox.write('isDark', value);
  }

  static Future<bool?> get getTheme async {
    bool? isDark;
    if (_appBox.hasData('isDark')) {
      isDark = _appBox.read('isDark');
    }
    return isDark;
  }

//===============================================================

  static Future<void> cacheSound({required bool? value}) async {
    await _appBox.write('isSoundOn', value);
  }

  static Future<bool?> get getSound async {
    bool? isSoundOn;
    if (_appBox.hasData('isSoundOn')) {
      isSoundOn = _appBox.read('isSoundOn');
    }
    return isSoundOn;
  }

//===============================================================

  static Future<void> cacheOnBoarding({required bool? value}) async {
    await _appBox.write('isFirstTime', value);
  }

  static Future<bool?> get getOnBoarding async {
    bool? isFirstTime;
    if (_appBox.hasData('isFirstTime')) {
      isFirstTime = _appBox.read('isFirstTime');
    }
    return isFirstTime;
  }

//===============================================================
  static Future<void> write(
      {required String key, required dynamic value}) async {
    return await _appBox.write(key, value);
  }

  static dynamic read({required String key}) {
    return _appBox.read(key);
  }

  static bool hasData({required String key}) {
    return _appBox.hasData(key);
  }

  //===============================================================

  static Future<void> cacheUid({
    required String uid,
  }) async {
    await _cacheUid(uid);
  }

  static Future<void> _cacheUid(String uid) async =>
      await _appBox.write('uid', uid);

  static String? get getUid => _appBox.read('uid');

  //===============================================================
//   static Future<void> cacheUserModel({
//     required UserModel userModel,
//   }) async {
//     await _cacheUserModel(userModel);
//   }
//
//   static Future<void> _cacheUserModel(UserModel userModel) async =>
//       await _appBox.write('userModel', userModel);
//
//   static UserModel? get getUserModel => _appBox.read('UserModel');
//
// //===============================================================
//   static Future<void> cacheProductData({
//     required List<CategoryModel> data,
//   }) async {
//     await _cacheProductData(data);
//   }
//
//   static Future<void> _cacheProductData(List<CategoryModel> data) async =>
//       await _appBox.write('data', data);
//
//   static List<CategoryModel>? get getProductData => _appBox.read('data');
//===============================================================
}
