import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nobita/generated/l10n.dart';
import 'package:nobita/pages/lixi/create/store/lixi_create_store.dart';
import 'package:nobita/theme/dimens.dart';
import 'package:nobita/widgets/headers/std_appbar.dart';
import 'package:nobita/widgets/inputs/custom_text_field.dart';

class LixiCreatePageMobile extends StatelessWidget {
  final LixiCreateStore store;
  const LixiCreatePageMobile({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: STDAppBar(context,
            title: S.of(context).lixiCreate, isShowBackButton: true),
        body: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: Dimens.SCREEN_PADDING),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                bgColor: Theme.of(context).backgroundColor,
                cusorColor: Theme.of(context).highlightColor,
                isEditMode: true,
                style: Theme.of(context).textTheme.displaySmall,
                hintText: S.of(context).amount,
                borderColor: Theme.of(context).dividerColor.withOpacity(0.2),
                title: S.of(context).amount,
                textEditingController: store.amountController,
                keyboardType: TextInputType.number,
                onChanged: (v) {
                  store.isValid(context);
                },
              ),
              const SizedBox(height: Dimens.SCREEN_PADDING),
              Observer(
                builder: (_) => BaseButton(
                    bgColor: store.isEnable
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).disabledColor,
                    onPressed: () async {
                      if (store.isEnable) _createRoom(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(S.of(context).create,
                            style: Theme.of(context).textTheme.labelLarge)
                      ],
                    )),
              )
            ],
          ),
        ));
  }

  Future<void> _createRoom(BuildContext context) async {
    await store.createRoom(context);
  }
}
