import 'package:flutter/material.dart';

class ListviewRoom extends StatelessWidget {
  const ListviewRoom({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      alignment: Alignment.center,
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return _buildCarouselItem(context, index, index == 0);
          },
        ),
      ),
    );
  }

  Widget _buildCarouselItem(
      BuildContext context, int carouselIndex, bool isActive) {
    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: Container(
        padding: EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: isActive ? Theme.of(context).primaryColor : Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            border: Border.all(
                color: isActive
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).canvasColor.withOpacity(0.7),
                width: 1)),
        child: Text(
          "Phòng khách",
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isActive
                  ? Colors.white
                  : Theme.of(context).canvasColor.withOpacity(0.7)),
        ),
      ),
    );
  }
}
