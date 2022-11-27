import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nobita/data/const/consts.dart';
import 'package:nobita/generated/l10n.dart';
import 'package:nobita/pages/send/store/send_store.dart';
import 'package:nobita/theme/dimens.dart';
import 'package:nobita/widgets/headers/std_appbar.dart';
import 'package:nobita/widgets/inputs/custom_text_field.dart';

class SendPageMobile extends StatelessWidget {
  final SendStore store;
  const SendPageMobile({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          STDAppBar(context, title: S.of(context).send, isShowBackButton: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.SCREEN_PADDING),
        child: SafeArea(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(height: 0.1.w(context)),
              CustomTextField(
                  bgColor: Theme.of(context).backgroundColor,
                  cusorColor: Theme.of(context).highlightColor,
                  isEditMode: true,
                  autofocus: true,
                  style: Theme.of(context).textTheme.displaySmall,
                  borderColor: Theme.of(context).dividerColor.withOpacity(0.2),
                  title: S.of(context).accountNumber,
                  textEditingController: store.accountNumberController,
                  onChanged: (value) {
                    store.getInfoById(context);
                  }),
              const SizedBox(height: Dimens.PADDING_MEDIUM),
              CustomTextField(
                  bgColor: Theme.of(context).backgroundColor,
                  cusorColor: Theme.of(context).highlightColor,
                  isEditMode: false,
                  style: Theme.of(context).textTheme.displaySmall,
                  borderColor: Theme.of(context).dividerColor.withOpacity(0.2),
                  title: S.of(context).fullname,
                  keyboardType: TextInputType.number,
                  textEditingController: store.fullNameController),
              const SizedBox(height: Dimens.PADDING_MEDIUM),
              CustomTextField(
                  bgColor: Theme.of(context).backgroundColor,
                  cusorColor: Theme.of(context).highlightColor,
                  isEditMode: false,
                  style: Theme.of(context).textTheme.displaySmall,
                  borderColor: Theme.of(context).dividerColor.withOpacity(0.2),
                  title: S.of(context).email,
                  keyboardType: TextInputType.number,
                  textEditingController: store.emailController),
              const SizedBox(height: Dimens.PADDING_MEDIUM),
              CustomTextField(
                bgColor: Theme.of(context).backgroundColor,
                cusorColor: Theme.of(context).highlightColor,
                isEditMode: true,
                style: Theme.of(context).textTheme.displaySmall,
                borderColor: Theme.of(context).dividerColor.withOpacity(0.2),
                title: S.of(context).amount + ' (${Consts.CUREENTCY})',
                keyboardType: TextInputType.number,
                textEditingController: store.amountController,
                onChanged: (v) {
                  store.isValid(context);
                },
              ),
              const SizedBox(height: Dimens.PADDING_MEDIUM),
              CustomTextField(
                  bgColor: Theme.of(context).backgroundColor,
                  cusorColor: Theme.of(context).highlightColor,
                  isEditMode: true,
                  style: Theme.of(context).textTheme.displaySmall,
                  borderColor: Theme.of(context).dividerColor.withOpacity(0.2),
                  maxLines: 5,
                  title: S.of(context).description,
                  textEditingController: store.descriptionController,
                  onChanged: (v) {
                    store.isValid(context);
                  }),
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
      ),
    );
  }
}
