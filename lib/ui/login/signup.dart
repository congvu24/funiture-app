import 'package:another_flushbar/flushbar_helper.dart';
import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/data/sharedpref/constants/preferences.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/stores/form/form_store.dart';
import 'package:boilerplate/stores/theme/theme_store.dart';
import 'package:boilerplate/utils/device/device_utils.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';
import 'package:boilerplate/widgets/app_icon_widget.dart';
import 'package:boilerplate/widgets/empty_app_bar_widget.dart';
import 'package:boilerplate/widgets/my_button.widget.dart';
import 'package:boilerplate/widgets/progress_indicator_widget.dart';
import 'package:boilerplate/widgets/rounded_button_widget.dart';
import 'package:boilerplate/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  //text controllers:-----------------------------------------------------------
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  //stores:---------------------------------------------------------------------
  late ThemeStore _themeStore;

  //focus node:-----------------------------------------------------------------
  late FocusNode _passwordFocusNode;

  //stores:---------------------------------------------------------------------
  final _store = FormStore();

  @override
  void initState() {
    super.initState();
    _passwordFocusNode = FocusNode();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _themeStore = Provider.of<ThemeStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      resizeToAvoidBottomInset: false,
      // appBar: EmptyAppBar(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg-login.png"),
              fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            Opacity(
              opacity: 0.7,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Color(0xff303030),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 10,
              left: 10,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top,
                  right: 20,
                  bottom: 20,
                  left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Container(
                    child: Image.asset("assets/images/logo.png", width: 100),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    "Đăng ký",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 22),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFieldWidget(
                      icon: Icons.email,
                      errorText: "Không hợp lệ",
                      hint: "Email",
                      textController: _passwordController),
                  SizedBox(
                    height: 30,
                  ),
                  TextFieldWidget(
                      icon: Icons.person,
                      errorText: "Không hợp lệ",
                      hint: "Tên đăng nhập",
                      textController: _userEmailController),
                  SizedBox(
                    height: 30,
                  ),
                  TextFieldWidget(
                      icon: Icons.lock,
                      errorText: "Không hợp lệ",
                      hint: "Mật khẩu",
                      textController: _passwordController),
                  SizedBox(
                    height: 60,
                  ),
                  MyButton(callback: () {}, text: "Đăng ký"),
                  SizedBox(
                    height: 30,
                  ),
                  Row(children: [
                    Expanded(
                        child: Divider(
                      color: Colors.white,
                    )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        "Or",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Expanded(
                        child: Divider(
                      color: Colors.white,
                    )),
                  ]),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      buildSocialButton(
                          context, "assets/images/google.png", "Google"),
                      SizedBox(
                        width: 20,
                      ),
                      buildSocialButton(
                          context, "assets/images/facebook.png", "Facebook")
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Dịch vụ & điều khoản",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                  ),
                  SizedBox(height: 50),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded buildSocialButton(BuildContext context, String image, String text) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Row(
          children: [
            Image.asset(image),
            SizedBox(
              width: 10,
            ),
            Text(
              text,
              style:
                  TextStyle(fontSize: 18, color: Theme.of(context).canvasColor),
            )
          ],
        ),
      ),
    );
  }

  // dispose:-------------------------------------------------------------------
  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    _userEmailController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }
}
