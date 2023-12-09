import 'dart:convert';

class AddGoalModel {
  String? goalName;
  String? goalAmount;

  AddGoalModel({
    this.goalName,
    this.goalAmount,
  });

  AddGoalModel copyWith({
    String? goalName,
    String? goalAmount,
  }) =>
      AddGoalModel(
        goalName: goalName ?? this.goalName,
        goalAmount: goalAmount ?? this.goalAmount,
      );

  factory AddGoalModel.fromRawJson(String str) => AddGoalModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddGoalModel.fromJson(Map<String, dynamic> json) => AddGoalModel(
    goalName: json["goalName"],
    goalAmount: json["goalAmount"],

  );

  Map<String, dynamic> toJson() => {
    "goalName": goalName,
    "goalAmount": goalAmount,
  };
}
