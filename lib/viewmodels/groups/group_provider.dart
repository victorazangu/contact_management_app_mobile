import 'package:flutter/material.dart';
import '../../models/group.dart';
import '../../services/group_service.dart';
import 'group_view_model.dart';

enum LoadingStatus { completed, searching, empty }

class GroupListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.empty;
  List<GroupViewModel> groups = <GroupViewModel>[];

  void allGroups() async {
    List<Group> group = await GroupWebService().fetchAllGroups();
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    groups = group.map((group) => GroupViewModel(group: group)).toList();

    if (groups.isEmpty) {
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }

    notifyListeners();
  }
}
