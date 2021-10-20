import 'package:flutter/material.dart';

List<String> rooms = [
  "Tất cả",
  "Phòng khách",
  "Phòng ngủ",
  "Phòng bếp",
  "Khác"
];

class ListviewRoom extends StatefulWidget {
  final Function callback;

  const ListviewRoom({Key? key, required this.callback}) : super(key: key);

  @override
  State<ListviewRoom> createState() => _ListviewRoomState();
}

class _ListviewRoomState extends State<ListviewRoom> {
  String active = rooms[0];

  void _handleSelect(int index) {
    setState(() {
      active = rooms[index];
    });
    widget.callback(rooms[index]);
  }

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
          itemCount: rooms.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildCarouselItem(context, index, active == rooms[index]);
          },
        ),
      ),
    );
  }

  Widget _buildCarouselItem(BuildContext context, int index, bool isActive) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: () {
          _handleSelect(index);
        },
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
            rooms[index],
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isActive
                    ? Colors.white
                    : Theme.of(context).canvasColor.withOpacity(0.7)),
          ),
        ),
      ),
    );
  }
}
