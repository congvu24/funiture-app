import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final IconData icon;
  final String? hint;
  final String? errorText;
  final bool isObscure;
  final bool isIcon;
  final TextInputType? inputType;
  final TextEditingController textController;
  final EdgeInsets padding;
  final Color hintColor;
  final Color iconColor;
  final FocusNode? focusNode;
  final ValueChanged? onFieldSubmitted;
  final ValueChanged? onChanged;
  final bool autoFocus;
  final TextInputAction? inputAction;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white),
        child: Padding(
          padding: padding,
          child: TextFormField(
            controller: textController,
            focusNode: focusNode,
            onFieldSubmitted: onFieldSubmitted,
            onChanged: onChanged,
            autofocus: autoFocus,
            textInputAction: inputAction,
            obscureText: this.isObscure,
            maxLength: 25,
            keyboardType: this.inputType,
            style: Theme.of(context).textTheme.bodyText1,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(0),
                hintText: this.hint,
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: hintColor),
                counterText: '',
                icon: this.isIcon ? Icon(this.icon, color: iconColor) : null),
          ),
        ),
      ),
    );
  }

  const TextFieldWidget({
    Key? key,
    required this.icon,
    required this.errorText,
    required this.textController,
    this.inputType,
    this.hint,
    this.isObscure = false,
    this.isIcon = true,
    this.padding = const EdgeInsets.all(0),
    this.hintColor = Colors.grey,
    this.iconColor = Colors.grey,
    this.focusNode,
    this.onFieldSubmitted,
    this.onChanged,
    this.autoFocus = false,
    this.inputAction,
  }) : super(key: key);
}
