import 'package:boilerplate/ui/cart/tracking.screen.dart';
import 'package:boilerplate/ui/chat/chat.screen.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/body_scaffold.widget.dart';
import 'package:boilerplate/widgets/modal/feedback_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  _showFeedback() async {
    await showDialog(context: context, builder: (context) => FeedbackModal());
  }

  @override
  Widget build(BuildContext context) {
    return BodyScaffold(
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            CircleAvatar(
                radius: 28,
                backgroundImage: AssetImage("assets/images/avatar.png")),
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Text(
                  "Vu Duong",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "01223112",
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
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
        )
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
