import 'package:flutter/material.dart';

class ListviewCart extends StatelessWidget {
  const ListviewCart({Key? key}) : super(key: key);

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
          itemCount: 10,
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
                  child: Image.asset("assets/images/product-1.png"),
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    "Nina Soft Chair",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "\$40.50",
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
                      child: Container(
                        width: 30,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Theme.of(context).canvasColor,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Text(
                          "-",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      child: Container(
                        child: Text(
                          "1",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      child: Container(
                        width: 30,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Icon(Icons.add, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
