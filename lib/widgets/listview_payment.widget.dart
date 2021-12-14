import 'package:boilerplate/stores/cart/cart_store.dart';
import 'package:boilerplate/widgets/modal/select_ewallet_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class PaymentMethod {
  final String name;
  final String image;

  PaymentMethod(this.name, this.image);
}

List<PaymentMethod> payments = [
  new PaymentMethod("Thẻ Visa", "assets/images/visa.png"),
  new PaymentMethod("Ví điện tử", "assets/images/e-wallet.png"),
  new PaymentMethod("Thẻ ATM/Internet Banking", "assets/images/atm.png"),
  new PaymentMethod("Trả góp", "assets/images/installment.png"),
  new PaymentMethod("Ship COD/POS", "assets/images/money.png")
];

class ListviewPayment extends StatefulWidget {
  const ListviewPayment({Key? key}) : super(key: key);

  @override
  State<ListviewPayment> createState() => _ListviewPaymentState();
}

class _ListviewPaymentState extends State<ListviewPayment> {
  late CartStore _cartStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _cartStore = Provider.of<CartStore>(context);
  }

  _handleSelectWallet() async {
    await showModalBottomSheet(
        context: context,
        useRootNavigator: true,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Provider(
            create: (context) => _cartStore,
            child: SelectEWalletModal(),
          );
        });
    _cartStore.setPayment(payments[1]);
  }

  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 850,
      alignment: Alignment.center,
      padding: EdgeInsets.only(bottom: 150),
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Observer(builder: (context) {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: payments.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return _buildCarouselItem(context, index);
            },
          );
        }),
      ),
    );
  }

  Widget _buildCarouselItem(BuildContext context, int index) {
    return Observer(builder: (context) {
      PaymentMethod item = payments[index];
      bool isActive = item.name == _cartStore.paymentMethod.name;
      return InkWell(
        onTap: () {
          if (item.name != "Ví điện tử")
            _cartStore.setPayment(item);
          else
            _handleSelectWallet();
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
                      Image.asset(
                        item.image,
                        width: 50,
                        height: 50,
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
