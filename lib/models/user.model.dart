class User {
  final String? _loginName;
  final String? _userType;
  final String? _imageUrl;
  const User(this._loginName,this._userType,this._imageUrl);
  String? get loginName {
    return _loginName;
  }
  String? get userType {
    return _userType;
  }
  String? get imageUrl {
    return _imageUrl;
  }
}