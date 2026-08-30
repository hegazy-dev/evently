import 'package:evently/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DefaultTextFormField extends StatefulWidget {
  String hintText;
  TextEditingController? controller;
  String? prefixIconImageName;
  String? suffixIconImageName;
  void Function(String)? onChange;
  bool isPassword;
  String? Function(String?)? validator;
  int maxLines;

  DefaultTextFormField({
    required this.hintText,
    this.controller,
    this.prefixIconImageName,
    this.suffixIconImageName,
    this.onChange,
    this.isPassword = false,
    this.validator,
    this.maxLines = 1,
  });

  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  late bool isObscure = widget.isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: widget.prefixIconImageName == null
            ? null
            : SvgPicture.asset(
                'assets/icons/${widget.prefixIconImageName}.svg',
                height: 24,
                width: 24,
                fit: .scaleDown,
              ),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  isObscure = !isObscure;
                  setState(() {});
                },
                icon: Icon(
                  isObscure
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: AppTheme.grey,
                ),
              )
            : widget.suffixIconImageName == null
            ? null
            : SvgPicture.asset(
                'assets/icons/${widget.suffixIconImageName}.svg',
                height: 24,
                width: 24,
                fit: .scaleDown,
              ),
      ),
      controller: widget.controller,
      onChanged: widget.onChange,
      obscureText: isObscure,
      validator: widget.validator,
      maxLines: widget.maxLines,
      autovalidateMode: .onUserInteraction,
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      style: Theme.of(context).textTheme.titleSmall,
    );
  }
}
