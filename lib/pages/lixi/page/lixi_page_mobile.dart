import 'package:cached_network_image/cached_network_image.dart';
import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nobita/data/const/consts.dart';
import 'package:nobita/generated/l10n.dart';
import 'package:nobita/manager/manager_path_routes.dart';
import 'package:nobita/pages/lixi/store/lixi_store.dart';
import 'package:nobita/theme/dimens.dart';
import 'package:nobita/widgets/headers/std_appbar.dart';
import 'package:nobita/widgets/inputs/custom_text_field.dart';

class LixiPageMobile extends StatelessWidget {
  final LixiStore store;
  const LixiPageMobile({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: STDAppBar(context,
          title: S.of(context).lixi,
          isShowBackButton: true,
          actions: [
            GestureDetector(
              onTap: () {
                BaseNavigation.push(context,
                    routeName: ManagerRoutes.lixiCreate);
              },
              child: Padding(
                padding: const EdgeInsets.only(right: Dimens.PADDING_MEDIUM),
                child: Icon(Icons.add,
                    color: Theme.of(context).primaryColorLight,
                    size: Dimens.ICON_LARGE),
              ),
            )
          ]),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(height: 0.25.w(context)),
          CachedNetworkImage(
            height: 0.5.w(context),
            imageUrl: Consts.URL_IMAGE_LIXI,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: imageProvider, fit: BoxFit.contain)),
            ),
            placeholder: (context, url) => const BaseIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          const SizedBox(height: Dimens.PADDING_LARGE),
          Align(
              alignment: Alignment.center,
              child: Text(S.of(context).join,
                  style: Theme.of(context).textTheme.headlineMedium)),
          const SizedBox(height: Dimens.PADDING_MEDIUM),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: Dimens.SCREEN_PADDING),
            child: CustomTextField(
              bgColor: Theme.of(context).backgroundColor,
              cusorColor: Theme.of(context).highlightColor,
              isEditMode: true,
              style: Theme.of(context).textTheme.displaySmall,
              hintText: S.of(context).accountNumber,
              borderColor: Theme.of(context).dividerColor.withOpacity(0.2),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              textEditingController: store.accountNumberController,
              onChanged: (v) {
                store.validation();
              },
            ),
          ),
          const SizedBox(height: Dimens.PADDING_MEDIUM),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: Dimens.SCREEN_PADDING),
            child: Observer(builder: (_) {
              return BaseButton(
                  bgColor: store.isEnable
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).disabledColor,
                  onPressed: () async {
                    await _onPressedJoin(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(S.of(context).join,
                          style: Theme.of(context).textTheme.labelLarge)
                    ],
                  ));
            }),
          )
        ],
      ),
    );
  }

  Future<void> _onPressedJoin(BuildContext context) async {
    if (store.isEnable) await store.joinRoom(context);
  }
}
