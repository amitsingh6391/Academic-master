import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final bool readOnly;
  final bool isPassword;
  final bool enabled;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? labelText;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final Color? backgroundColor;
  final Function? onDoubleTap;
  final String? helperText;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final void Function()? onEditingComplete;
  final void Function()? onTap;
  final int? maxLines;
  final int? minLines;
  final TextStyle? textStyle;
  final InputBorder? inputBorder;
  final InputBorder? focusBorder;

  const InputField({
    Key? key,
    this.readOnly = false,
    this.isPassword = false,
    this.enabled = true,
    this.controller,
    this.keyboardType,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.backgroundColor,
    this.onDoubleTap,
    this.helperText,
    this.validator,
    this.onChanged,
    this.onEditingComplete,
    this.maxLines,
    this.minLines,
    this.onTap,
    this.textStyle,
    this.inputBorder,
    this.focusBorder,
  }) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late bool obscureText;

  @override
  void initState() {
    obscureText = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onDoubleTap: () => widget.onDoubleTap,
        child: TextFormField(
          style: widget.textStyle,
          validator: widget.validator,
          onChanged: widget.onChanged,
          onEditingComplete: widget.onEditingComplete,
          readOnly: widget.readOnly,
          enabled: widget.enabled,
          controller: widget.controller,
          obscureText: obscureText,
          autocorrect: false,
          minLines: widget.minLines,
          maxLines: !widget.isPassword ? widget.maxLines : 1,
          keyboardType: widget.keyboardType ?? TextInputType.text,
          onTap: widget.onTap,
          decoration: InputDecoration(
            helperText: widget.helperText,
            fillColor: widget.backgroundColor,
            border: widget.inputBorder ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    style: BorderStyle.none,
                  ),
                ),
            focusedBorder: widget.focusBorder,
            suffixIcon: widget.isPassword
                ? InkResponse(
                    onTap: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      switchInCurve: Curves.easeIn,
                      switchOutCurve: Curves.easeOut,
                      layoutBuilder: (currentChild, previousChildren) =>
                          !obscureText
                              ? const Icon(Icons.remove_red_eye)
                              : const Icon(Icons.remove_red_eye_outlined),
                    ),
                  )
                : (widget.suffixIcon),
            labelText: widget.labelText,
            hintText: widget.hintText,
            prefixIcon: widget.prefixIcon,
          ),
        ),
      ),
    );
  }
}
