import 'package:boilerplate/models/product/Product.model.dart';
import 'package:boilerplate/stores/cart/cart_store.dart';
import 'package:boilerplate/stores/user/user_store.dart';
import 'package:boilerplate/ui/home/home.page.dart';
import 'package:boilerplate/utils/flushbar/show_flushbar.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/my_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ItemScreen extends StatefulWidget {
  final Product product;
  const ItemScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  late CartStore _cartStore;
  late UserStore _userStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _cartStore = Provider.of<CartStore>(context);
    _userStore = Provider.of<UserStore>(context);
  }

  void _handleAddToCart(BuildContext context) {
    // if (_userStore.isLoggedIn == false)
    //   Navigator.of(context, rootNavigator: true)
    //       .pushReplacementNamed(Routes.login);
    // else {
    _cartStore.addCart(widget.product);
    showFlushBar(
        context, Theme.of(context).primaryColor, "Đã thêm vào giỏ hàng!");
    // }
  }

  void _handleByNow(BuildContext context) {
    _cartStore.addCart(widget.product);
    Navigator.of(context).pushNamed(Routes.cart);
  }

  void _handleWishlist(BuildContext context) {
    if (_userStore.isLoggedIn == false)
      Navigator.of(context, rootNavigator: true)
          .pushReplacementNamed(Routes.login);
    else {
      if (_userStore.checkInWishlist(widget.product) == false) {
        _userStore.addWishlist(widget.product);
        showFlushBar(
            context, Theme.of(context).primaryColor, "Đã thêm vào theo dõi");
      } else {
        _userStore.removeFromWishlist(widget.product);
        showFlushBar(
            context, Theme.of(context).primaryColor, "Đã xoá khỏi theo dõi");
      }
    }
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            Row(
                              children: [
                                Observer(builder: (context) {
                                  return Container(
                                    margin: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).padding.top +
                                                10),
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        _handleWishlist(context);
                                      },
                                      child: Icon(
                                        _userStore
                                                .checkInWishlist(widget.product)
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: _userStore
                                                .checkInWishlist(widget.product)
                                            ? Theme.of(context).primaryColor
                                            : Theme.of(context).canvasColor,
                                      ),
                                    ),
                                  );
                                }),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: MediaQuery.of(context).padding.top +
                                          10),
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamed(Routes.cart);
                                    },
                                    child: Icon(Icons.shopping_cart_outlined),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 200,
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Stack(
                            children: [
                              // Positioned.fill(
                              //   child: Align(
                              //       alignment: Alignment.bottomCenter,
                              //       child: Image.asset(
                              //         "assets/images/3d-scroll.png",
                              //         fit: BoxFit.contain,
                              //         width: 300,
                              //       )),
                              // ),
                              Container(
                                height: 250,
                                width: double.infinity,
                                child: PageView(
                                  children: <Widget>[
                                    ...widget.product.images
                                        .map((item) => Container(
                                              child: Image.asset(item,
                                                  fit: BoxFit.contain),
                                            ))
                                        .toList()
                                  ],
                                ),
                              ),
                              Positioned.fill(
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                        )
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Text(
                                widget.product.name,
                                maxLines: 10,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                Text(
                                  widget.product.star.toString(),
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(moneyFormater.format(widget.product.price),
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor)),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          widget.product.description,
                          style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context)
                                  .secondaryHeaderColor
                                  .withOpacity(0.6)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        if (widget.product.brand != null)
                          buildSectionItem(
                              context, "Thương hiệu:", widget.product.brand),
                        if (widget.product.country != null)
                          buildSectionItem(
                              context, "Xuất xứ:", widget.product.country),
                        if (widget.product.material != null)
                          buildSectionItem(
                              context, "Nguyên liệu:", widget.product.material),
                        buildSectionItem(context, "Kích thước:", null),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(30),
                          decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .canvasColor
                                  .withOpacity(0.4),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Column(
                            children: [
                              if (widget.product.length != null)
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Dài:",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Theme.of(context)
                                                .secondaryHeaderColor
                                                .withOpacity(0.8))),
                                    Text(
                                        widget.product.length.toString() + "cm",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Theme.of(context)
                                                .secondaryHeaderColor
                                                .withOpacity(0.4)))
                                  ],
                                ),
                              Divider(),
                              if (widget.product.width != null)
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Rộng:",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Theme.of(context)
                                                .secondaryHeaderColor
                                                .withOpacity(0.8))),
                                    Text(widget.product.width.toString() + "cm",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Theme.of(context)
                                                .secondaryHeaderColor
                                                .withOpacity(0.4)))
                                  ],
                                ),
                              Divider(),
                              if (widget.product.height != null)
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Cao:",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Theme.of(context)
                                                .secondaryHeaderColor
                                                .withOpacity(0.8))),
                                    Text(
                                        widget.product.height.toString() + "cm",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Theme.of(context)
                                                .secondaryHeaderColor
                                                .withOpacity(0.4)))
                                  ],
                                ),
                              Divider(),
                              if (widget.product.deep != null)
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Sâu:",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Theme.of(context)
                                                .secondaryHeaderColor
                                                .withOpacity(0.8))),
                                    Text(widget.product.deep.toString() + "cm",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Theme.of(context)
                                                .secondaryHeaderColor
                                                .withOpacity(0.4)))
                                  ],
                                ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  _handleAddToCart(context);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 16),
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Icon(Icons.add_shopping_cart_outlined,
                                      color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    _handleByNow(context);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 40),
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Text(
                                      "Mua ngay",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
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

  Widget buildSectionItem(
      BuildContext context, String textLeft, String? textRight) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            textLeft,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          if (textRight != null)
            Text(
              textRight,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).canvasColor.withOpacity(1)),
            )
        ],
      ),
    );
  }
}
