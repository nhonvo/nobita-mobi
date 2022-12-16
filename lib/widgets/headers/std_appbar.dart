import 'package:flutter/material.dart';

PreferredSizeWidget STDAppBar(BuildContext context,
    {required String title,
    bool isShowBackButton = false,
    List<Widget>? actions}) {
  return AppBar(
    title: Text(title,
        style: Theme.of(context)
            .textTheme
            .labelLarge
            ?.copyWith(color: Theme.of(context).primaryColorLight)),
    centerTitle: true,
    backgroundColor: Theme.of(context).primaryColor,
    automaticallyImplyLeading: isShowBackButton,
    actions: actions,
  );
}
