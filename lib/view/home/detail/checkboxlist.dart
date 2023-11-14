import 'package:flutter/material.dart';
import 'package:mojacknong_android/view/home/detail/checkboxitem.dart';

class CheckboxList extends StatefulWidget {
  final List<String> items;

  const CheckboxList({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  _CheckboxListState createState() => _CheckboxListState();
}

class _CheckboxListState extends State<CheckboxList> {
  List<bool> checkboxStates = [];

  @override
  void initState() {
    super.initState();
    checkboxStates = List.generate(widget.items.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    // Wrap ListView.builder with an Expanded widget
    return Expanded(
      child: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          return CheckboxListItem(
            text: widget.items[index],
            isChecked: checkboxStates[index],
            onChecked: (bool? value) {
              setState(() {
                checkboxStates[index] = value ?? false;
              });
            },
            onKebabTapped: () {
              // Define the navigation logic
            },
          );
        },
      ),
    );
  }
}
