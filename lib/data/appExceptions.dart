class AppExceptions implements Exception {
  String? _prefix;
  String? _message;
  AppExceptions([this._prefix, this._message]);
}
