import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtonToSearch extends StatelessWidget {
  const ButtonToSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SvgPicture.asset("assets/image/ic_button_to_search.svg"),
        ],
      ),
    );
  }
}
