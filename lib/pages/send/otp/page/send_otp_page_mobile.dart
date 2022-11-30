import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nobita/data/const/consts.dart';
import 'package:nobita/generated/l10n.dart';
import 'package:nobita/pages/send/otp/store/send_otp_store.dart';
import 'package:nobita/theme/dimens.dart';
import 'package:nobita/widgets/headers/std_appbar.dart';
import 'package:nobita/widgets/others/show_loading.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SendOTPPageMobile extends StatelessWidget {
  final SendOTPStore store;
  const SendOTPPageMobile({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: key,
        appBar: STDAppBar(context, title: 'OTP', isShowBackButton: true),
        body: Observer(
          builder: (_) => ShowLoading(
            isShowLoading: store.isShowLoading,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).pleaseEnterYourOTP,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Form(
                  key: store.formKey,
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: Dimens.PADDING_X_LARGE,
                          horizontal: 0.15.w(context)),
                      child: PinCodeTextField(
                        backgroundColor: Theme.of(context).backgroundColor,
                        appContext: context,
                        textStyle: Theme.of(context).textTheme.displayMedium,
                        pastedTextStyle:
                            Theme.of(context).textTheme.displayMedium,
                        length: Consts.LENGTH_OTP,
                        blinkWhenObscuring: true,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          activeColor: Theme.of(context).dividerColor,
                          selectedColor: Theme.of(context).dividerColor,
                          selectedFillColor: Theme.of(context).backgroundColor,
                          disabledColor: Theme.of(context).backgroundColor,
                          inactiveColor: Theme.of(context).dividerColor,
                          inactiveFillColor: Theme.of(context).backgroundColor,
                          errorBorderColor: Theme.of(context).errorColor,
                          shape: PinCodeFieldShape.box,
                          borderRadius:
                              BorderRadius.circular(Dimens.RADIUS_SMALL),
                          fieldHeight: Dimens.HEIGTH_FEILD_OTP,
                          fieldWidth: Dimens.WIDTH_FEILD_OTP,
                          activeFillColor: Theme.of(context).backgroundColor,
                        ),
                        cursorColor: Theme.of(context).highlightColor,
                        animationDuration: const Duration(
                            milliseconds: Consts.TIME_ANIMATION_SHORT),
                        enableActiveFill: true,
                        errorAnimationController: store.errorController,
                        controller: store.formController,
                        keyboardType: TextInputType.number,
                        onCompleted: (v) async {
                          await store.onCompleted(context, value: v);
                        },
                        onChanged: (String value) {},
                      )),
                ),
                Observer(builder: (_) {
                  return RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: S.of(context).otpCodeWillExpire,
                      style: Theme.of(context).textTheme.displaySmall,
                      children: <TextSpan>[
                        TextSpan(
                            text: store.convertNumberToString(store.timeExpire),
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold)),
                      ],
                    ),
                  );
                }),
                Observer(builder: (_) {
                  return (store.timeExpire == 0)
                      ? GestureDetector(
                          onTap: () {
                            store.sendStore.sendSms(context);
                            store.startTimer();
                          },
                          child: Text(S.of(context).resent,
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(
                                      color: Theme.of(context).primaryColor)),
                        )
                      : const SizedBox.shrink();
                })
              ],
            ),
          ),
        ));
  }
}
