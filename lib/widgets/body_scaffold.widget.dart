import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BodyScaffold extends StatelessWidget {
  final List<Widget> children;
  final bool resizeToAvoidBottomInset;

  const BodyScaffold(
      {Key? key,
      this.children = const <Widget>[],
      this.resizeToAvoidBottomInset = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      // appBar: AppBar(
      //   systemOverlayStyle: SystemUiOverlayStyle(
      //       // systemNavigationBarColor: Colors.transparent, // Navigation bar
      //       // statusBarColor: Theme.of(context).primaryColor, // Status bar
      //       ),
      // ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        clipBehavior: Clip.hardEdge,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 10, right: 10, left: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ),
    );
  }
}
