import 'package:boilerplate/widgets/my_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FeedbackModal extends StatefulWidget {
  FeedbackModal({
    Key? key,
  }) : super(key: key);

  @override
  _FeedbackModalState createState() => _FeedbackModalState();
}

class _FeedbackModalState extends State<FeedbackModal> {
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Theme.of(context).primaryColor;
  }

  Set<String> selected = new Set<String>();

  @override
  void initState() {
    super.initState();
  }

  _handleToggle(String value) {
    if (selected.contains(value))
      setState(() {
        selected.remove(value);
      });
    else
      setState(() {
        selected.add(value);
      });
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      children: [
        Container(
          height: 400,
          padding: EdgeInsets.only(bottom: 10, top: 10, left: 10, right: 10),
          child: Stack(children: [
            Container(
              height: 350,
              padding:
                  EdgeInsets.only(bottom: 50, top: 10, left: 10, right: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Cảm nhận của bạn về chất lượng dịch vụ:",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            child: Icon(Icons.star,
                                size: 40, color: Theme.of(context).canvasColor),
                          ),
                          Text("Chưa tốt", style: TextStyle(fontSize: 12))
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            child: Icon(Icons.star,
                                size: 40, color: Theme.of(context).canvasColor),
                          ),
                          Text("Tạm ổn", style: TextStyle(fontSize: 12))
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            child: Icon(Icons.star,
                                size: 40, color: Theme.of(context).canvasColor),
                          ),
                          Text("Bình thường", style: TextStyle(fontSize: 12))
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            child: Icon(Icons.star,
                                size: 40, color: Theme.of(context).canvasColor),
                          ),
                          Text("Tốt", style: TextStyle(fontSize: 12))
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            child: Icon(Icons.star,
                                size: 40, color: Theme.of(context).canvasColor),
                          ),
                          Text("Tuyệt vời", style: TextStyle(fontSize: 12))
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Chi tiết:",
                    style: TextStyle(fontSize: 16),
                  ),
                  TextField(
                    maxLines: 7,
                    style: TextStyle(fontSize: 14.0),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context)
                                  .canvasColor
                                  .withOpacity(0.5),
                              width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context)
                                  .canvasColor
                                  .withOpacity(0.5),
                              width: 1),
                        ),
                        hintText: "Nói cho chúng tôi điều bạn nghĩ..."),
                  ),
                ],
              ),
            ),
            Positioned.fill(
                bottom: 0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop(selected.toList());
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        child: SvgPicture.asset(
                          "assets/images/cil_send.svg",
                          width: 30,
                        ),
                      )),
                ))
          ]),
        ),
      ],
    );
  }

  Widget buildItem(String text, bool isCheck) {
    return InkWell(
      onTap: () {
        _handleToggle(text);
      },
      child: Container(
        // margin: EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isCheck,
              onChanged: (bool? value) {
                _handleToggle(text);
              },
            ),
            Text(
              text,
            )
          ],
        ),
      ),
    );
  }
}
