import 'package:get_storage/get_storage.dart';

class GlobalStorage {
  final GetStorage _box;
  const GlobalStorage(
    this._box,
  );

  final String _tokenKey = 'accessToken';

  /// Save Token
  void saveImage({required String accessToken}) {
    if (accessToken.isEmpty) {
      throw 'Access Token is empty';
    }
    _box.write(_tokenKey, accessToken);
  }

  String getToken() {
    String? token = _box.read(_tokenKey);
    return token ?? '';
  }

  void removeToken() {
    print("removedtoken");

    _box.remove(_tokenKey);
  }


}
