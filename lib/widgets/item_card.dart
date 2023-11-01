import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../utils/defaultValues.dart';
import '../../../utils/styles.dart';

// ignore: must_be_immutable
class ItemCard extends StatefulWidget {
  ItemCard(
      {super.key,
      required this.image,
      required this.name,
      required this.date,
      required this.contact,
      required this.liked});

  final String image;
  final String name;
  final String date;
  final String contact;
  bool liked;

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Container(
          width: 200,
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            //shape: BoxShape.,
            image: DecorationImage(
                image: AssetImage(widget.image), fit: BoxFit.fill),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(120, 20, 0, 0),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: DefaultValues.mainBackgroundColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: IconButton(
                    onPressed: () => {
                      setState(() => {
                            if (widget.liked == true)
                              {widget.liked = false}
                            else
                              {widget.liked = true}
                          })
                    },
                    icon: const Icon(Icons.favorite),
                    color: widget.liked == true ? Colors.red : Colors.white,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => {},
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: DefaultValues.mainPrimaryColor),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.name,
                            style: ThemeStyling.regular_14,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              const Icon(Icons.calendar_month_outlined,
                                  size: 14,
                                  color: DefaultValues.mainBackgroundColor),
                              SizedBox(
                                width: 5,
                              ),
                              Text(widget.date, style: ThemeStyling.regular_14)
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.location_pin,
                                      size: 12,
                                      color: DefaultValues.mainBackgroundColor),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(widget.contact,
                                      style: ThemeStyling.regular_14)
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
