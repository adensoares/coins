import 'dart:convert';

import 'market_time.dart';

class Company {
  String symbol;
  String name;
  String companyName;
  String document;
  String description;
  String website;
  String region;
  String currency;
  MarketTime marketTime;
  double marketCap;
  double price;
  double changePercent;
  String updatedAt;

  Company({
    required this.symbol,
    required this.name,
    required this.companyName,
    required this.document,
    required this.description,
    required this.website,
    required this.region,
    required this.currency,
    required this.marketTime,
    required this.marketCap,
    required this.price,
    required this.changePercent,
    required this.updatedAt,
  });

  Company copyWith({
    String? symbol,
    String? name,
    String? companyName,
    String? document,
    String? description,
    String? website,
    String? region,
    String? currency,
    MarketTime? marketTime,
    double? marketCap,
    double? price,
    double? changePercent,
    String? updatedAt,
  }) {
    return Company(
      symbol: symbol ?? this.symbol,
      name: name ?? this.name,
      companyName: companyName ?? this.companyName,
      document: document ?? this.document,
      description: description ?? this.description,
      website: website ?? this.website,
      region: region ?? this.region,
      currency: currency ?? this.currency,
      marketTime: marketTime ?? this.marketTime,
      marketCap: marketCap ?? this.marketCap,
      price: price ?? this.price,
      changePercent: changePercent ?? this.changePercent,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'symbol': symbol,
      'name': name,
      'companyName': companyName,
      'document': document,
      'description': description,
      'website': website,
      'region': region,
      'currency': currency,
      'marketTime': marketTime.toMap(),
      'marketCap': marketCap,
      'price': price,
      'changePercent': changePercent,
      'updatedAt': updatedAt,
    };
  }

  factory Company.fromMap(Map<String, dynamic> map) {
    return Company(
      symbol: map['symbol'] ?? '',
      name: map['name'] ?? '',
      companyName: map['company_name'] ?? '',
      document: map['document'] ?? '',
      description: map['description'] ?? '',
      website: map['website'] ?? '',
      region: map['region'] ?? '',
      currency: map['currency'] ?? '',
      marketTime: MarketTime.fromMap(map['market_time']),
      marketCap: map['market_cap']?.toDouble() ?? 0.0,
      price: map['price']?.toDouble() ?? 0.0,
      changePercent: map['change_percent']?.toDouble() ?? 0.0,
      updatedAt: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Company.fromJson(String source) =>
      Company.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Company(symbol: $symbol, name: $name, companyName: $companyName, document: $document, description: $description, website: $website, region: $region, currency: $currency, marketTime: $marketTime, marketCap: $marketCap, price: $price, changePercent: $changePercent, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Company &&
        other.symbol == symbol &&
        other.name == name &&
        other.companyName == companyName &&
        other.document == document &&
        other.description == description &&
        other.website == website &&
        other.region == region &&
        other.currency == currency &&
        other.marketTime == marketTime &&
        other.marketCap == marketCap &&
        other.price == price &&
        other.changePercent == changePercent &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return symbol.hashCode ^
        name.hashCode ^
        companyName.hashCode ^
        document.hashCode ^
        description.hashCode ^
        website.hashCode ^
        region.hashCode ^
        currency.hashCode ^
        marketTime.hashCode ^
        marketCap.hashCode ^
        price.hashCode ^
        changePercent.hashCode ^
        updatedAt.hashCode;
  }
}
