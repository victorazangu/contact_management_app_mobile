import '../../models/user.dart';

class UserViewModel {
  final User _user;

  UserViewModel({required User user}) : _user = user;

  int get id {
    return _user.id;
  }

  String get name {
    return _user.name;
  }

  String get email {
    return _user.email;
  }

  String get profile {
    return _user.profile;
  }

  String get phone {
    return _user.phone;
  }

  String get created_at {
    return _user.created_at;
  }
}
