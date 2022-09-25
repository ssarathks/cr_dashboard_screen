import 'package:ass_cr_dashboard/constants/color_constants.dart';
import 'package:ass_cr_dashboard/constants/theme_constants.dart';
import 'package:ass_cr_dashboard/network/coin_network.dart';
import 'package:ass_cr_dashboard/providers/coins/coins_provider.dart';
import 'package:ass_cr_dashboard/widgets/coins/coin_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    getAllCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "CoinRich",
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ThemeConstants.scaffoldHorizontalPadding),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.pie_chart_outline,
                      color: ColorConstants.titleTextColor,
                    ),
                    label: const Text(
                      'Show Chart',
                      style: TextStyle(color: ColorConstants.titleTextColor),
                    )),
                Consumer<CoinsProvider>(builder: (_, coinModal, child) {
                  return Text("Count: ${coinModal.coins.length}");
                })
              ],
            ),
            Expanded(
                child: Consumer<CoinsProvider>(builder: (_, coinModal, child) {
              return coinModal.coins.isNotEmpty
                  ? ListView.builder(
                      itemBuilder: (ctx, index) =>
                          CoinListTile(coin: coinModal.coins[index]),
                      itemCount: coinModal.coins.length,
                    )
                  : const SizedBox();
            }))
          ],
        ),
      ),
    );
  }

  Future<void> getAllCoins() async {
    CoinsProvider coinsProvider =
        Provider.of<CoinsProvider>(context, listen: false);
    CoinNetwork.getAllCoins().then((res) {
      coinsProvider.setCoins(res);
    }).catchError((e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Error fetching coins")));
    });
  }
}
