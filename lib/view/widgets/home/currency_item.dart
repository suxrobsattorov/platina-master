import 'package:flutter/material.dart';
import 'package:platina/model/currency.dart';
import 'package:platina/view/constants/colors.dart';
import 'package:platina/view/constants/icons.dart';

// ignore: must_be_immutable
class CurrencyItem extends StatelessWidget {
  String image;
  Currency currency;

  CurrencyItem({
    super.key,
    required this.currency,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 20,
            width: 20,
          ),
          SizedBox(width: 5),
          Text(
            currency.ccy,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.mainColor,
            ),
          ),
          SizedBox(width: 5),
          Text(
            currency.rate,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: double.parse(currency.diff) < 0 ? Colors.red : Colors.green,
            ),
          ),
          SizedBox(width: 5),
          Image.asset(
            double.parse(currency.diff) < 0
                ? AssetsIcons.bottom
                : AssetsIcons.top,
            height: 16,
            width: 16,
            color: double.parse(currency.diff) < 0 ? Colors.red : Colors.green,
          ),
        ],
      ),
    );
  }
}
