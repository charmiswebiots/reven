
import 'package:flutter/material.dart';
import 'package:reven/global/theme/index.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hint;
  final String? hintText;
  final String? labelText;
  final double? radius;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextStyle? style;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final double padding;
  final Color? fillColor;
  final int maxLines;
  final int minLines;
  final bool enabled;
  final int? maxLength;
  final bool showCounter;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String>? onChanged;
  final bool showBoarder;
  final FormFieldSetter<String>? onSaved;
  final double? borderRadis;
  final FocusNode? focusNode;

  const CustomTextFormField({
    Key? key,
    this.controller,
    this.hint,
    this.hintText,
    this.labelText,
    this.radius,
    this.prefixIcon,
    this.suffixIcon,
    this.style,
    this.obscureText = false,
    this.validator,
    this.padding = 10,
    this.fillColor,
    this.maxLines = 1,
    this.keyboardType,
    this.minLines = 1,
    this.enabled = true,
    this.maxLength,
    this.showCounter = false,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onChanged,
    this.showBoarder = true, this.onSaved, this.borderRadis, this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular((borderRadis != null) ? borderRadis! : 18),
          borderSide: BorderSide(
            color: appColor.gray,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular((borderRadis != null) ? borderRadis! : 18),
          borderSide: const BorderSide(
            color: Color(0xFFB8B8B8),
            width: 1.0,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular((borderRadis != null) ? borderRadis! : 18),
          borderSide: BorderSide(
            color: appColor.inputBorder,
            width: 1.0,
          ),
        ),
        prefixIcon: prefixIcon != null
            ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: prefixIcon,
        )
            : null,
        suffixIcon: suffixIcon != null
            ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: suffixIcon,
        )
            : null,
        filled: true,
        fillColor: fillColor ?? Colors.white,
        contentPadding: EdgeInsets.all(padding),
        hintText: hintText,
        labelText: labelText,
        counterText: showCounter ? null : '',
      ),
      onSaved: onSaved,
      style: style ?? appCss.paragraph,
      obscureText: obscureText,
      validator: validator,
      keyboardType: keyboardType ?? TextInputType.text,
      maxLines: maxLines,
      minLines: minLines,
      enabled: enabled,
      maxLength: maxLength,
      onTap: onTap,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
    );
  }
}
