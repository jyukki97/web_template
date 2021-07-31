import 'package:flutter/material.dart';
import 'package:house_rent_web/models/Rent.dart';
import 'package:house_rent_web/responsive.dart';

import '../../../constants.dart';

class ResultList extends StatelessWidget {
  ResultList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(defaultPadding / 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: defaultPadding,),
          Padding(
            padding: EdgeInsets.only(left: defaultPadding / 2),
            child: Text(
              "1,034 Result",
              style: Theme
                  .of(context)
                  .textTheme
                  .headline6,
            ),
          ),
          SizedBox(height: defaultPadding / 2,),
          Expanded(
            child: ListView.builder(
                scrollDirection: Responsive.isMobile(context) ? Axis.vertical : Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return AspectRatio(
                    aspectRatio: 5 / 4,
                    child: Padding(
                      padding: EdgeInsets.all(defaultPadding / 2),
                      child: Container(
                        padding: EdgeInsets.all(defaultPadding / 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10)),
                                    image: new DecorationImage(
                                      image: new AssetImage(
                                          rentSample[index].thumbnail),
                                      fit: BoxFit.fill,
                                    )
                                ),
                              ),
                            ),
                            SizedBox(height: defaultPadding / 2,),
                            Text(
                              "\$${rentSample[index].price} / month",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .subtitle1,
                            ),
                            SizedBox(height: defaultPadding / 2,),
                            Text(
                              "${rentSample[index]
                                  .beds} Beds, ${rentSample[index]
                                  .baths} Baths, ${rentSample[index].area}평",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: defaultPadding / 2,),
                            Text(
                              rentSample[index].title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }
            ),
          )
        ],
      ),
    );
  }
}