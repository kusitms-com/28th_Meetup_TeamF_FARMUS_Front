import 'package:flutter/material.dart';

class CheckboxListItem extends StatelessWidget {
  final String text;
  final bool isChecked;
  final ValueChanged<bool?> onChecked;
  final VoidCallback onKebabTapped;

  const CheckboxListItem({
    Key? key,
    required this.text,
    required this.isChecked,
    required this.onChecked,
    required this.onKebabTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Checkbox(
            value: isChecked,
            onChanged: onChecked,
          ),
          Text(text),
        ],
      ),
      trailing: InkWell(
        onTap: onKebabTapped,
        child: const Icon(Icons.more_vert),
      ),
    );
  }
}

class OtherPage extends StatelessWidget {
  final String text;

  const OtherPage({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('무슨 페이지인지 물어보기'),
      ),
      body: Center(
        child: Text('$text!'),
      ),
    );
  }
}
