part of 'add_goal_cubit.dart';

enum AddGoalStatus { initial, goalNameAdded, goalAmountAdded, failure }

class AddGoalState extends Equatable {
  final AddGoalStatus status;
  final AddGoalModel? addGoalModel;
  const AddGoalState({required this.status, required this.addGoalModel});

  factory AddGoalState.initial() =>
      const AddGoalState(status: AddGoalStatus.initial, addGoalModel: null);

  @override
  List<Object?> get props => [status, addGoalModel];

  @override
  String toString() => 'AddGoalInitial { status: $status }, addGoalModel: $addGoalModel';

  AddGoalState copyWith({
    AddGoalStatus? status,
    AddGoalModel? addGoalModel,
  }) {
    return AddGoalState(
      status: status ?? this.status,
      addGoalModel: addGoalModel ?? this.addGoalModel,
    );
  }
}
