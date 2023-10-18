class RatingModel {

  RatingModel({
    required this.rate,
    required this.count,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
        rate: json['rate'],
        count: json['count'],
      );
  final num rate;
  final num count;

  Map<String, dynamic> toJson() => {
    'rate' : rate,
    'count' : count,
  };
}
