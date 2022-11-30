import 'package:coder0211/coder0211.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nobita/data/const/consts.dart';
import 'package:nobita/data/models/user.dart';
import 'package:nobita/generated/l10n.dart';
import 'package:nobita/pages/send/store/send_store.dart';
import 'package:nobita/theme/dimens.dart';
import 'package:nobita/utils/helper.dart';
import 'package:nobita/widgets/dialogs/confirm_dialog.dart';
import 'package:nobita/widgets/headers/std_appbar.dart';
import 'package:nobita/widgets/inputs/custom_text_field.dart';
import 'package:nobita/widgets/others/item_contact.dart';

class SendPageMobile extends StatelessWidget {
  final SendStore store;
  const SendPageMobile({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          STDAppBar(context, title: S.of(context).send, isShowBackButton: true),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(height: 0.1.w(context)),
            Observer(
                builder: (_) => store.contacts.length > 0
                    ? Padding(
                        padding: const EdgeInsets.only(
                            bottom: Dimens.PADDING_MEDIUM),
                        child: SizedBox(
                            height: 85,
                            child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                      onTap: () {
                                        _onTapContact(context,
                                            contact: store.contacts[index]);
                                      },
                                      child: ItemContact(
                                        user: store.contacts[index],
                                        onPressedDelete: () {
                                          confirmDialog(context,
                                              textConfirm: S.of(context).delete,
                                              icon: Icons.logout,
                                              hightLight: ' ' +
                                                  S.of(context).delete +
                                                  ' ' +
                                                  (store.contacts[index]
                                                          .fullName ??
                                                      '') +
                                                  '?',
                                              title:
                                                  S.of(context).confirmAreYou,
                                              onConfirm: () async {
                                            BaseNavigation.pop(context);
                                            store.deleteContact(context,
                                                accountNumber: store
                                                        .contacts[index]
                                                        .accountNo ??
                                                    '');
                                          });
                                        },
                                      ));
                                },
                                itemCount: store.contacts.length)),
                      )
                    : const SizedBox.shrink()),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: Dimens.SCREEN_PADDING),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: Dimens.PADDING_MEDIUM),
                  CustomTextField(
                      bgColor: Theme.of(context).backgroundColor,
                      cusorColor: Theme.of(context).highlightColor,
                      isEditMode: true,
                      autofocus: true,
                      style: Theme.of(context).textTheme.displaySmall,
                      borderColor:
                          Theme.of(context).dividerColor.withOpacity(0.2),
                      title: S.of(context).accountNumber,
                      textEditingController: store.accountNumberController,
                      onChanged: (value) {
                        store.getInfoById(context);
                      }),
                  const SizedBox(height: Dimens.PADDING_MEDIUM),
                  CustomTextField(
                      bgColor: Theme.of(context).dividerColor.withOpacity(0.1),
                      cusorColor: Theme.of(context).highlightColor,
                      isEditMode: false,
                      style: Theme.of(context).textTheme.displaySmall,
                      borderColor:
                          Theme.of(context).dividerColor.withOpacity(0.2),
                      title: S.of(context).fullname,
                      keyboardType: TextInputType.number,
                      textEditingController: store.fullNameController),
                  const SizedBox(height: Dimens.PADDING_MEDIUM),
                  CustomTextField(
                      bgColor: Theme.of(context).dividerColor.withOpacity(0.1),
                      cusorColor: Theme.of(context).highlightColor,
                      isEditMode: false,
                      style: Theme.of(context).textTheme.displaySmall,
                      borderColor:
                          Theme.of(context).dividerColor.withOpacity(0.2),
                      title: S.of(context).email,
                      keyboardType: TextInputType.number,
                      textEditingController: store.emailController),
                  const SizedBox(height: Dimens.PADDING_MEDIUM),
                  CustomTextField(
                    bgColor: Theme.of(context).backgroundColor,
                    cusorColor: Theme.of(context).highlightColor,
                    isEditMode: true,
                    style: Theme.of(context).textTheme.displaySmall,
                    borderColor:
                        Theme.of(context).dividerColor.withOpacity(0.2),
                    title: S.of(context).amount + ' (${Consts.CUREENTCY})',
                    keyboardType: TextInputType.number,
                    textEditingController: store.amountController,
                    onChanged: (v) {
                      store.amount = int.tryParse(v.text.toString()) ?? 0;
                      store.isValid(context);
                    },
                  ),
                  const SizedBox(height: Dimens.PADDING_SMALL),
                  Observer(
                      builder: (_) => (store.amount != 0)
                          ? Text(
                              Helper.callNumber(context,
                                  number: int.parse(store.amount.toString())),
                              style: Theme.of(context).textTheme.displaySmall)
                          : const SizedBox.shrink()),
                  const SizedBox(height: Dimens.PADDING_MEDIUM),
                  CustomTextField(
                      bgColor: Theme.of(context).backgroundColor,
                      cusorColor: Theme.of(context).highlightColor,
                      isEditMode: true,
                      style: Theme.of(context).textTheme.displaySmall,
                      borderColor:
                          Theme.of(context).dividerColor.withOpacity(0.2),
                      maxLines: 5,
                      title: S.of(context).description,
                      textEditingController: store.descriptionController,
                      onChanged: (v) {
                        store.isValid(context);
                      }),
                  const SizedBox(height: Dimens.PADDING_MEDIUM),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(S.of(context).saveRecipient,
                          style: Theme.of(context).textTheme.displaySmall),
                      Observer(builder: (_) {
                        return CupertinoSwitch(
                          activeColor: Theme.of(context).primaryColor,
                          value: store.isSaveRecipient,
                          onChanged: (value) {
                            store.isSaveRecipient = value;
                          },
                        );
                      }),
                    ],
                  ),
                  const SizedBox(height: Dimens.PADDING_XX_LARGE),
                  Observer(builder: (_) {
                    return BaseButton(
                        bgColor: store.isEnable
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).disabledColor,
                        onPressed: () {
                          store.onPressedNext(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(S.of(context).continueT,
                                style: Theme.of(context).textTheme.labelLarge)
                          ],
                        ));
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTapContact(BuildContext context, {required User contact}) {
    store.accountNumberController.text = contact.accountNo ?? '';
    store.getInfoById(context);
  }
}
