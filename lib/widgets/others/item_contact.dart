import 'package:flutter/material.dart';
import 'package:nobita/data/models/user.dart';
import 'package:nobita/theme/colors.dart';
import 'package:nobita/theme/dimens.dart';

class ItemContact extends StatelessWidget {
  final User user;
  final VoidCallback onPressedDelete;
  const ItemContact(
      {super.key, required this.user, required this.onPressedDelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: Dimens.SCREEN_PADDING),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(Dimens.PADDING_LARGE),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).dividerColor.withOpacity(0.2)),
                child: Center(
                    child: Text(
                  user.fullName?.substring(0, 2).toUpperCase() ?? '',
                  style: Theme.of(context).textTheme.displaySmall,
                )),
              ),
              const SizedBox(height: Dimens.PADDING_X_SMALL),
              SizedBox(
                  width: 80,
                  child: Text(
                    user.fullName ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.center,
                  ))
            ],
          ),
          GestureDetector(
            onTap: onPressedDelete,
            child: Transform.translate(
                offset: const Offset(-Dimens.PADDING_X_SMALL, 0),
                child: const Icon(Icons.remove_circle_rounded,
                    color: AppColors.red)),
          )
        ],
      ),
    );
  }
}
