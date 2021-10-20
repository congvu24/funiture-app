import 'package:boilerplate/models/product/ProductInCart.model.dart';
import 'package:boilerplate/stores/cart/cart_store.dart';
import 'package:boilerplate/ui/home/home.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ListviewCart extends StatefulWidget {
  const ListviewCart({Key? key}) : super(key: key);

  @override
  State<ListviewCart> createState() => _ListviewCartState();
}

class _ListviewCartState extends State<ListviewCart> {
  late CartStore _cartStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _cartStore = Provider.of<CartStore>(context);
  }

  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (_cartStore.data.length == 0)
          return Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: double.infinity,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        color: Theme.of(context).canvasColor.withOpacity(0.3),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    child: Icon(
                      Icons.add_shopping_cart,
                      color: Theme.of(context).canvasColor,
                      size: 100,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Không có sản phẩm nào trong giỏ hàng.",
                    style: TextStyle(color: Theme.of(context).canvasColor),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).maybePop();
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Text(
                          "Quay lại",
                          style: TextStyle(color: Colors.white),
                        ),
                      ))
                ],
              ),
            ),
          );
        return Container(
          width: double.infinity,
          height: 850,
          alignment: Alignment.center,
          padding: EdgeInsets.only(bottom: 150),
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: _cartStore.data.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return _buildCarouselItem(context, index);
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildCarouselItem(BuildContext context, int index) {
    return Observer(builder: (context) {
      ProductInCart item = _cartStore.data[index];
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 150,
                    child: Image.asset(item.product.images[0]),
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 200,
                          child: Text(
                            item.product.name,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "đ" +
                              moneyFormater
                                  .format(item.product.price)
                                  .toString(),
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ]),
                ],
              ),
            ),
            Positioned(
                bottom: 20,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(2),
                  color: Colors.white,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          _cartStore.removeCart(item.product);
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Theme.of(context).canvasColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Text(
                            "-",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Observer(builder: (context) {
                        return InkWell(
                          child: Container(
                            child: Text(
                              item.number.toString(),
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        );
                      }),
                      SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          _cartStore.addCart(item.product);
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Icon(Icons.add, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      );
    });
  }
}
