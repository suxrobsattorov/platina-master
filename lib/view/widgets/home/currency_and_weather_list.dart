import 'package:flutter/material.dart';
import 'package:platina/controller/providers/currencies.dart';
import 'package:platina/controller/providers/weathers.dart';
import 'package:platina/model/currency.dart';
import 'package:platina/model/weather.dart';
import 'package:platina/view/constants/icons.dart';
import 'package:platina/view/widgets/home/currency_item.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';

// ignore: must_be_immutable
class CurrencyAndWeatherList extends StatefulWidget {
  CurrencyAndWeatherList({super.key});

  @override
  State<CurrencyAndWeatherList> createState() => _CurrencyAndWeatherListState();
}

class _CurrencyAndWeatherListState extends State<CurrencyAndWeatherList> {
  bool onTabCurrency = false;

  @override
  Widget build(BuildContext context) {
    List<Currency> currencyList = Provider.of<Currencies>(context).response;
    Temperatures weather = Provider.of<Weathers>(context).response;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              currencyList.length != 0
                  ? InkWell(
                      onTap: () {
                        onTabCurrency == false
                            ? onTabCurrency = true
                            : onTabCurrency = false;
                        setState(() {});
                      },
                      child: CurrencyItem(
                        currency: currencyList[0],
                        image: AssetsIcons.usd,
                      ),
                    )
                  : Container(),
              // ignore: unnecessary_null_comparison
              weather != null
                  ? Row(
                      children: [
                        Image.asset(
                          AssetsIcons.weather,
                          height: 20,
                          width: 20,
                        ),
                        SizedBox(width: 5),
                        Text(
                          '${weather.list[0].main.temp.toString()} ℃',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: AppColors.mainColor,
                          ),
                        )
                      ],
                    )
                  : Container(),
            ],
          ),
        ),
        onTabCurrency == true
            ? Column(
                children: [
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CurrencyItem(
                          currency: currencyList[1],
                          image: AssetsIcons.eur,
                        ),
                        CurrencyItem(
                          currency: currencyList[2],
                          image: AssetsIcons.rub,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              )
            : Container(),
      ],
    );
  }
}
