import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:nobita/data/const/consts.dart';
import 'package:nobita/data/models/history_transfer.dart';
import 'package:nobita/generated/l10n.dart';
import 'package:nobita/theme/colors.dart';
import 'package:nobita/theme/dimens.dart';
import 'package:nobita/theme/images.dart';

class ItemHistoryTransfer extends StatelessWidget {
  final HistoryTransfer item;
  final String myId;
  const ItemHistoryTransfer(
      {super.key, required this.item, required this.myId});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: Dimens.SCREEN_PADDING, vertical: Dimens.PADDING_X_SMALL),
      padding: const EdgeInsets.all(Dimens.SCREEN_PADDING),
      decoration: BoxDecoration(
        color: Theme.of(context).highlightColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(Dimens.PADDING_MEDIUM),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  myId == item.receiverId
                      ? S.of(context).receive +
                          ' ' +
                          S.of(context).from +
                          ' ' +
                          (item.senderName ?? '')
                      : S.of(context).send +
                          ' ' +
                          S.of(context).to +
                          ' ' +
                          (item.receiverName ?? ''),
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: myId == item.receiverId
                          ? AppColors.green_2
                          : Theme.of(context).primaryColor),
                ),
              ),
              BaseSVG(
                  path: myId == item.receiverId
                      ? Images.iconReceiveMoney
                      : Images.iconSendMoney,
                  color: myId == item.receiverId
                      ? AppColors.green_2
                      : Theme.of(context).primaryColor)
            ],
          ),
          const SizedBox(height: Dimens.PADDING_LARGE),
          Row(
            children: [
              Text(
                S.of(context).amount,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(width: Dimens.PADDING_MEDIUM),
              Expanded(
                child: Text(
                  item.amount.toString() + ' ' + Consts.CUREENTCY,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ],
          ),
          _buildSeparator(context),
          Text(
            S.of(context).description,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(height: Dimens.PADDING_SMALL),
          Text(
            item.description.toString(),
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(height: Dimens.PADDING_MEDIUM),
          Text(
            convertTime(DateTime.parse(item.createdDate.toString())).toString(),
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: Theme.of(context).highlightColor.withOpacity(0.5)),
          ),
        ],
      ),
    );
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

  String convertTime(DateTime d) {
    return d.day.toString() +
        '/' +
        d.month.toString() +
        '/' +
        d.year.toString();
  }
}

class LinePainter extends CustomPainter {
  final BuildContext context;

  LinePainter(this.context);
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 10, dashSpace = 10, startX = 0;
    final paint = Paint()
      ..color = Theme.of(context).backgroundColor
      ..strokeWidth = 1;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
