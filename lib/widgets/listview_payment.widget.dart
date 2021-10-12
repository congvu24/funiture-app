import 'package:flutter/material.dart';

class ListviewPayment extends StatelessWidget {
  const ListviewPayment({Key? key}) : super(key: key);

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
            return _buildCarouselItem(context, index);
          },
        ),
      ),
    );
  }

  Widget _buildCarouselItem(BuildContext context, int carouselIndex) {
    return Padding(
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("assets/images/mastercard.png"),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Mastercard",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
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
        ));
  }
}
