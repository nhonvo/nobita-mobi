import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nobita/data/const/consts.dart';
import 'package:nobita/generated/l10n.dart';
import 'package:nobita/manager/manager_path_routes.dart';
import 'package:nobita/pages/send/ticket/store/send_ticket_store.dart';
import 'package:nobita/theme/colors.dart';
import 'package:nobita/theme/shadows.dart';
import 'package:nobita/widgets/others/item_history_transfer.dart';
import 'package:nobita/widgets/others/show_loading.dart';
import 'package:intl/intl.dart' as intl;
import '../../../../theme/dimens.dart';

class SendTicketPageMobile extends StatelessWidget {
  final SendTicketStore store;
  const SendTicketPageMobile({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Observer(
            builder: (_) => ShowLoading(
                isShowLoading: store.isShowLoading,
                child: ListView(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      SizedBox(
                        height: 0.3.w(context),
                      ),
                      Container(
                        margin: const EdgeInsets.all(Dimens.SCREEN_PADDING),
                        padding: const EdgeInsets.all(Dimens.SCREEN_PADDING),
                        width: 1.0.w(context),
                        decoration: BoxDecoration(
                          color: Theme.of(context).backgroundColor,
                          borderRadius:
                              BorderRadius.circular(Dimens.RADIUS_MEDIUM),
                          boxShadow: Shadows.shadow3(context),
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              AppColors.primary,
                              AppColors.red,
                            ],
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Observer(builder: (_) {
                                return Text(
                                    store.sendStore.isSended
                                        ? S.of(context).sended
                                        : (store.sendStore.isResult)
                                            ? S.of(context).sendFailed
                                            : S.of(context).infoReceiver,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge
                                        ?.copyWith(color: AppColors.white));
                              }),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: Dimens.PADDING_MEDIUM),
                              child: CustomPaint(
                                painter: LinePainter(context),
                                child: Container(),
                              ),
                            ),
                            Text(S.of(context).accountNumber,
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(color: AppColors.white)),
                            const SizedBox(
                              height: Dimens.PADDING_SMALL,
                            ),
                            Text(store.sendStore.accountNumberController.text,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(color: AppColors.white)),
                            const SizedBox(
                              height: Dimens.PADDING_LARGE,
                            ),
                            Text(S.of(context).fullname,
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(color: AppColors.white)),
                            const SizedBox(
                              height: Dimens.PADDING_SMALL,
                            ),
                            Text(store.sendStore.fullNameController.text,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(color: AppColors.white)),
                            const SizedBox(
                              height: Dimens.PADDING_LARGE,
                            ),
                            Text(S.of(context).email,
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(color: AppColors.white)),
                            const SizedBox(
                              height: Dimens.PADDING_SMALL,
                            ),
                            Text(store.sendStore.emailController.text,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(color: AppColors.white)),
                            const SizedBox(
                              height: Dimens.PADDING_LARGE,
                            ),
                            Text(S.of(context).description,
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(color: AppColors.white)),
                            const SizedBox(
                              height: Dimens.PADDING_SMALL,
                            ),
                            Text(store.sendStore.descriptionController.text,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(color: AppColors.white)),
                            _buildSeparator(context),
                            Text(S.of(context).amount,
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(color: AppColors.white)),
                            const SizedBox(
                              height: Dimens.PADDING_SMALL,
                            ),
                            Text(
                                intl.NumberFormat.decimalPattern().format(
                                        int.parse(store
                                            .sendStore.amountController.text)) +
                                    ' ' +
                                    Consts.CUREENTCY,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge
                                    ?.copyWith(color: AppColors.white)),
                          ],
                        ),
                      ),
                      Observer(builder: (_) {
                        return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              BaseButton(
                                  bgColor: Theme.of(context).disabledColor,
                                  onPressed: () {
                                    _onPressedCancel.call(context);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          store.sendStore.isResult
                                              ? S.of(context).close
                                              : S.of(context).cancel,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge)
                                    ],
                                  )),
                              if (!store.sendStore.isResult)
                                BaseButton(
                                    bgColor: Theme.of(context).primaryColor,
                                    onPressed: () {
                                      _onPressedSend.call(context);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(S.of(context).send,
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge)
                                      ],
                                    )),
                            ]);
                      })
                    ]))));
  }

  Widget _buildSeparator(BuildContext context) {
    return Stack(
      children: [
        _buildCircleSeparator(-Dimens.PADDING_X_LARGE, context),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: Dimens.PADDING_MEDIUM),
          child: CustomPaint(
            painter: LinePainter(context),
            child: Container(),
          ),
        ),
        Align(
            alignment: Alignment.centerRight,
            child: _buildCircleSeparator(Dimens.PADDING_X_LARGE, context))
      ],
    );
  }

  Widget _buildCircleSeparator(double condinateX, BuildContext context) {
    return Transform.translate(
      offset: Offset(condinateX, 0),
      child: Container(
        height: Dimens.ICON_X_SMALL,
        width: Dimens.ICON_X_SMALL,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).backgroundColor,
        ),
      ),
    );
  }

  void _onPressedCancel(BuildContext context) {
    if (store.sendStore.isResult) {
      BaseNavigation.push(context,
          routeName: ManagerRoutes.home, clearStack: true);
    } else {
      BaseNavigation.pop(context);
    }
  }

  void _onPressedSend(BuildContext context) async {
    store.isShowLoading = true;
    store.sendStore.sendSms(context);
    BaseNavigation.push(context, routeName: ManagerRoutes.sendOTP);
    store.isShowLoading = false;
  }
}
