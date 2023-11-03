import '../../models/group.dart';
import '../../models/user.dart';

class GroupViewModel {
  final Group _group;

  GroupViewModel({required Group group}) : _group = group;

  int get id {
    return _group.id;
  }

  String get name {
    return _group.name;
  }

  int get user_id {
    return _group.user_id;
  }

  String get created_at {
    return _group.created_at;
  }

  List<dynamic>? get contacts {
    return _group.contacts;
  }

  User? get user {
    return _group.user;
  }
}
