import 'package:boilerplate/stores/user/user_store.dart';
import 'package:boilerplate/ui/cart/tracking.screen.dart';
import 'package:boilerplate/ui/chat/chat.screen.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/body_scaffold.widget.dart';
import 'package:boilerplate/widgets/modal/feedback_modal.dart';
import 'package:boilerplate/widgets/textfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArOption extends StatefulWidget {
  const ArOption({Key? key}) : super(key: key);

  @override
  State<ArOption> createState() => _ArOptionState();
}

class _ArOptionState extends State<ArOption> {
  String room = "Phòng khách";
  int step = 1;
  bool isMale = true;
  // late String height;
  // late String width;
  // late String length;
  // late String name;

  TextEditingController height = new TextEditingController();
  TextEditingController width = new TextEditingController();
  TextEditingController length = new TextEditingController();
  TextEditingController name = new TextEditingController();
  TextEditingController fullname = new TextEditingController();
  TextEditingController dob = new TextEditingController();

  @override
  void initState() {
    super.initState();
    step = 1;
  }

  @override
  Widget build(BuildContext context) {
    return BodyScaffold(
      resizeToAvoidBottomInset: false,
      children: [
        Center(
          child: Container(
            child: Text(
              "Mô hình 3D",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).primaryColor),
            ),
          ),
        ),
        if (step == 1)
          Column(
            children: [
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    step = 2;
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: 250,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                        image: AssetImage("assets/images/create-room.jpg"),
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.6), BlendMode.srcOver),
                        fit: BoxFit.cover),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_circle_outline_outlined,
                        size: 60,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Tạo căn phòng 3D",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 250,
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Theme.of(context).canvasColor,
                  image: DecorationImage(
                      image: AssetImage("assets/images/my-room.jpg"),
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.6), BlendMode.srcOver),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera_indoor_rounded,
                      size: 60,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Mô phỏng căn phòng của tôi",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        if (step == 2)
          Column(
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Loại phòng:",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(' *',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w500,
                                fontSize: 18))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 300,
                      child: GridView.count(
                        padding: EdgeInsets.zero,
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        children: [
                          buildRoomItem(
                              "Phòng khách", "assets/images/livingroom.jpg"),
                          buildRoomItem(
                              "Phòng ngủ", "assets/images/bedroom.jpg"),
                          buildRoomItem(
                              "Phòng bếp", "assets/images/kitchen.jpg"),
                          buildRoomItem(
                              "Phòng tắm", "assets/images/bathroom.jpg"),
                          buildRoomItem(
                              "Thư viện", "assets/images/library.jpg"),
                          buildRoomItem("Khác", "assets/images/other.jpg")
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Kích thước:",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(' *',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w500,
                                fontSize: 18))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    buildInput("Tên phòng", controller: name),
                    SizedBox(
                      height: 10,
                    ),
                    buildInput("Chiều dài", isNumber: true, controller: length),
                    SizedBox(
                      height: 10,
                    ),
                    buildInput("Chiều rộng", isNumber: true, controller: width),
                    SizedBox(
                      height: 10,
                    ),
                    buildInput("Chiều cao", isNumber: true, controller: height),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      step = 3;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Text(
                      "Tiếp tục",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      step = 1;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      "Quay lại",
                      style: TextStyle(
                          color: Theme.of(context).canvasColor, fontSize: 16),
                    ),
                  ),
                ),
              )
            ],
          ),
        if (step == 3)
          Column(
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Phong thuỷ:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    buildInput("Họ và tên", controller: fullname),
                    SizedBox(
                      height: 10,
                    ),
                    buildInput("Ngày sinh", controller: dob),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      child: Row(
                        children: [
                          Row(
                            children: [
                              Radio(
                                onChanged: (value) {
                                  setState(() {
                                    isMale = true;
                                  });
                                },
                                groupValue: true,
                                value: isMale == true,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("Nam")
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Row(
                            children: [
                              Radio(
                                onChanged: (value) {
                                  setState(() {
                                    isMale = false;
                                  });
                                },
                                groupValue: false,
                                value: isMale == true,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("Nữ")
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text(
                    "Bắt đầu",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      step = 2;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      "Quay lại",
                      style: TextStyle(
                          color: Theme.of(context).canvasColor, fontSize: 16),
                    ),
                  ),
                ),
              )
            ],
          )
      ],
    );
  }

  Widget buildInput(
    String text, {
    bool isNumber = false,
    required TextEditingController controller,
  }) =>
      Container(
        width: double.infinity,
        height: 50,
        child: TextField(
            controller: controller,
            style: Theme.of(context).textTheme.bodyText1,
            autofocus: false,
            keyboardType: isNumber ? TextInputType.number : TextInputType.text,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                    color: Theme.of(context).canvasColor, width: 1.0),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              hintText: text,
              suffixText: isNumber ? "m" : null,
              suffixStyle: TextStyle(color: Theme.of(context).canvasColor),
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Theme.of(context).canvasColor),
              counterText: '',
            )),
      );

  Widget buildRoomItem(String name, String image) {
    bool isChecked = room == name;
    return InkWell(
      onTap: () {
        setState(() {
          room = name;
        });
      },
      child: Opacity(
        opacity: isChecked ? 1 : 0.5,
        child: Container(
          padding: EdgeInsets.all(10),
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            image: DecorationImage(
                image: AssetImage(image),
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4), BlendMode.srcOver),
                fit: BoxFit.cover),
          ),
          child: Text(
            name,
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
