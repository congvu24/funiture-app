import 'package:boilerplate/models/product/Product.model.dart';
import 'package:boilerplate/models/product/ProductInCart.model.dart';
import 'package:boilerplate/stores/cart/cart_store.dart';
import 'package:boilerplate/stores/user/user_store.dart';
import 'package:boilerplate/ui/home/home.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ListWishlist extends StatefulWidget {
  const ListWishlist({Key? key}) : super(key: key);

  @override
  State<ListWishlist> createState() => _ListWishlistState();
}

class _ListWishlistState extends State<ListWishlist> {
  late UserStore _userStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _userStore = Provider.of<UserStore>(context);
  }

  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (_userStore.wishlist.length == 0)
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
                      Icons.bookmark_border_outlined,
                      color: Theme.of(context).canvasColor,
                      size: 100,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Chưa có sản phẩm nào được lưu",
                    style: TextStyle(color: Theme.of(context).canvasColor),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          );
        return Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.7,
          alignment: Alignment.center,
          padding: EdgeInsets.only(bottom: 150),
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: _userStore.wishlist.length,
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
      Product item = _userStore.wishlist[index];
      return Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.15,
        secondaryActions: <Widget>[
          IconSlideAction(
            color: Colors.transparent,
            onTap: () {
              _userStore.removeFromWishlist(item);
            },
            iconWidget: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor.withOpacity(0.5),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Icon(Icons.delete_outline_rounded),
            ),
          ),
        ],
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
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
                      margin: EdgeInsets.only(right: 10),
                      child: Image.asset(item.images[0]),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 250,
                            child: Text(
                              item.name,
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
                            moneyFormater.format(item.price).toString(),
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ]),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
