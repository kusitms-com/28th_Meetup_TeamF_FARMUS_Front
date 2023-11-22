import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class NewVegetableItem extends StatefulWidget {
  final String blackPath;
  final String colPath;
  final bool isSelected;
  final Function onTap;
  final String veggieName;
  final String difficulty;

  const NewVegetableItem({
    Key? key,
    required this.blackPath,
    required this.colPath,
    required this.isSelected,
    required this.onTap,
    required this.veggieName,
    required this.difficulty,
  }) : super(key: key);

  @override
  State<NewVegetableItem> createState() => _NewVegetableItemState();
}

class _NewVegetableItemState extends State<NewVegetableItem> {


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: widget.isSelected
                        ? FarmusThemeData.green1
                        : FarmusThemeData.pictureBackground
                ),
                borderRadius: BorderRadius.circular(8),
                color: FarmusThemeData.pictureBackground,
              ),
              child: Container(
                alignment: Alignment.center,
                child: widget.isSelected
                    ? Image.network(
                        widget.colPath,
                        width: 80,
                      )
                    : Image.network(
                        widget.blackPath,
                        width: 80,
                      ),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${widget.veggieName}',
                style: FarmusThemeData.darkStyle13,
              ),
              SizedBox(width: 8),
              SvgPicture.asset("assets/image/line_vertical_grey1.svg"),
              SizedBox(width: 8),
              Text(
                '${widget.difficulty}',
                style: FarmusThemeData.darkStyle13,
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
