import 'package:contact_management_app_mobile/viewmodels/user/user_view_model.dart';
import 'package:flutter/material.dart';
import '../../models/user.dart';
import '../../services/user_service.dart';

enum LoadingStatus { completed, searching, empty }


class UserListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.empty;
  List<UserViewModel> users = <UserViewModel>[];

  void  profileData() async {
    List<User> user = (await UserWebService().profile()) as List<User>;
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    users = user.map((user) => UserViewModel(user: user)).toList();

    if (users.isEmpty) {
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }

    notifyListeners();
  }
}
