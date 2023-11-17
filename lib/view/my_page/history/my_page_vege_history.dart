import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/my_page/history/my_page_farm_history.dart';

class MyPageVegeHistory extends StatefulWidget {
  final String? name;
  final String? veggieName;
  final String? period;
  final String? image;

  const MyPageVegeHistory({
    Key? key,
    required this.name,
    required this.veggieName,
    required this.period,
    required this.image,
  }) : super(key: key);

  @override
  State<MyPageVegeHistory> createState() => _MyPageHistoryState();
}

class _MyPageHistoryState extends State<MyPageVegeHistory> {
  void _navigateToNewPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MyPageList(data: widget.name),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _navigateToNewPage(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 64.0,
              height: 64.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.image ?? ''),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 6.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('${widget.name}',
                          style: FarmusThemeData.darkStyle17),
                      SizedBox(
                        width: 8,
                      ),
                      SvgPicture.asset("assets/image/line_vertical_grey1.svg"),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "${widget.veggieName}",
                        style: FarmusThemeData.darkStyle13,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Text(widget.period!, style: FarmusThemeData.brownText13),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
