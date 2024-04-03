import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.buttonStyle,
    this.textStyle,
    this.disabled = false,
  });
  final String text;
  final VoidCallback? onPressed;
  final ButtonStyle? buttonStyle;
  final TextStyle? textStyle;
  final bool disabled;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return FilledButton(
      onPressed: widget.disabled ? null : widget.onPressed,
      style: widget.disabled
          ? FilledButton.styleFrom(
              backgroundColor: primaryBlackColor.withOpacity(.8),
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 28.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            )
          : widget.buttonStyle ??
              FilledButton.styleFrom(
                backgroundColor: primaryGreenColor,
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 28.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
      child: Text(
        widget.text,
        style: widget.textStyle ?? theme.textTheme.titleSmall,
      ),
    );
  }
}
