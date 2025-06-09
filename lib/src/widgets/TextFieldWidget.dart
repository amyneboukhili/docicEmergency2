

import 'package:docicemergency2/src/Utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


// ignore: must_be_immutable
class TextFieldWidget extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final String hint;
  TextInputType? inputType;

  double? width;
  double? fontSize;
  final bool? hidden;
  final Function? onTap;
  final Function? onPressed;
  final String? Function(String? val)? validator;
  final IconData? suffixIcon ;
  final IconData? prefixicon;
  final String? Function(String val)? onChanged;
  final Color? colorof;
  final Color? bordorColor;
  final double? borderRadios;
 
  

  TextFieldWidget(
      {super.key,
      required this.label,
      required this.hint,
      required this.controller,
      this.inputType,
      this.hidden,
      this.onTap,
      this.validator,
      this.width,
      this.fontSize, 
      this.suffixIcon,
      this.onPressed,
      this.prefixicon,
      this.onChanged,
      this.colorof,
      this.bordorColor,
      this.borderRadios,
      
       });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 327.w,
      child: TextFormField(
        onChanged:(value)=> onChanged?.call(value),
        validator: (value) => validator?.call(value),
        obscureText: hidden ?? false,
        keyboardType: inputType,
        controller: controller,
        cursorHeight: 18.sp,
    
        autocorrect: true,
        style: Theme.of(context).textTheme.labelLarge,
        decoration: InputDecoration(
            labelText: label,
            filled: true,
            hintText: hint,
            hintStyle: TextStyle(
              fontFamily: 'Jost',
              fontSize: fontSize ?? 16.sp,
            ),
            labelStyle: TextStyle(
              fontFamily: 'Jost',
              fontSize: fontSize ?? 16.sp,
            ),
            errorStyle: TextStyle(
              fontFamily: 'Jost',
              fontSize: fontSize ?? 16.sp,
            ),
            helperStyle: TextStyle(
              fontFamily: 'Jost',
              fontSize: fontSize ?? 16.sp,
            ),
            alignLabelWithHint: true,
            focusColor: ThemeUtils.primaryBlue,
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadios??16),
                borderSide: BorderSide(color: Colors.red)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadios??16),
                borderSide: BorderSide(color:bordorColor?? ThemeUtils.secondaryGreenBlue)),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadios??16),
              borderSide: BorderSide(color:bordorColor?? ThemeUtils.secondaryGreenBlue),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadios??16),
                borderSide: BorderSide(color:bordorColor?? ThemeUtils.secondaryGreenBlue)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadios??16),
                borderSide: BorderSide(color:bordorColor?? ThemeUtils.secondaryGreenBlue)),
            fillColor:colorof?? Color(0xffF5F5F5),
            prefixIcon: prefixicon != null ?  Icon(prefixicon): null , 
            suffixIcon: suffixIcon != null ? IconButton(onPressed:() => onTap?.call(),
            icon: Icon(suffixIcon)) : null, )
             , 
            
      ),
    );
  }
}
