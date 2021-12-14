import 'package:boilerplate/stores/user/user_store.dart';
import 'package:boilerplate/ui/cart/tracking.screen.dart';
import 'package:boilerplate/ui/chat/chat.screen.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/body_scaffold.widget.dart';
import 'package:boilerplate/widgets/modal/feedback_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  _showFeedback() async {
    await showDialog(context: context, builder: (context) => FeedbackModal());
  }

  late UserStore _userStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _userStore = Provider.of<UserStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    // if (_userStore.isLoggedIn == false) return BodyScaffold(

    // );
    return BodyScaffold(
      children: [
        SizedBox(
          height: 10,
        ),
        if (_userStore.isLoggedIn == false)
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Đăng nhập đột phá mọi trải nghiệm!"),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true)
                          .pushReplacementNamed(Routes.login);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Theme.of(context).primaryColor),
                      child: Text(
                        "Đăng nhập / Đăng ký",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ))
              ],
            ),
          ),

        if (_userStore.isLoggedIn == true)
          Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: Theme.of(context).primaryColor,
                child: const Text(
                  'T',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Text(
                    _userStore.profile.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    _userStore.profile.phone,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).canvasColor),
                  )
                ],
              )
            ],
          ),

        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildRowItem("3", "Yêu thích\ncủa tôi", () {}),
            buildRowItem("2", "Đơn hàng\nvận chuyển", () {
              pushNewScreenWithRouteSettings(
                context,
                settings: RouteSettings(name: Routes.tracking),
                screen: TrackingScreen(),
                withNavBar: false,
              );
            }),
            buildRowItem("1", "Đơn hàng\nthành công", () {})
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          "Đơn hàng của tôi:",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 70,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          "Thông tin tài khoản:",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildAccountInfoItem("assets/images/profile.svg", "Địa chỉ", () {}),
            buildAccountInfoItem("assets/images/card.svg", "Thanh toán", () {}),
            buildAccountInfoItem("assets/images/feedback.svg", "Feedback", () {
              _showFeedback();
            }),
            buildAccountInfoItem("assets/images/chat.svg", "Tin nhắn", () {
              // Navigator.of(context).pushNamed(Routes.chat);
              pushNewScreenWithRouteSettings(
                context,
                settings: RouteSettings(name: Routes.chat),
                screen: ChatScreen(),
                withNavBar: false,
              );
            }),
          ],
        ),
        // Spacer(),
        SizedBox(
          height: 20,
        ),
        Text(
          "Khuyến mãi:",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 70,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        SizedBox(
          height: 100,
        ),
        if (_userStore.isLoggedIn == true)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  _userStore.logout();
                  Navigator.of(context, rootNavigator: true)
                      .pushReplacementNamed(Routes.login);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 200,
                  padding: EdgeInsets.symmetric(vertical: 18, horizontal: 40),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Theme.of(context).canvasColor)),
                  child: Text(
                    "Đăng xuất",
                    style: TextStyle(
                        color: Theme.of(context).canvasColor, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }

  Widget buildRowItem(String number, String text, Function callback) {
    return InkWell(
      onTap: () {
        callback();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            number,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }

  Widget buildAccountInfoItem(String image, String text, Function callback) {
    return InkWell(
      onTap: () {
        callback();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(image),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
