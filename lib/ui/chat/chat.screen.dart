import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/body_scaffold.widget.dart';
import 'package:boilerplate/widgets/listview_address.widget.dart';
import 'package:boilerplate/widgets/listview_cart.widget.dart';
import 'package:boilerplate/widgets/listview_payment.widget.dart';
import 'package:boilerplate/widgets/my_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController controller = new TextEditingController();

  List<String> chats = [
    "Chào bạn.",
    "Mình đang muốn tham khảo các sản phẩm bàn ghế cho phòng bếp."
  ];

  _onSubmit() {
    setState(() {
      String value = controller.text;
      chats.add(value);
      controller.text = "";
    });
  }

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
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).padding.top + 10),
              child: Stack(
                children: [
                  Container(
                    height: 850,
                    margin: EdgeInsets.only(bottom: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
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
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child: Text(
                                            "Anota shop",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                color: Theme.of(context)
                                                    .primaryColor),
                                          ),
                                        ),
                                      ),
                                    ),
                                    CircleAvatar(
                                        radius: 28,
                                        backgroundImage: AssetImage(
                                            "assets/images/avatar.png")),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                child: SingleChildScrollView(
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CircleAvatar(
                                              radius: 28,
                                              backgroundColor: Theme.of(context)
                                                  .primaryColor,
                                              child: const Text('T',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 40,
                                                  // width: 200,
                                                  padding: EdgeInsets.all(10),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  margin: EdgeInsets.only(
                                                      bottom: 10),
                                                  // width: double.infinity,
                                                  decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                          .canvasColor
                                                          .withOpacity(0.3),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                  child: Text(
                                                      "Anota xin chào bạn."),
                                                ),
                                                Container(
                                                    // height: 100,
                                                    width: 200,
                                                    padding: EdgeInsets.all(10),
                                                    margin: EdgeInsets.only(
                                                        bottom: 10),
                                                    // width: double.infinity,
                                                    decoration: BoxDecoration(
                                                        color: Theme.of(context)
                                                            .canvasColor
                                                            .withOpacity(0.3),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10))),
                                                    child: Text(
                                                        "Hiện Anota đang có chương trình khuyến mãi 10% các sản phẩm nội thất phòng khách cho người dùng mới."))
                                              ],
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                ...chats.map((chat) =>
                                                    ConstrainedBox(
                                                      constraints:
                                                          BoxConstraints(
                                                              maxWidth: 200,
                                                              minWidth: 50),
                                                      child: Container(
                                                        // height: 40,

                                                        padding:
                                                            EdgeInsets.all(10),
                                                        margin: EdgeInsets.only(
                                                            bottom: 10),
                                                        // width: double.infinity,
                                                        decoration: BoxDecoration(
                                                            color: Theme.of(
                                                                    context)
                                                                .canvasColor
                                                                .withOpacity(
                                                                    0.3),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10))),
                                                        child: Text(chat),
                                                      ),
                                                    ))
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
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width - 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: TextField(
                          controller: controller,
                          decoration: new InputDecoration(
                              border: new OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: new BorderSide(
                                      color: Theme.of(context).primaryColor)),
                              hintText: 'Nhập nội dung...',
                              suffixIcon: InkWell(
                                  onTap: () {
                                    _onSubmit();
                                  },
                                  child: Container(
                                      height: 50,
                                      width: 50,
                                      child: Icon(Icons.send))),
                              suffixStyle:
                                  const TextStyle(color: Colors.green)),
                        ),
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
