import 'package:core/core.dart';
import 'package:core/data/models/todo_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/home.dart';
import 'package:home/presentation/bloc/get_data_todo_bloc.dart';
import 'package:home/presentation/widgets/card_todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with RouteAware, TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => context.read<GetDataTodoBloc>().add(OnGetDataTodoEvent()));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {
    super.didPopNext();
    context.read<GetDataTodoBloc>().add(OnGetDataTodoEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetDataTodoBloc, GetDataTodoState>(
        builder: (context, state) {
      if (state is GetDataIsLoading) {
        return const Center(
          child: CupertinoActivityIndicator(
            radius: 24,
            color: primaryColors,
          ),
        );
      } else if (state is GetDataHasData) {
        if (state.data.isEmpty) {
          return const Center(
            child: Text('Tidak ada data'),
          );
        } else {
          return ListView.builder(
            itemCount: state.data.length,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) {
              return CardTodoItem(
                title: state.data[index].title,
                subtitle: state.data[index].description,
                active: state.data[index].active,
                onActived: (bool newValue) {
                  context.read<ActiveunTodoBloc>().add(
                        OnActiveEvent(
                          TodoModels(
                            id: state.data[index].id,
                            title: state.data[index].title,
                            description: state.data[index].description,
                            active: !newValue,
                          ),
                        ),
                      );
                  context.read<GetDataTodoBloc>().add(OnGetDataTodoEvent());
                },
                navigatTo: () {
                  Navigator.pushNamed(context, RouteNamed.detailTodo,
                      arguments: state.data[index].id.toString());
                },
              );
            },
          );
        }
      } else if (state is GetDataErrorState) {
        return const Center(
          child: Text('Terjadi kesalahan'),
        );
      } else {
        return Container(
          color: Colors.blue,
        );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    routeObserver.unsubscribe(this);
  }
}
