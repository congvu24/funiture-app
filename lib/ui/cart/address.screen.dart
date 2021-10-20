import 'package:boilerplate/stores/cart/cart_store.dart';
import 'package:boilerplate/ui/home/home.page.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/body_scaffold.widget.dart';
import 'package:boilerplate/widgets/listview_address.widget.dart';
import 'package:boilerplate/widgets/listview_cart.widget.dart';
import 'package:boilerplate/widgets/listview_payment.widget.dart';
import 'package:boilerplate/widgets/my_button.widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class Address {
  final int id;
  final String name;
  final String phone;
  final String address;
  String? city;
  String? postcode;
  String? country;

  Address(
      {required this.id,
      required this.name,
      required this.phone,
      required this.address,
      this.city,
      this.postcode,
      this.country});
}

List<Address> addresses = [
  new Address(
      id: 1,
      name: "Dương Công Vũ",
      phone: "09121331",
      address: "Hoàng Diệu 2, Linh Trung, Thủ Đức, TPHCM"),
  new Address(
      id: 2,
      name: "Nguyễn Dương Thục Anh",
      phone: "099912228",
      address: "Hoàng Hoa Thám, Gia Ray, Xuân Lộc, Đồng Nai"),
];

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  late CartStore _cartStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _cartStore = Provider.of<CartStore>(context);
  }

  void showBottomModal(context) {
    showModalBottomSheet<void>(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return ShippingMethodSelect();
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
              padding: EdgeInsets.only(
                  bottom: 20,
                  right: 20,
                  left: 20,
                  top: MediaQuery.of(context).padding.top + 10),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Container(
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
                                      "Địa chỉ giao hàng",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          ListviewAddress(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                height: 180,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        offset: Offset(0, -1),
                        blurRadius: 10)
                  ],
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        showBottomModal(context);
                      },
                      child: DottedBorder(
                        padding: EdgeInsets.all(10),
                        color: Theme.of(context).primaryColor,
                        child: Observer(builder: (context) {
                          return Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Đối tác giao hàng:",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Theme.of(context).primaryColor),
                                ),
                                Text(
                                  _cartStore.shippingMethod.shortName,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Theme.of(context).primaryColor),
                                )
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    MyButton(
                        callback: () {
                          Navigator.of(context).pushNamed(Routes.confirm);
                        },
                        text: "Tiếp tục")
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ShippingMethod {
  final String name;
  final double fee;
  final String shortName;

  ShippingMethod(this.name, this.fee, this.shortName);
}

List<ShippingMethod> shippingMethods = [
  new ShippingMethod("Giao hàng tiết kiệm", 10000, "GHTK"),
  new ShippingMethod("Giao hàng nhanh", 20000, "GHN"),
];

class ShippingMethodSelect extends StatefulWidget {
  const ShippingMethodSelect({
    Key? key,
  }) : super(key: key);

  @override
  State<ShippingMethodSelect> createState() => _ShippingMethodSelectState();
}

class _ShippingMethodSelectState extends State<ShippingMethodSelect> {
  late CartStore _cartStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _cartStore = Provider.of<CartStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        height: 300,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Center(
              child: Container(
                // width: double.infinity,
                height: double.infinity,
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('Đơn vị vận chuyển'),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        ...shippingMethods.map((item) {
                          return Observer(builder: (context) {
                            bool isActive = item.shortName ==
                                _cartStore.shippingMethod.shortName;
                            return InkWell(
                              onTap: () {
                                _cartStore.setShipping(item);
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: isActive
                                          ? Theme.of(context).primaryColor
                                          : Theme.of(context).canvasColor),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      item.name,
                                      style: TextStyle(
                                          color: isActive
                                              ? Theme.of(context).primaryColor
                                              : Theme.of(context).canvasColor),
                                    ),
                                    Text(
                                      "đ" + moneyFormater.format(item.fee),
                                      style: TextStyle(
                                          color: isActive
                                              ? Theme.of(context).primaryColor
                                              : Theme.of(context).canvasColor),
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                        }).toList(),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
