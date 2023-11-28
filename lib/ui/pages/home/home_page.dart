import 'package:cars/blocs/app_bloc.dart';
import 'package:cars/blocs/app_events.dart';
import 'package:cars/blocs/app_state.dart';
import 'package:cars/data/models/user_model.dart';
import 'package:cars/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(
        RepositoryProvider.of<UserRepository>(context),
      )..add(LoadUserEvent()),
      child: Scaffold(
          body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        if (state is UserLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is UserLoadedState) {
          List<UserModel> userList = state.users;
          return CustomScrollView(
            slivers: [
              SliverAppBar(
            title: Text('Test'),
            floating: true,
          ),
          SliverList(delegate: delegate)
            ],
          )
        }

        return Container();
      })),
    );
  }
}
