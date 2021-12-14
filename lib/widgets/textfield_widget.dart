import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
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
  State<TextFieldWidget> createState() => _TextFieldWidgetState();

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

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late bool isHide;

  @override
  void initState() {
    super.initState();
    isHide = widget.isObscure == true;
  }

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
          padding: widget.padding,
          child: TextFormField(
            controller: widget.textController,
            focusNode: widget.focusNode,
            onFieldSubmitted: widget.onFieldSubmitted,
            onChanged: widget.onChanged,
            autofocus: widget.autoFocus,
            textInputAction: widget.inputAction,
            obscureText: isHide,
            maxLength: 100,
            keyboardType: this.widget.inputType,
            style: Theme.of(context).textTheme.bodyText1,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(0),
                hintText: this.widget.hint,
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: widget.hintColor),
                counterText: '',
                icon: this.widget.isIcon
                    ? Icon(this.widget.icon, color: widget.iconColor)
                    : null,
                suffix: widget.isObscure
                    ? InkWell(
                        onTap: () {
                          setState(() {
                            isHide = !isHide;
                          });
                        },
                        child: Icon(
                          isHide
                              ? Icons.remove_red_eye_sharp
                              : Icons.visibility_off,
                          size: 20,
                          color: Theme.of(context).canvasColor,
                        ),
                      )
                    : null),
          ),
        ),
      ),
    );
  }
}
