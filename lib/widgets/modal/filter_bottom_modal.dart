import 'package:flutter/material.dart';

List<String> ProductCategory = [
  "Tủ Quần áo",
  "Kệ tủ TV",
  "Sofa",
  "Kệ đựng đồ",
  "Giường",
  "Tủ giày",
  "Tủ đầu giường",
  "Bàn trang điểm",
  "Khác"
];

List<String> StyleCategory = ["Hiện đại", "Cổ điển", "Tối giản", "Retro"];

List<String> PriceCategory = ["0-1 triệu", "1-5 triệu", ">5 triệu"];

class FilterBottomModal extends StatefulWidget {
  final List<String> defaultFitler;
  final Function cb;

  const FilterBottomModal(
      {Key? key, this.defaultFitler = const [], required this.cb})
      : super(key: key);

  @override
  State<FilterBottomModal> createState() => _FilterBottomModalState();
}

class _FilterBottomModalState extends State<FilterBottomModal> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Theme.of(context).primaryColor;
  }

  Set<String> selected = new Set<String>();

  _handleToggle(String value) {
    widget.cb(value);
    if (selected.contains(value))
      setState(() {
        selected.remove(value);
      });
    else
      setState(() {
        selected.add(value);
      });
  }

  @override
  void initState() {
    super.initState();
    selected = widget.defaultFitler.toSet();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.65,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Center(
              child: Container(
                // width: double.infinity,
                height: double.infinity,
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Center(child: Text('Bộ lọc')),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Loại sản phẩm:",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Wrap(
                      children: [
                        ...ProductCategory.map((item) =>
                            buildItem(item, selected.contains(item))).toList()
                      ],
                    ),
                    Text(
                      "Phong cách:",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Wrap(
                      children: [
                        ...StyleCategory.map((item) =>
                            buildItem(item, selected.contains(item))).toList()
                      ],
                    ),
                    Text(
                      "Mức giá:",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Wrap(
                      children: [
                        ...PriceCategory.map((item) =>
                            buildItem(item, selected.contains(item))).toList()
                      ],
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //     TextButton(
                    //         onPressed: () {
                    //           Navigator.of(context).pop([]);
                    //         },
                    //         child: Container(
                    //           padding: EdgeInsets.symmetric(
                    //               vertical: 10, horizontal: 20),
                    //           decoration: BoxDecoration(
                    //               color: Theme.of(context).canvasColor,
                    //               borderRadius:
                    //                   BorderRadius.all(Radius.circular(5))),
                    //           child: Text(
                    //             "Huỷ",
                    //             style: TextStyle(color: Colors.white),
                    //           ),
                    //         )),
                    //     // SizedBox(
                    //     //   width: 10,
                    //     // ),
                    //     TextButton(
                    //         onPressed: () {
                    //           Navigator.of(context).pop(selected.toList());
                    //         },
                    //         child: Container(
                    //           padding: EdgeInsets.symmetric(
                    //               vertical: 10, horizontal: 20),
                    //           decoration: BoxDecoration(
                    //               color: Theme.of(context).primaryColor,
                    //               borderRadius:
                    //                   BorderRadius.all(Radius.circular(5))),
                    //           child: Text(
                    //             "Lọc",
                    //             style: TextStyle(color: Colors.white),
                    //           ),
                    //         ))
                    //   ],
                    // )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildItem(String text, bool isCheck) {
    return InkWell(
      onTap: () {
        _handleToggle(text);
      },
      child: Container(
        width: 150,
        child: Row(
          children: [
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isCheck,
              onChanged: (bool? value) {
                _handleToggle(text);
              },
            ),
            Text(
              text,
              style: TextStyle(fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
