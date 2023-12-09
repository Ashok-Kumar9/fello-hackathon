import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fello/models/explore/add_goal_model.dart';

part 'add_goal_state.dart';

class AddGoalCubit extends Cubit<AddGoalState> {
  AddGoalCubit() : super(AddGoalState.initial());

  Future<void> goalNameAdded(String goalName) async {
    AddGoalModel addGoalModel = AddGoalModel(goalName: goalName);
    emit(state.copyWith(
        status: AddGoalStatus.goalNameAdded, addGoalModel: addGoalModel));
  }
}
