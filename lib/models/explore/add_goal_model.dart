import 'dart:convert';

class AddGoalModel {
  String? goalName;

  AddGoalModel({
    this.goalName,
  });

  AddGoalModel copyWith({
    String? goalName,
  }) =>
      AddGoalModel(
        goalName: goalName ?? this.goalName,
      );

  factory AddGoalModel.fromRawJson(String str) => AddGoalModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddGoalModel.fromJson(Map<String, dynamic> json) => AddGoalModel(
    goalName: json["goalName"],
  );

  Map<String, dynamic> toJson() => {
    "goalName": goalName,
  };
}
