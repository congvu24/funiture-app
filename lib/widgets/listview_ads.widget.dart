import 'package:flutter/material.dart';

class ListAdsView extends StatelessWidget {
  ListAdsView({Key? key}) : super(key: key);

  final ScrollController controller = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      alignment: Alignment.center,
      child: Stack(
        children: [
          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.builder(
              controller: controller,
              itemBuilder: (BuildContext context, int index) {
                return _buildCarousel(context, index ~/ 2);
              },
            ),
          ),
          Positioned.fill(
            child: Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  child: Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                    size: 30,
                  ),
                )),
          ),
          Positioned.fill(
            child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  child: Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                    size: 30,
                  ),
                )),
          ),
        ],
      ),
    );
  }

  Widget _buildCarousel(BuildContext context, int carouselIndex) {
    return Container(
      height: 150.0,
      child: PageView.builder(
        // controller: PageController(viewportFraction: 0.8),
        itemBuilder: (BuildContext context, int itemIndex) {
          return _buildCarouselItem(context, carouselIndex, itemIndex);
        },
      ),
    );
  }

  Widget _buildCarouselItem(
      BuildContext context, int carouselIndex, int itemIndex) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
    );
  }
}
