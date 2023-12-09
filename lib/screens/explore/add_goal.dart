import 'package:fello/bloc/Explore/add_goal_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/explore/add_goal_model.dart';

class AddGoalScreen extends StatefulWidget {
  const AddGoalScreen({super.key});

  @override
  State<AddGoalScreen> createState() => _AddGoalScreenState();
}

class _AddGoalScreenState extends State<AddGoalScreen> {
  AddGoalModel addGoalModel = AddGoalModel();
  List<String> goalList = [
    "Iphone",
    "Macbook",
    "Car",
    "House",
    "Bike",
    "PS5",
    "Travel",
    "Education",
    "Business",
    "Other"
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddGoalCubit, AddGoalState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
          ),
          body: (state.status == AddGoalStatus.initial)
              ? initialBody(context)
              : goalNameAddedBody(context),
          floatingActionButton:
              FloatingActionButton(
                  onPressed: () {
                    if(state.status == AddGoalStatus.initial) {
                      BlocProvider.of<AddGoalCubit>(context)
                        .goalNameAdded(addGoalModel.goalName ?? "Iphone");
                    } else if(state.status == AddGoalStatus.goalNameAdded) {
                      BlocProvider.of<AddGoalCubit>(context)
                        .goalAmountAdded(addGoalModel.goalAmount ?? "1000");
                    }
                  },
                  backgroundColor: Theme.of(context).primaryColor,
                  child: const Icon(Icons.arrow_forward),
                )
             ,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        );
      },
    );
  }

  goalNameAddedBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // large text where you want to invest
          Text(
            'How much do you want to invest?',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 8.0),
          Text(
            'Select a goal to get started',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.grey),
          ),
          const SizedBox(height: 18.0),
          TextField(
            decoration: InputDecoration(
              hintStyle: Theme.of(context).textTheme.bodyLarge,
              labelStyle: Theme.of(context).textTheme.bodyLarge,
              filled: false,
              hintText: 'Enter your goal',
              prefixStyle: Theme.of(context).textTheme.bodyLarge,
              prefixIcon: const Icon(Icons.account_balance_wallet_outlined),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).textTheme.bodyLarge!.color!,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).textTheme.bodyLarge!.color!,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              errorStyle: const TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
              hintMaxLines: 1,
            ),
            onChanged: (value) {
              addGoalModel.goalName = value;
            },
          ),
          const SizedBox(height: 18.0),
        ],
      ),
    );
  }

  Padding initialBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // large text where you want to invest
          Text(
            'Where do you want to invest?',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 8.0),
          Text(
            'Select a goal to get started',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.grey),
          ),
          const SizedBox(height: 18.0),
          TextField(
            decoration: InputDecoration(
              hintStyle: Theme.of(context).textTheme.bodyLarge,
              labelStyle: Theme.of(context).textTheme.bodyLarge,
              filled: false,
              hintText: 'Enter your goal',
              prefixStyle: Theme.of(context).textTheme.bodyLarge,
              prefixIcon: const Icon(Icons.account_balance_wallet_outlined),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).textTheme.bodyLarge!.color!,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).textTheme.bodyLarge!.color!,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              errorStyle: const TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
              hintMaxLines: 1,
            ),
            onChanged: (value) {
              addGoalModel.goalName = value;
            },
          ),
          const SizedBox(height: 18.0),
          Wrap(
            spacing: 12.0,
            runSpacing: 12.0,
            children: List<Widget>.generate(
              goalList.length,
              (int index) {
                return ChoiceChip(
                  labelPadding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 8.0),
                  label: Text(goalList[index]),
                  selected: addGoalModel.goalName == goalList[index],
                  onSelected: (bool selected) {
                    setState(() {
                      addGoalModel.goalName = goalList[index];
                    });
                  },
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}
