import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DefaultTextFormField extends StatelessWidget {
  String hintText;
  TextEditingController? controller;
  String? prefixIconImageName;
  String? suffixIconImageName;
  void Function(String)? onChange;

  DefaultTextFormField({
    required this.hintText,
    this.controller,
    this.prefixIconImageName,
    this.suffixIconImageName,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIconImageName == null
            ? null
            : SvgPicture.asset(
                'assets/icons/$prefixIconImageName.svg',
                height: 24,
                width: 24,
                fit: .scaleDown,
              ),
        suffixIcon: suffixIconImageName == null
            ? null
            : SvgPicture.asset(
                'assets/icons/$suffixIconImageName.svg',
                height: 24,
                width: 24,
                fit: .scaleDown,
              ),
      ),
      controller: controller,
      onChanged: onChange,
    );
  }
}
