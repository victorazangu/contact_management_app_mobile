import 'package:contact_management_app_mobile/models/group.dart';
import 'package:flutter/material.dart';

import '../../services/group_service.dart';
import 'group_view_model.dart';

enum LoadingStatus { completed, searching, empty }

class GroupProvider with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.empty;
  List<GroupViewModel> groups = <GroupViewModel>[];

  void allGroups() async {
    List<Group> groupList = await GroupWebService().fetchAllGroups();
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    this.groups =
        groupList.map((group) => GroupViewModel(group: group)).toList();

    if (this.groups.isEmpty) {
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }
}
