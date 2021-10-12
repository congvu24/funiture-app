import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/body_scaffold.widget.dart';
import 'package:boilerplate/widgets/listview_address.widget.dart';
import 'package:boilerplate/widgets/listview_cart.widget.dart';
import 'package:boilerplate/widgets/listview_payment.widget.dart';
import 'package:boilerplate/widgets/my_button.widget.dart';
import 'package:boilerplate/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class EditAddressScreen extends StatelessWidget {
  const EditAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  Container(
                    child: Column(
                      children: [
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    "Chỉnh sửa địa chỉ",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        buildInput(context, "Họ tên"),
                        buildInput(context, "Số điện thoại"),
                        SizedBox(
                          height: 20,
                        ),
                        buildInput(context, "Địa chỉ"),
                        buildInput(context, "Quận huyện"),
                        buildInput(context, "Thành phố"),
                        buildInput(context, "Mã bưu điện"),
                        Spacer(),
                        MyButton(callback: () {}, text: "Lưu")
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildInput(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
          decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        hintText: text,
        hintStyle: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(color: Theme.of(context).canvasColor),
      )),
    );
  }
}
