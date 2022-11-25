import 'package:flutter/material.dart';
import 'package:nobita/generated/l10n.dart';
import 'package:nobita/theme/dimens.dart';

class ItemHistoryTransfer extends StatelessWidget {
  const ItemHistoryTransfer({super.key});
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
          Text(
            S.of(context).receive,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(
            height: Dimens.PADDING_SMALL,
          ),
          const Text(
            '100.0\$',
          ),
          _buildSeparator(context),
          const Text('May 21 2021'),
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
