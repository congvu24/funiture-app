import 'package:flutter/material.dart';

class Ads {
  final String image;

  Ads(this.image);
}

List<Ads> ads = [
  new Ads("assets/images/banner1.jpg"),
  new Ads("assets/images/banner2.jpg"),
  new Ads("assets/images/banner3.jpg"),
  new Ads("assets/images/banner4.jpg"),
];

class ListAdsView extends StatefulWidget {
  const ListAdsView({Key? key}) : super(key: key);

  @override
  State<ListAdsView> createState() => _ListviewRoomState();
}

class _ListviewRoomState extends State<ListAdsView> {
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 190,
      alignment: Alignment.center,
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          controller: PageController(viewportFraction: 0.98),
          itemCount: ads.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildCarouselItem(context, index);
          },
        ),
      ),
    );
  }

  Widget _buildCarouselItem(BuildContext context, int index) {
    return Padding(
      padding: EdgeInsets.only(right: 5),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.topLeft,
          width: MediaQuery.of(context).size.width * 85,
          height: 190,
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(5)),
              image: DecorationImage(
                image: AssetImage(ads[index].image),
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0), BlendMode.srcOver),
                fit: BoxFit.cover,
              ),
              border: Border.all(
                  color: Theme.of(context).canvasColor.withOpacity(0.7),
                  width: 1)),
        ),
      ),
    );
  }
}
