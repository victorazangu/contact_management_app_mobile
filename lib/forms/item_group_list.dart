import 'package:contact_management_app_mobile/viewmodels/groups/group_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/groups/group_provider.dart';

class GroupList extends StatefulWidget {
  const GroupList({super.key});

  @override
  State<GroupList> createState() => _GroupListState();
}

class _GroupListState extends State<GroupList> {
  @override
  void initState() {
    super.initState();
    var list =
        Provider.of<GroupListViewModel>(context, listen: false).allGroups();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);
    var list = Provider.of<GroupListViewModel>(context);

    var _items = list.groups;

    return ReorderableListView(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      children: <Widget>[
        for (int index = 0; index < _items.length; index += 1)
          ListTile(
            key: Key('$index'),
            tileColor: _items[index] != null ? oddItemColor : evenItemColor,
            title: Text('Item ${_items[index].name}'),
          ),
      ],
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final int item = _items.removeAt(oldIndex) as int;
          _items.insert(newIndex, item as GroupViewModel);
        });
      },
    );
  }
}
