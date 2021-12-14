import 'package:boilerplate/models/product/Product.model.dart';
import 'package:boilerplate/stores/cart/cart_store.dart';
import 'package:boilerplate/stores/user/user_store.dart';
import 'package:boilerplate/ui/home/home.page.dart';
import 'package:boilerplate/utils/flushbar/show_flushbar.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/list_service.widget.dart';
import 'package:boilerplate/widgets/my_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

List<Service> listDesign = [
  new Service(
      name: "Mẫu thiết kế chung cư 1 phòng ngủ sang trọng và hiện đại",
      company: "Thanh Việt Corp",
      image: "assets/images/design1.jpg"),
  new Service(
      name: "Mẫu thiết kế nội thất phòng ngủ đẹp, tiết kiệm chi phí",
      company: "Appollo Việt",
      image: "assets/images/design2.jpg"),
  new Service(
      name: "Mẫu thiết kế nội thất phòng ngủ đẹp, không gian ấm cúng",
      company: "Appollo Việt",
      image: "assets/images/design3.jpg"),
  new Service(
      name: "Mẫu thiết kế nội thất căn hộ hiện đại",
      company: "Home xinh",
      image: "assets/images/design4.jpg"),
  new Service(
      name: "Mẫu thiết kế căn hộ 1 phòng ngủ tông trắng màu nâu trắng",
      company: "Nhà đẹp Á Âu",
      image: "assets/images/design5.jpg"),
  new Service(
      name: "Mẫu thiết kế căn hộ chung cư 1 phòng ngủ mang đậm dấu ấn riêng",
      company: "We do",
      image: "assets/images/design6.jpg"),
  new Service(
      name:
          "Mẫu thiết kế căn hộ chung cư 1 phòng ngủ đẹp, tiện nghi và sang trọng",
      company: "Thiết kế thông minh",
      image: "assets/images/design7.jpg")
];

class DesignScreen extends StatefulWidget {
  const DesignScreen({Key? key}) : super(key: key);

  @override
  State<DesignScreen> createState() => _DesignScreenState();
}

class _DesignScreenState extends State<DesignScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(children: [
          Padding(
            padding: EdgeInsets.only(
                // bottom: 20,
                right: 10,
                left: 10,
                top: 0),
            child: Stack(
              children: [
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).padding.top),
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
                            Container(
                              margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).padding.top,
                                  left: 20),
                              child: Text(
                                "Thiết kế bản vẽ",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context).primaryColor),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ListviewService(
                          listData: listDesign,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
