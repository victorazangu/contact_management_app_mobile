// import 'package:contact_management_app_mobile/viewmodels/user/user_view_model.dart';
// import 'package:flutter/material.dart';

// import '../../models/profile.dart';
// import '../../services/user_service.dart';

// enum LoadingStatus { completed, searching, empty }

// class UserListViewModel with ChangeNotifier {
//   LoadingStatus loadingStatus = LoadingStatus.empty;
//   late UserProfileViewModel profile;
//   Future<void> profileData() async {
//     loadingStatus = LoadingStatus.searching;
//     notifyListeners();

//     try {
//       final response = await UserWebService().profile();
//       final userData = response['data'] as Map<String, dynamic>;
//       profile =
//           UserProfileViewModel(userProfile: UserProfile.fromJson(userData));
//       loadingStatus = LoadingStatus.completed;
//     } catch (error) {
//       print('Error fetching profile data: $error');
//       loadingStatus = LoadingStatus.empty;
//     }

//     notifyListeners();
//   }
// }
import 'package:contact_management_app_mobile/viewmodels/user/user_view_model.dart';
import 'package:flutter/material.dart';

import '../../models/profile.dart';
import '../../services/user_service.dart';

enum LoadingStatus { completed, searching, empty }

class UserListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.empty;
  UserProfileViewModel profile = UserProfileViewModel(
    userProfile: UserProfile(
      createdAt: "",
      updatedAt: "",
      id: 0,
      email: '',
      name: '',
      phone: '',
      profile: '',
    ),
  );

  Future<void> profileData() async {
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    try {
      final response = await UserWebService().profile();
      final userData = response['data'] as Map<String, dynamic>;

      print("User data provider $userData");
      profile =
          UserProfileViewModel(userProfile: UserProfile.fromJson(userData));
      loadingStatus = LoadingStatus.completed;
    } catch (error) {
      print('Error fetching profile data: $error');
      loadingStatus = LoadingStatus.empty;
    }

    notifyListeners();
  }
}
