import 'package:flutter/material.dart';

import '../../../constants.dart';

class Amenities extends StatefulWidget {
  const Amenities({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  _AmenitiesState createState() => _AmenitiesState();
}

class _AmenitiesState extends State<Amenities> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
            color: Colors.grey,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        Checkbox(
            value: _isChecked,
            activeColor: mainColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))
            ),
            onChanged: (value) {
              setState(() {
                _isChecked = value!;
              });
            }
        )
      ],
    );
  }
}