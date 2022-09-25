import 'dart:io';

import 'package:ass_cr_dashboard/constants/api_constants.dart';
import 'package:ass_cr_dashboard/constants/network_constants.dart';
import 'package:ass_cr_dashboard/models/coin.dart';
import 'package:dio/dio.dart';

class CoinNetwork {
  Dio dio = dioClient;
  static Future getAllCoins() async {
    try {
      Response response = await dioClient.get(CoinApis.GET_ALL_COINS);

      if (response.statusCode == 200) {
        Map responseCoins = response.data['data'] ?? {};
        List<Coin> coins = [];
        responseCoins.forEach((key, value) {
          coins.add(Coin.fromJson(value));
        });
        return coins;
      } else {
        throw const HttpException("Error fetching coins");
      }
    } on DioError catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
