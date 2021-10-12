import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/body_scaffold.widget.dart';
import 'package:boilerplate/widgets/listview_address.widget.dart';
import 'package:boilerplate/widgets/listview_cart.widget.dart';
import 'package:boilerplate/widgets/listview_payment.widget.dart';
import 'package:boilerplate/widgets/my_button.widget.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  bottom: 20,
                  right: 20,
                  left: 20,
                  top: MediaQuery.of(context).padding.top + 10),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      border: Border.all(
                                          color: Theme.of(context)
                                              .canvasColor
                                              .withOpacity(0.5))),
                                  child: Icon(Icons.chevron_left),
                                ),
                              ),
                              InkWell(
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Funiture app",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                  ),
                                ),
                              ),
                              CircleAvatar(
                                  radius: 28,
                                  backgroundImage:
                                      AssetImage("assets/images/avatar.png")),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                        radius: 28,
                                        backgroundImage: AssetImage(
                                            "assets/images/avatar.png")),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                            height: 40,
                                            width: 200,
                                            margin: EdgeInsets.only(bottom: 10),
                                            // width: double.infinity,
                                            decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .canvasColor,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)))),
                                        Container(
                                            height: 100,
                                            width: 200,
                                            margin: EdgeInsets.only(bottom: 10),
                                            // width: double.infinity,
                                            decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .canvasColor,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))))
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                            height: 40,
                                            width: 200,
                                            margin: EdgeInsets.only(bottom: 10),
                                            // width: double.infinity,
                                            decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .canvasColor,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)))),
                                        Container(
                                            height: 100,
                                            width: 200,
                                            margin: EdgeInsets.only(bottom: 10),
                                            // width: double.infinity,
                                            decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .canvasColor,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)))),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    CircleAvatar(
                                        radius: 28,
                                        backgroundImage: AssetImage(
                                            "assets/images/avatar.png")),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width - 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: TextField(
                        decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: new BorderSide(
                                    color: Theme.of(context).primaryColor)),
                            hintText: 'Nhập nội dung...',
                            suffixIcon: Icon(Icons.send),
                            suffixStyle: const TextStyle(color: Colors.green)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
