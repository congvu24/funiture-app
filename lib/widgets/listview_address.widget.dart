import 'package:boilerplate/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:dotted_border/dotted_border.dart';

class ListviewAddress extends StatelessWidget {
  const ListviewAddress({Key? key}) : super(key: key);

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
          itemCount: 5,
          physics: BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            if (index == 4)
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

  Widget _buildCarouselItem(BuildContext context, int carouselIndex) {
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
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
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
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dương Công Vũ",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "091293123",
                          style: TextStyle(
                              color: Theme.of(context).canvasColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "Xuân Lộc, Đồng Nai",
                          style: TextStyle(
                              color: Theme.of(context).canvasColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(
                  Icons.check_circle,
                  size: 28,
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
          )),
    );
  }
}
