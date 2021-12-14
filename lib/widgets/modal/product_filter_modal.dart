import 'package:boilerplate/widgets/my_button.widget.dart';
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

class ProductFilterModal extends StatefulWidget {
  final List<String> defaultFitler;

  ProductFilterModal({Key? key, this.defaultFitler = const []})
      : super(key: key);

  @override
  _ProductFilterModalState createState() => _ProductFilterModalState();
}

class _ProductFilterModalState extends State<ProductFilterModal> {
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

  @override
  void initState() {
    super.initState();
    selected = widget.defaultFitler.toSet();
  }

  _handleToggle(String value) {
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
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: EdgeInsets.all(10),
      children: [
        Center(
            child: Text(
          "Bộ lọc",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        )),
        Container(
          // height: 300,
          child: Column(
            children: [
              ...ProductCategory.map(
                  (item) => buildItem(item, selected.contains(item))).toList()
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop([]);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                      color: Theme.of(context).canvasColor,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Text(
                    "Huỷ",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
            // SizedBox(
            //   width: 10,
            // ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(selected.toList());
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Text(
                    "Lọc",
                    style: TextStyle(color: Colors.white),
                  ),
                ))
          ],
        )
      ],
    );
  }

  Widget buildItem(String text, bool isCheck) {
    return InkWell(
      onTap: () {
        _handleToggle(text);
      },
      child: Container(
        // margin: EdgeInsets.symmetric(vertical: 5),
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
            )
          ],
        ),
      ),
    );
  }
}
