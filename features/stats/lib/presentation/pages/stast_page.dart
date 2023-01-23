import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stats/presentation/bloc/bloc/stats_todo_bloc.dart';

class StastPage extends StatefulWidget {
  const StastPage({Key? key}) : super(key: key);

  @override
  State<StastPage> createState() => _StastPageState();
}

class _StastPageState extends State<StastPage> {
  @override
  void initState() {
    super.initState();
    context.read<StatsTodoBloc>().add(OnStatsTodo());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatsTodoBloc, StatsTodoState>(
        builder: (context, state) {
      if (state is StatsTodoLoading) {
        return const Center(child: Text('Loasing.... '));
      } else if (state is StatsTodoError) {
        return const Center(child: Text('Error'));
      } else if (state is StatsTodoSuccess) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Count TODOs\n',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                state.data['active'].toString(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                '\nActive TODO\n',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                state.data['unActive'].toString(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        );
      } else {
        return const SizedBox();
      }
    });
  }
}
