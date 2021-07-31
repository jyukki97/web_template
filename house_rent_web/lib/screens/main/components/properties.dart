import 'package:flutter/material.dart';

import '../../../constants.dart';

class Properties extends StatelessWidget {
  const Properties({
    Key? key,
    required this.title,
    required this.selected,
  }) : super(key: key);

  final String title;
  final int selected;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 12
          ),
        ),
        SizedBox(height: defaultPadding / 2,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for(var i=0;i<5;i++)
              Container(
                width: 45,
                height: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: i == selected ? mainColor : mainColor.withOpacity(0.1),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Text(
                    i == 4 ? "5+" : "${i+1}",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: i == selected ? Colors.white : Colors.grey,
                    fontWeight: FontWeight.bold
                  ),
                ),
              )
          ],
        ),
      ],
    );
  }
}