import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oru_app/app/modules/home/utils/products.dart';
import 'package:oru_app/app/modules/home/utils/searchListView.dart';

import '../utils/brand.dart';
import '../utils/load_more.dart';
import '../utils/slider.dart';

List<Widget> homeWidget = [
  const Padding(
    padding: EdgeInsets.all(5.0),
    child: SizedBox(
      height: 20,
      child: Text(
        'Buy Top Brands',
        style: TextStyle(fontWeight: FontWeight.w900, color: Colors.grey),
      ),
    ),
  ),
  Padding(
    padding: const EdgeInsets.only(top: 5, bottom: 5),
    child: buildHorizontalListView(),
  ),
  customSlider(),
  const SizedBox(
    height: 20,
  ),
  const Padding(
    padding: EdgeInsets.all(5.0),
    child: SizedBox(
      height: 20,
      child: Text(
        'Shop by',
        style: TextStyle(fontWeight: FontWeight.w900, color: Colors.grey),
      ),
    ),
  ),
  Padding(
    padding: const EdgeInsets.only(top: 5, bottom: 5),
    child: features(),
  ),
  const Padding(
    padding: EdgeInsets.only(top: 10, left: 5),
    child: SizedBox(
      height: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                'Best Deals Near You ',
                style:
                    TextStyle(fontWeight: FontWeight.w900, color: Colors.grey),
              ),
              Text(
                'India',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.amber,
                    fontSize: 17,
                    decoration: TextDecoration.underline),
              ),
            ],
          ),
          Text("Sort"),
        ],
      ),
    ),
  ),
  productList(),
  loadmore()
];
List<Widget> searchWidgets = [searchListModel()];
