import 'package:flutter/material.dart';

/// createdby Rafli Athallah
/// 01/01/23
class CommonRoundedButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String? text;
  final double width;
  final TextStyle? textStyle;
  final bool loading;
  final EdgeInsetsGeometry? padding;
  final Color? color, textColor, loadingColor;
  final double? radius;

  const CommonRoundedButton({
    Key? key,
    required this.onPressed,
    this.text,
    this.padding,
    this.color,
    this.textColor,
    this.loadingColor,
    this.radius,
    this.width = double.maxFinite,
    this.textStyle,
    this.loading = false,
  }) : super(key: key);

  @override
  State<CommonRoundedButton> createState() => _CommonRoundedButtonState();
}

class _CommonRoundedButtonState extends State<CommonRoundedButton>
    with SingleTickerProviderStateMixin {
  bool _onTapped = false;

  Widget button(BuildContext context) {
    final themeData = Theme.of(context).textTheme;
    final themeColor = Theme.of(context).brightness;
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(5),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(widget.radius ?? 30.0))),
        backgroundColor: MaterialStateProperty.all(widget.color ??
            Theme.of(context).buttonTheme.colorScheme?.background),
        padding: MaterialStateProperty.all(
            widget.padding ?? const EdgeInsets.all(11.0)),
      ),
      child: Container(
        width: widget.width,
        padding: const EdgeInsets.symmetric(vertical: 3.0),
        child: Center(
          child: Text(
            widget.text ?? "",
            style: widget.textStyle ??
                themeData.bodyMedium!.copyWith(
                    color: widget.textColor ??
                        Theme.of(context)
                            .buttonTheme
                            .colorScheme
                            ?.onBackground),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      onPressed: () async {
        if (_onTapped) return;
        _onTapped = true;
        await Future.delayed(const Duration(milliseconds: 200));
        _onTapped = false;
        widget.onPressed();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: widget.loading
                ? (widget.color ??
                    Theme.of(context).buttonTheme.colorScheme?.onPrimary)
                : Colors.transparent,
            borderRadius: BorderRadius.circular((widget.radius ?? 15.0) + 10)),
        child: AnimatedSize(
          // vsync: this,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeIn,
          child: widget.loading
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      width: 30,
                      height: 30,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color?>(
                            widget.loadingColor ??
                                Theme.of(context)
                                    .buttonTheme
                                    .colorScheme
                                    ?.onPrimary),
                      )),
                )
              : button(context),
        ),
      ),
    );
  }
}
