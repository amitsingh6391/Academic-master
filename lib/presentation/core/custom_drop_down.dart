import 'package:academic_master/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDownButton extends StatelessWidget {
  final List<String> items;
  final String? hintText;
  final Color? backgroundColor;
  final double? height;
  final double? width;
  final TextStyle? textStyle;

  final String? prefixIcon;
  final bool? enableBorder;

  final void Function(String?)? onChanged;
  final void Function()? onTap;
  const CustomDropDownButton({
    Key? key,
    required this.items,
    this.hintText,
    this.backgroundColor,
    this.onChanged,
    this.onTap,
    this.height,
    this.width,
    this.textStyle,
    this.prefixIcon,
    this.enableBorder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          padding: EdgeInsets.zero,
          alignedDropdown: true,
          child: DropdownButtonFormField<String>(
            isExpanded: true,
            items: items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    value,
                    style: textStyle ?? Apptheme(context).normalText,
                  ),
                ),
              );
            }).toList(),
            hint: Row(
              children: [
                if (prefixIcon != null)
                  Image(
                    height: 10.h,
                    width: 10.5.w,
                    fit: BoxFit.fill,
                    image: AssetImage(prefixIcon!),
                  )
                else
                  SizedBox(
                    width: 10.h,
                  ),
                Text(
                  hintText!,
                  style: textStyle ?? Apptheme(context).normalText,
                  softWrap: true,
                ),
              ],
            ),
            icon: const Padding(
              padding: EdgeInsets.zero,
              child: Icon(Icons.arrow_drop_down, color: Apptheme.primaryColor),
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  width: 0,
                  color: Apptheme.assentColor,
                  style: BorderStyle.none,
                ),
              ),
              enabledBorder: enableBorder != null
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        width: 0,
                        color: Apptheme.backgroundColor,
                        style: BorderStyle.none,
                      ),
                    )
                  : OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
              contentPadding: EdgeInsets.zero,
              filled: true,
            ),
            onChanged: onChanged,
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}
