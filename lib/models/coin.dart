class Coin {
  int? id;
  String name = '';
  String? symbol;
  int? cmcRank;
  Quote? quote;

  Coin({this.id, this.name = '', this.symbol, this.quote, this.cmcRank});

  Coin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] ?? '';
    symbol = json['symbol'];
    cmcRank = json['cmc_rank'];
    quote = json['quote'] != null ? new Quote.fromJson(json['quote']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['symbol'] = this.symbol;
    data['cmc_rank'] = this.cmcRank;
    if (this.quote != null) {
      data['quote'] = this.quote!.toJson();
    }
    return data;
  }
}

class Quote {
  USD? uSD;

  Quote({this.uSD});

  Quote.fromJson(Map<String, dynamic> json) {
    uSD = json['USD'] != null ? new USD.fromJson(json['USD']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.uSD != null) {
      data['USD'] = this.uSD!.toJson();
    }
    return data;
  }
}

class USD {
  double? price;
  double? percentChange24h;

  USD({this.price, this.percentChange24h});

  USD.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    percentChange24h = json['percent_change_24h'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['percent_change_24h'] = this.percentChange24h;
    return data;
  }
}
