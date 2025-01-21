import 'package:flutter/material.dart';

typedef ButtonStyleFromFunction = ButtonStyle Function({
  Color? foregroundColor,
  Color? backgroundColor,
  Color? disabledForegroundColor,
  Color? disabledBackgroundColor,
  Color? shadowColor,
  Color? surfaceTintColor,
  Color? iconColor,
  Color? disabledIconColor,
  Color? overlayColor,
  double? elevation,
  TextStyle? textStyle,
  EdgeInsetsGeometry? padding,
  Size? minimumSize,
  Size? fixedSize,
  Size? maximumSize,
  BorderSide? side,
  OutlinedBorder? shape,
  MouseCursor? enabledMouseCursor,
  MouseCursor? disabledMouseCursor,
  VisualDensity? visualDensity,
  MaterialTapTargetSize? tapTargetSize,
  Duration? animationDuration,
  bool? enableFeedback,
  AlignmentGeometry? alignment,
  InteractiveInkFeatureFactory? splashFactory,
  ButtonLayerBuilder? backgroundBuilder,
  ButtonLayerBuilder? foregroundBuilder,
});

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
    super.key,
    required this.onPressed,
    this.label,
    this.child,
    this.width,
    this.height,
    this.style,
  });

  final String? label;
  final Widget? child;
  final void Function() onPressed;
  final double? width;
  final double? height;
  final ButtonStyle? style;

  static ButtonStyleFromFunction styleFrom = FilledButton.styleFrom;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle defaultButtonStyle = CustomFilledButton.styleFrom();

    return SizedBox(
      width: width,
      height: height,
      child: FilledButton(
        style: style ?? defaultButtonStyle,
        onPressed: onPressed,
        child: child ??
            (label != null
                ? Center(
                    child: Text(label!),
                  )
                : const Placeholder()),
      ),
    );
  }
}