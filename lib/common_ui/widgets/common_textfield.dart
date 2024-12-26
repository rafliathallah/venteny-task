import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/utils/value_extension.dart';
import '../../core/utils/typedef_util.dart';
import '../common_colors.dart';
import '../common_typography.dart';


class CommonTextField extends StatefulWidget {
  final String? label;
  final TextStyle? labelStyle;
  final double? formHeight;
  final String hint;
  final TextEditingController? controller;
  final EdgeInsets padding;
  final TextInputAction inputAction;
  final TextInputType inputType;
  final bool isObscureText;
  final List<TextInputFormatter>? inputFormatters;
  final BooleanCallback? onSuffixClick;
  final List<CommonTextFieldValidator> validators;
  final String defaultValue;
  final bool isEnable;
  final bool expands;
  final Color? disabledFillColor;
  final TextAlignVertical? textAlignVertical;

  const CommonTextField({
    Key? key,
    this.label,
    this.labelStyle,
    required this.hint,
    this.controller,
    this.padding = EdgeInsets.zero,
    this.inputAction = TextInputAction.done,
    this.inputType = TextInputType.text,
    this.isObscureText = false,
    this.inputFormatters,
    this.onSuffixClick,
    this.disabledFillColor = CommonColors.whiteFB,
    this.validators = const [],
    this.defaultValue = '',
    this.isEnable = true,
    this.formHeight,
    this.expands = false,
    this.textAlignVertical= TextAlignVertical.top,
  }) : super(key: key);

  @override
  State<CommonTextField> createState() =>
      _CommonTextFieldState();
}

class _CommonTextFieldState
    extends State<CommonTextField> {
  late TextEditingController _controller;
  late bool _isObscured;
  @override
  void initState() {
    super.initState();
    _controller = widget.controller ??
        TextEditingController();
    _controller.text = widget.defaultValue;
    _isObscured = widget.isObscureText;
  }
  void _onSuffixIconClick() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          widget.label != null
              ? Padding(
                  padding: const EdgeInsets.only(
                      left: 4),
                  child: Text(
                    widget.label!,
                    style: widget.labelStyle ??
                        CommonTypography.textH8,
                  ),
                )
              : const SizedBox.shrink(),
          const SizedBox(height: 4),
          SizedBox(
            height: widget.formHeight,
            child: TextFormField(
              textAlignVertical:
                  widget.textAlignVertical,
              enabled: widget.isEnable,
              expands: widget.expands,
              maxLines: widget.expands == true
                  ? null
                  : 1,
              controller: _controller,
              textInputAction: widget.inputAction,
              keyboardType: widget.inputType,
              obscureText: _isObscured,
              inputFormatters:
                  widget.inputFormatters,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: CommonColors.whiteEC,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: CommonColors.whiteEC,
                  ),
                ),
                disabledBorder:
                    OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: CommonColors.whiteEC,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: CommonColors.orangeFF,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: CommonColors.red26,
                  ),
                ),
                filled: true,
                isDense: false,
                focusColor: CommonColors.whiteFB,
                fillColor: widget.isEnable
                    ? CommonColors.whiteFB
                    : widget.disabledFillColor,
                hintText: widget.hint.isEmpty
                    ? widget.label
                    : widget.hint,
                suffixIcon: widget.isObscureText
                    ? IconButton(
                        onPressed:
                            _onSuffixIconClick,
                        splashRadius: 16,
                        icon: _isObscured
                            ? const Icon(Icons
                                .visibility_off)
                            : const Icon(
                                Icons.visibility),
                      )
                    : null,
              ),
              validator: _handleValidator,
            ),
          ),
        ],
      ),
    );
  }

  String? _handleValidator(String? value) {
    var isRequired = widget.validators.contains(
      CommonTextFieldValidator.noEmpty,
    );
    var validateEmail =
        widget.validators.contains(
      CommonTextFieldValidator.email,
    );
    var min8Character =
        widget.validators.contains(
      CommonTextFieldValidator.min8Character,
    );
    var min16Character =
        widget.validators.contains(
      CommonTextFieldValidator.min16Character,
    );
    var max30Character =
        widget.validators.contains(
      CommonTextFieldValidator.max30Character,
    );

    var max50Character =
        widget.validators.contains(
      CommonTextFieldValidator.max50Character,
    );

    var min5Character = widget.validators
        .contains(CommonTextFieldValidator
            .min5Character);

    var phoneNumber = widget.validators.contains(
      CommonTextFieldValidator.phoneNumber,
    );

    if (isRequired &&
        (value == null || value.isEmpty)) {
      return "${widget.label} can't be Empty";
    }
    if (validateEmail &&
        !(value.isValidEmail())) {
      return "Email invalid";
    }
    if (max50Character &&
        (value?.length ?? 0) > 50) {
      return "${widget.label} length must be less than 50 characters long";
    }
    if (max30Character &&
        (value?.length ?? 0) > 30) {
      return "${widget.label} length must be less than 30 characters long";
    }
    if (min8Character &&
        (value?.length ?? 0) < 8) {
      return "${widget.label} length must be at least 8 characters long";
    }
    if (min16Character &&
        (value?.length ?? 0) < 16) {
      return "${widget.label} length must be at least 10 characters long";
    }
    if (min5Character &&
        (value?.length ?? 0) < 5) {
      return "${widget.label} length must be at least 5 characters long";
    }

    if (phoneNumber &&
        ((value?.length ?? 0) > 13 ||
            (value?.length ?? 0) < 10)) {
      return "${widget.label} length must be at least 10 and less than 13";
    }
    return null;
  }


}

enum CommonTextFieldValidator {
  noEmpty,
  email,
  min8Character,
  min16Character,
  max50Character,
  max30Character,
  phoneNumber,
  min5Character
}

class UpperCaseTextFormatter
    extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
