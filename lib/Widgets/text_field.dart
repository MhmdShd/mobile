import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.customIcon,
      this.hint,
      required this.controller,
      this.maxlines,
      this.inputFormatters,
      this.validator,
      this.label,
      this.inputType = TextInputType.name,
      this.inputAction = TextInputAction.next,
      this.secure = false})
      : super(key: key);
  final int? maxlines;
  final Image customIcon;
  final String? hint;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final String? label;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final bool secure;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
          controller: controller,
          inputFormatters: inputFormatters,
          validator: validator,
          textAlignVertical: TextAlignVertical.center,
          keyboardType: inputType,
          maxLines: maxlines,
          // keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1.5,
                  color: Theme.of(context).colorScheme.secondaryContainer),
              borderRadius: BorderRadius.circular(20.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1.5, color: Theme.of(context).colorScheme.secondary),
              borderRadius: BorderRadius.circular(20.0),
            ),
            border: InputBorder.none,
            labelStyle: TextStyle(
                color:
                    Theme.of(context).colorScheme.onSurface.withOpacity(.44)),
            labelText: label,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Opacity(
                opacity: 0.44,
                child: Tab(
                  icon: customIcon,
                ),
              ),
            ),
            hintText: hint,
          ),
          obscureText: secure),
    );
  }
}
