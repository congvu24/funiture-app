import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function callback;
  final String text;
  const MyButton({Key? key, required this.callback, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: InkWell(
        onTap: () {
          callback();
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
