import 'dart:convert';

class MarketTime {
  String? open;
  String? close;
  int? timezone;

  MarketTime({
    this.open,
    this.close,
    this.timezone,
  });

  MarketTime copyWith({
    String? open,
    String? close,
    int? timezone,
  }) {
    return MarketTime(
      open: open ?? this.open,
      close: close ?? this.close,
      timezone: timezone ?? this.timezone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'open': open,
      'close': close,
      'timezone': timezone,
    };
  }

  factory MarketTime.fromMap(Map<String, dynamic> map) {
    return MarketTime(
      open: map['open'],
      close: map['close'],
      timezone: map['timezone']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory MarketTime.fromJson(String source) =>
      MarketTime.fromMap(json.decode(source));

  @override
  String toString() =>
      'MarketTime(open: $open, close: $close, timezone: $timezone)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MarketTime &&
        other.open == open &&
        other.close == close &&
        other.timezone == timezone;
  }

  @override
  int get hashCode => open.hashCode ^ close.hashCode ^ timezone.hashCode;
}
