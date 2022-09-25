import 'package:ass_cr_dashboard/constants/color_constants.dart';
import 'package:ass_cr_dashboard/models/coin.dart';
import 'package:flutter/material.dart';

class CoinListTile extends StatelessWidget {
  final Coin coin;
  const CoinListTile({Key? key, required this.coin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: coin.name,
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(
                                  color: ColorConstants.titleTextColor,
                                  fontSize: 20),
                        ),
                        const WidgetSpan(
                            child: SizedBox(
                          width: 20,
                        )),
                        WidgetSpan(
                          child: getPercentageChangeIcon() ?? const SizedBox(),
                        ),
                        TextSpan(
                            text: coin.quote?.uSD?.percentChange24h
                                    ?.abs()
                                    .toStringAsFixed(2) ??
                                '',
                            style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                  ),
                  Card(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 2),
                      child: Center(
                        child: Text(
                          coin.symbol ?? '',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    "Price  \$${coin.quote?.uSD?.price?.toStringAsFixed(2) ?? ''}",
                    style: Theme.of(context).textTheme.bodySmall),
                Text("Rank ${coin.cmcRank ?? ''}",
                    style: Theme.of(context).textTheme.bodySmall),
                Ink(
                  decoration: const ShapeDecoration(
                    color: ColorConstants.titleTextColor,
                    shape: CircleBorder(),
                  ),
                  width: 22,
                  height: 22,
                  child: Center(
                    child: IconButton(
                      padding: const EdgeInsets.all(0),
                      icon: const Icon(Icons.arrow_forward_rounded),
                      iconSize: 15,
                      color: Colors.black,
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget? getPercentageChangeIcon() {
    double percentage = coin.quote?.uSD?.percentChange24h ?? 0;
    if (percentage == 0) {
      return null;
    } else if (percentage > 0) {
      return const Icon(
        Icons.arrow_upward,
        size: 16,
        color: Colors.green,
      );
    } else {
      return const Icon(
        Icons.arrow_downward,
        size: 16,
        color: Colors.red,
      );
    }
  }
}
