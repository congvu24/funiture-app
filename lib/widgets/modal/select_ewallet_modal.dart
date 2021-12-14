import 'package:boilerplate/stores/cart/cart_store.dart';
import 'package:boilerplate/widgets/listview_payment.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

List<PaymentMethod> ewallets = [
  new PaymentMethod("Momo", "assets/images/momo.png"),
  new PaymentMethod("ViettelPay", "assets/images/viettelpay.png"),
  new PaymentMethod("ZaloPay", "assets/images/zalopay.png"),
];

class SelectEWalletModal extends StatefulWidget {
  const SelectEWalletModal({Key? key}) : super(key: key);

  @override
  State<SelectEWalletModal> createState() => _SelectEWalletModalState();
}

class _SelectEWalletModalState extends State<SelectEWalletModal> {
  late CartStore _cartStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _cartStore = Provider.of<CartStore>(context);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Center(
              child: Container(
                // width: double.infinity,
                height: double.infinity,
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Center(child: Text('Ví điện tử')),
                    SizedBox(
                      height: 10,
                    ),
                    ...ewallets.map((item) {
                      return _buildCarouselItem(
                          context, ewallets.indexOf(item));
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCarouselItem(BuildContext context, int index) {
    return Observer(builder: (context) {
      PaymentMethod item = ewallets[index];
      bool isActive = false;
      return InkWell(
        onTap: () {
          isActive = true;
          Navigator.of(context).pop();
        },
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                border: Border.all(
                    color: isActive
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).canvasColor),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Image.asset(
                          item.image,
                          width: 50,
                          height: 50,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        item.name,
                        style: TextStyle(
                            color: isActive
                                ? Theme.of(context).primaryColor
                                : Theme.of(context).canvasColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Icon(
                    isActive ? Icons.check_circle : Icons.circle_outlined,
                    size: 28,
                    color: isActive
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).canvasColor,
                  ),
                ],
              ),
            )),
      );
    });
  }
}
