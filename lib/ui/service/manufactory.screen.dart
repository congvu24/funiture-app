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
      name: "Bàn học",
      company: "Nội thất Hòa Phát",
      image: "assets/images/manu1.png"),
  new Service(
      name: "Bàn học",
      company: "Nội thất Châu Anh",
      image: "assets/images/manu2.jpg"),
  new Service(
      name: "Bàn làm việc",
      company: "Nội thất Đỏ",
      image: "assets/images/manu3.png"),
  new Service(
      name: "Bàn thông minh đa năng",
      company: "Nội thất Anh Linh",
      image: "assets/images/manu4.png"),
  new Service(
      name: "Kệ sách",
      company: "Nội thất Đương Đại",
      image: "assets/images/manu5.jpg"),
  new Service(
      name: "Kệ trang trí",
      company: "Nội thất Gia Hùng",
      image: "assets/images/manu6.jpg"),
  new Service(
      name: "Giường ngủ",
      company: "Nội thất Lâm Hùng",
      image: "assets/images/manu7.jpg"),
  new Service(
      name: "Giường ngủ",
      company: "Nội thất Tân Hưng",
      image: "assets/images/manu8.png"),
  new Service(
      name: "Giường ngủ",
      company: "Nội thất Furnibuy",
      image: "assets/images/manu9.jpg"),
  new Service(
      name: "Bàn trang điểm",
      company: "Luzo",
      image: "assets/images/manu10.jpg"),
  new Service(
      name: "Bàn trang điểm",
      company: "Xưởng Mộc",
      image: "assets/images/manu11.jpg"),
];

class ManufactoryScreen extends StatefulWidget {
  const ManufactoryScreen({Key? key}) : super(key: key);

  @override
  State<ManufactoryScreen> createState() => _ManufactoryScreenState();
}

class _ManufactoryScreenState extends State<ManufactoryScreen> {
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
                                "Gia công nội thất",
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
