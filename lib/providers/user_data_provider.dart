import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/values.dart';

class UserDataProvider extends ChangeNotifier {
  var _userProfileImageUrl = '';
  var _username = '';
  var _accessToken = '';

  String get userProfileImageUrl => _userProfileImageUrl;

  String get username => _username;

  Future<void> loadAsync() async {
    final sharedPref = await SharedPreferences.getInstance();

    _username = sharedPref.getString(StorageKeys.username) ?? '';
    _userProfileImageUrl = sharedPref.getString(StorageKeys.userProfileImageUrl) ?? '';
    _accessToken = sharedPref.getString(StorageKeys.accessToken) ?? '';

    notifyListeners();
  }

  Future<void> setUserDataAsync({
    String? userProfileImageUrl,
    String? username,
  }) async {
    final sharedPref = await SharedPreferences.getInstance();
    var shouldNotify = false;

    if (userProfileImageUrl != null && userProfileImageUrl != _userProfileImageUrl) {
      _userProfileImageUrl = userProfileImageUrl;

      await sharedPref.setString(StorageKeys.userProfileImageUrl, _userProfileImageUrl);

      shouldNotify = true;
    }

    if (username != null && username != _username) {
      _username = username;

      await sharedPref.setString(StorageKeys.username, _username);

      shouldNotify = true;
    }

    if (shouldNotify) {
      notifyListeners();
    }
  }

  Future<void> clearUserDataAsync() async {
    final sharedPref = await SharedPreferences.getInstance();

    await sharedPref.remove(StorageKeys.username);
    await sharedPref.remove(StorageKeys.userProfileImageUrl);
    await sharedPref.remove(StorageKeys.accessToken);

    _username = '';
    _userProfileImageUrl = '';
    _accessToken = '';

    notifyListeners();
  }

  Future<void> setAccessTokenAsync(String? accessToken) async {
    final sharedPref = await SharedPreferences.getInstance();
    var shouldNotify = false;

    if (accessToken != null && accessToken != _accessToken) {
      _accessToken = accessToken;

      await sharedPref.setString(StorageKeys.accessToken, _accessToken);

      shouldNotify = true;
    }

    if (shouldNotify) {
      notifyListeners();
    }
  }

  bool isUserLoggedIn() {
    return _accessToken.isNotEmpty;
  }
}
