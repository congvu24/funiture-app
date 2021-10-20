import 'package:boilerplate/stores/cart/cart_store.dart';
import 'package:boilerplate/ui/cart/address.screen.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:provider/provider.dart';

class ListviewAddress extends StatefulWidget {
  const ListviewAddress({Key? key}) : super(key: key);

  @override
  State<ListviewAddress> createState() => _ListviewAddressState();
}

class _ListviewAddressState extends State<ListviewAddress> {
  late CartStore _cartStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _cartStore = Provider.of<CartStore>(context);
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
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: addresses.length + 1,
          physics: BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            if (index == addresses.length)
              return InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(Routes.editAddress);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: DottedBorder(
                    padding: EdgeInsets.all(10),
                    color: Theme.of(context).canvasColor.withOpacity(0.5),
                    radius: Radius.circular(20),
                    strokeWidth: 1,
                    child: Container(
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.center,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Thêm địa chỉ mới",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .canvasColor
                                        .withOpacity(0.5)),
                              ),
                            ])),
                  ),
                ),
              );
            return _buildCarouselItem(context, index);
          },
        ),
      ),
    );
  }

  Widget _buildCarouselItem(BuildContext context, int index) {
    return Observer(builder: (context) {
      Address item = addresses[index];
      bool isActive = item.id == _cartStore.address.id;

      return Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.15,
        secondaryActions: <Widget>[
          IconSlideAction(
            color: Colors.transparent,
            iconWidget: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor.withOpacity(0.5),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Icon(Icons.edit),
            ),
          ),
          IconSlideAction(
            color: Colors.transparent,
            iconWidget: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor.withOpacity(0.5),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Icon(Icons.delete_outlined),
            ),
          ),
        ],
        child: InkWell(
          onTap: () {
            _cartStore.setAddress(item);
          },
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isActive
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).canvasColor,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 32,
                          color: isActive
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).canvasColor,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              style: TextStyle(
                                  color: isActive
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context).canvasColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              item.phone,
                              style: TextStyle(
                                  color: Theme.of(context).canvasColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                            Container(
                              width: 200,
                              child: Text(
                                item.address,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: isActive
                                        ? Theme.of(context).primaryColor
                                        : Theme.of(context).canvasColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
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
        ),
      );
    });
  }
}
