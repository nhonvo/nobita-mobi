import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:nobita/generated/l10n.dart';

void confirmDialog(BuildContext context,
    {String? img,
    IconData icon = Icons.remove_circle_outline_rounded,
    required String title,
    String? textConfirm,
    required Function onConfirm,
    String hightLight = '',
    Color? colorTextHightLight}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)), //this right here
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                if (img != null)
                  Image.asset(img)
                else
                  Icon(icon, size: 96, color: Theme.of(context).errorColor),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: title,
                    style: Theme.of(context).textTheme.displayMedium,
                    children: <TextSpan>[
                      TextSpan(
                          text: hightLight,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                  color: colorTextHightLight ??
                                      Theme.of(context).errorColor)),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                        onTap: () => BaseNavigation.pop(context),
                        child: Text(S.of(context).cancel,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                    color: Theme.of(context).highlightColor))),
                    GestureDetector(
                      onTap: () async {
                        await onConfirm.call();
                      },
                      child: Text(textConfirm ?? S.of(context).confirm,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(
                                  color: Theme.of(context).primaryColor)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      });
}
