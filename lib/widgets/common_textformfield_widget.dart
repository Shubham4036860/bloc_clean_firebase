import 'package:bloc_with_clean/core/theme/color_schemas.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextFormField extends StatefulWidget {
  CommonTextFormField({
    Key? key,
    required this.editController,
    this.focusNode,
    required this.labelText,
    this.labelColor,
    required this.onChange,
    // required this.onValidate,
    this.onFieldSubmitted,
    this.onEditedSubmitted,
    this.maxLength,
    this.backgroundColor,
    this.isEnabled = true,
    this.textAlign = TextAlign.start,
    required this.textInputType,
    this.maxLines = 1,
    this.minLines = 1,
    this.textCounter,
    this.borderColor,
    this.prefixIcon,
    this.prefixWidget,
    this.suffixIcon,
    this.contentPadding,
    this.hintStyle,
    this.isAlignLabelWithHint,
    this.borderRadius,
    this.isPassword = false,
    this.isObscureText = false,
    this.textInputAction,
    this.inputBorder,
    this.enableInputBorder,
    this.inputDecoration,
    required this.onValidate,
    this.onTapped,
    this.style,
  }) : super(key: key);

  final TextEditingController editController;
  final FocusNode? focusNode;
  final int? maxLength;
  final String labelText;
  final Color? labelColor;
  final Color? backgroundColor;
  final Color? borderColor;
  bool isEnabled = true;
  TextAlign textAlign;
  bool isPassword;
  bool isObscureText;
  TextInputType textInputType;
  TextStyle? hintStyle;
  BorderRadius? borderRadius;
  final void Function(String?) onChange;
  InputBorder? inputBorder;
  InputBorder? enableInputBorder;
  InputBorder? disableBorder;
  TextStyle? style;
  final void Function(String?)? onFieldSubmitted;
  final void Function()? onEditedSubmitted;
  int maxLines;

  int minLines = 1;
  final Widget? textCounter;
  final Widget? prefixIcon;
  final Widget? prefixWidget;
  final Widget? suffixIcon;
  final EdgeInsets? contentPadding;
  final bool? isAlignLabelWithHint;
  TextInputAction? textInputAction;
  final String? Function(String?)? onValidate;
  InputDecoration? inputDecoration;
  VoidCallback? onTapped;

  @override
  State<CommonTextFormField> createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        autofocus: false,
        enableInteractiveSelection: true,
        textInputAction: widget.textInputAction ?? TextInputAction.next,
        controller: widget.editController,
        focusNode: widget.focusNode ?? FocusNode(),
        enabled: widget.isEnabled,
        textAlign: widget.textAlign,
        onEditingComplete: widget.onEditedSubmitted,
        obscuringCharacter: '•',
        inputFormatters: onGetInputFormatter(),
        keyboardType: widget.textInputType,
        onChanged: widget.onChange,
        onTap: widget.onTapped,
        obscureText: widget.isObscureText,
        // obscuringCharacter: '●',
        cursorColor: widget.labelColor ?? primaryColor,
        textCapitalization:
            widget.textInputType == TextInputType.emailAddress || widget.isPassword ? TextCapitalization.none : TextCapitalization.sentences,
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        maxLength: widget.maxLength ?? 100,
        onFieldSubmitted: widget.onFieldSubmitted,
        decoration: widget.inputDecoration ??
            InputDecoration(
              contentPadding: widget.contentPadding ?? const EdgeInsets.only(left: 20, right: 5, top: 0, bottom: 0),
              alignLabelWithHint: widget.isAlignLabelWithHint ?? false,
              prefixIcon: widget.prefixIcon,
              prefix: widget.prefixWidget,
              suffixIcon: widget.suffixIcon,
              counter: null,
              isDense: true,
              counterText: "",
              focusedBorder: widget.inputBorder ?? InputBorder.none,
              hintText: widget.labelText,
              hintStyle: widget.hintStyle,
              filled: true,
              fillColor: widget.backgroundColor ?? colorWhite,
              enabledBorder: widget.enableInputBorder,
              disabledBorder: widget.disableBorder ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: transparent,
                      width: 1,
                    ),
                  ),
              // disabledBorder: AppThemeState.disabledBorderStyle(),
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
        onTapOutside: (value) {},
        style: widget.style,
        validator: (value) => widget.onValidate!(value));
  }

  List<TextInputFormatter> onGetInputFormatter() {
    List<TextInputFormatter> inputFormatter = [];
    inputFormatter.addAll([
      FilteringTextInputFormatter.deny(RegExp('(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])')),
    ]);
    if (widget.textInputType == TextInputType.name) {
      inputFormatter.addAll([
        FilteringTextInputFormatter.allow(RegExp(r'^[A-Za-z\s]*$')),
        LengthLimitingTextInputFormatter(70),
      ]);
    } else if (widget.textInputType == TextInputType.phone || widget.textInputType == TextInputType.number) {
      inputFormatter.addAll([
        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
        // InitialZeroInputFormatter()
      ]);
      // inputFormatter.addAll([FilteringTextInputFormatter.allow(RegExp(r'^-?[0-9]*',)), InitialZeroInputFormatter()]);
    } else if (widget.textInputType == TextInputType.none) {
      inputFormatter.addAll([FilteringTextInputFormatter.allow(RegExp("(^[+A-Z+a-z+0-9]+\$)"))]);
    }
    return inputFormatter;
  }
}
