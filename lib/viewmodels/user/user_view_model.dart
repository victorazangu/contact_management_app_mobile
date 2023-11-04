import 'package:flutter/material.dart';

import '../../models/profile.dart';

class UserProfileViewModel {
  final UserProfile _userProfile;

  UserProfileViewModel({required UserProfile userProfile})
      : _userProfile = userProfile;

  int get id {
    return _userProfile.id;
  }

  String get name {
    return _userProfile.name;
  }

  String get email {
    return _userProfile.email;
  }

  String get phone {
    return _userProfile.phone;
  }

  String get profile {
    return _userProfile.profile;
  }

  String get createdAt {
    return _userProfile.createdAt;
  }

  String get updatedAt {
    return _userProfile.updatedAt;
  }
}
