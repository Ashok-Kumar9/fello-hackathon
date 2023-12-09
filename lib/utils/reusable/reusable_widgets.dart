import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ReusableWidgets {
  static GestureDetector selectionContainer({
    required BuildContext context,
    required String title,
    required String iconAssetName,
    Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: const Border(
            bottom: BorderSide(width: 3, color: Color(0xFF518BFF)),
            top: BorderSide(width: 1, color: Color(0xFF518BFF)),
            left: BorderSide(width: 1, color: Color(0xFF518BFF)),
            right: BorderSide(width: 1, color: Color(0xFF518BFF)),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(iconAssetName),
            const SizedBox(width: 8),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: const Color(0xFF0040C1), fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  RichText richText({
    required BuildContext context,
    required String title,
    required String value,
  }) {
    return RichText(
      text: TextSpan(
        text: title,
        style:  Theme.of(context).textTheme.bodySmall,
        children: [
          TextSpan(
            text: value,
            style:  Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w600,
            )
          ),
        ],
      ),
    );



  }



}
