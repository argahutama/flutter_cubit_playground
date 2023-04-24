import 'package:flutter/material.dart';

class CatFactListItem extends StatelessWidget {
  final String item;

  const CatFactListItem(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Text(item),
          ),
        ),
      );
}
