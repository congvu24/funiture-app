import 'package:boilerplate/data/local/datasources/product/product_datasource.dart';
import 'package:boilerplate/di/components/service_locator.dart';
import 'package:boilerplate/models/product/Product.model.dart';
import 'package:boilerplate/ui/cart/item.screen.dart';
import 'package:boilerplate/ui/service/design.screen.dart';
import 'package:boilerplate/ui/service/manufactory.screen.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/body_scaffold.widget.dart';
import 'package:boilerplate/widgets/listview_ads.widget.dart';
import 'package:boilerplate/widgets/listview_room.widget.dart';
import 'package:boilerplate/widgets/modal/filter_bottom_modal.dart';
import 'package:boilerplate/widgets/modal/product_filter_modal.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'dart:math';

Random random = new Random();

// final moneyFormater = NumberFormat.decimalPattern();
final moneyFormater = NumberFormat.simpleCurrency(locale: "vi_Vi", name: "VND");

shuffle(List<Product> array) {
  int currentIndex = array.length;
  int randomIndex;

  // While there remain elements to shuffle...
  while (currentIndex != 0) {
    // Pick a remaining element...
    randomIndex = random.nextInt(currentIndex);
    currentIndex--;

    // And swap it with the current element.
    Product temp = array[randomIndex];
    array[randomIndex] = array[currentIndex];
    array[currentIndex] = temp;
  }

  return array;
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Product> data = getIt<ProductDataSource>().getData();
  List<Product> currentData = [];
  List<String> filterCategory = [];
  String filterRoom = rooms[0];

  @override
  void initState() {
    super.initState();
    currentData = data;
  }

  _handleFilterChange(value) {
    if (filterCategory.contains(value))
      setState(() {
        filterCategory.remove(value);
      });
    else
      setState(() {
        filterCategory.add(value);
      });
  }

  // void _openFilter() async {
  //   List<String> result = await showDialog(
  //       context: context,
  //       builder: (context) =>
  //           ProductFilterModal(defaultFitler: filterCategory));
  //   if (result.length > 0)
  //     setState(() {
  //       currentData =
  //           data.where((element) => result.contains(element.category)).toList();
  //       filterCategory = result;
  //     });
  //   else
  //     setState(() {
  //       currentData = data;
  //       filterCategory = [];
  //     });
  // }

  void handleFilterRoom(String value) {
    setState(() {
      filterRoom = value;
    });
    if (value != "Tất cả") {
      setState(() {
        currentData = data.where((element) => element.room == value).toList();
        filterCategory = [];
      });
    } else
      setState(() {
        currentData = data;
        filterCategory = [];
      });
  }

  void _openFilter(context) async {
    await showModalBottomSheet(
        context: context,
        useRootNavigator: true,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return FilterBottomModal(
              defaultFitler: filterCategory, cb: _handleFilterChange);
        });

    if (filterCategory.length > 0)
      setState(() {
        currentData = data
            .where((element) => filterCategory.contains(element.category))
            .toList();
        if (currentData.length == 0) currentData = data;
      });
    else
      setState(() {
        currentData = data;
        filterCategory = [];
      });
  }

  @override
  Widget build(BuildContext context) {
    return BodyScaffold(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Khám phá\nNội thất mới",
              style: TextStyle(
                  color: Theme.of(context).secondaryHeaderColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                InkWell(
                  child: Icon(Icons.search, color: Color(0xff200E32), size: 30),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context, rootNavigator: true)
                        .pushNamed(Routes.cart);
                  },
                  child: Icon(Icons.shopping_cart_outlined,
                      color: Color(0xff200E32), size: 30),
                )
              ],
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        ListAdsView(),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  pushNewScreenWithRouteSettings(
                    context,
                    settings: RouteSettings(name: Routes.design),
                    screen: DesignScreen(),
                    withNavBar: false,
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  height: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    image: DecorationImage(
                        image: AssetImage("assets/images/design.jpg"),
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.4), BlendMode.srcOver),
                        fit: BoxFit.cover),
                  ),
                  child: Text(
                    "Thiết kế bản vẽ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  pushNewScreenWithRouteSettings(
                    context,
                    settings: RouteSettings(name: Routes.manufactory),
                    screen: ManufactoryScreen(),
                    withNavBar: false,
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  height: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    image: DecorationImage(
                        image: AssetImage("assets/images/manufactory.jpg"),
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.4), BlendMode.srcOver),
                        fit: BoxFit.cover),
                  ),
                  child: Text(
                    "Gia công nội thất",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        ListviewRoom(
          callback: handleFilterRoom,
        ),
        SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {
            _openFilter(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Bộ lọc",
                style: TextStyle(
                    color: Theme.of(context).canvasColor, fontSize: 13),
              ),
              InkWell(
                child: Icon(Icons.filter_alt_rounded,
                    color: Theme.of(context).canvasColor),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        if (filterRoom == "Tất cả")
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Sản phẩm bán chạy:",
                  style: TextStyle(
                      color: Theme.of(context).secondaryHeaderColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
              ProductList(data: data.sublist(0, 4)),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Danh mục:",
                  style: TextStyle(
                      color: Theme.of(context).secondaryHeaderColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
              ProductList(
                data: currentData,
              ),
              ProductList(
                data: currentData,
              ),
              ProductList(
                data: currentData,
              ),
              ProductList(
                data: currentData,
              ),
              ProductList(
                data: currentData,
              )
            ],
          )
        else
          Column(
            children: [
              ProductList(
                data: currentData,
              ),
            ],
          )
      ],
    );
  }
}

class ProductList extends StatelessWidget {
  final List<Product> data;

  const ProductList({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Product> shuffled = shuffle(data);
    List<Widget> widgets = [];

    for (int i = 0; i < shuffled.length; i = i + 2) {
      if (i + 1 < shuffled.length) {
        widgets.add(buildRow(shuffled[i], shuffled[i + 1]));
      } else {
        widgets.add(buildRow(shuffled[i], null));
      }
    }
    if (widgets.length > 0) return Column(children: [...widgets]);

    return Center(
        child: Text(
      "Không có sản phẩm nào!",
      style: TextStyle(color: Theme.of(context).canvasColor),
    ));
  }

  Widget buildRow(Product item1, Product? item2) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Expanded(child: ProductItem(item: item1)),
          SizedBox(
            width: 20,
          ),
          if (item2 != null) Expanded(child: ProductItem(item: item2)),
          if (item2 == null) Expanded(child: Container()),
        ],
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final Product item;

  const ProductItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int randomNumber = random.nextInt(1);

    return InkWell(
      onTap: () {
        pushNewScreenWithRouteSettings(
          context,
          settings: RouteSettings(name: Routes.item),
          screen: ItemScreen(
            product: item,
          ),
          withNavBar: false,
        );
      },
      child: Container(
        height: 260,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border:
              Border.all(color: Theme.of(context).canvasColor.withOpacity(0.5)),
        ),
        child: Column(
          children: [
            Container(
                height: 180,
                clipBehavior: Clip.hardEdge,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child:
                    Image.asset(item.images[randomNumber], fit: BoxFit.fill)),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              item.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                          Spacer(),
                          Text(
                            moneyFormater.format(item.price),
                            style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).primaryColor),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
