import 'package:add_todo/add_todo.dart';
import 'package:add_todo/presentation/bloc/add_todo_bloc.dart';
import 'package:bloc_v2/current_index_page.dart';
import 'package:bloc_v2/injections.dart';
import 'package:core/core.dart';
import 'package:detail_todo/detail_todo.dart';
import 'package:flutter/material.dart';
import 'package:bloc_v2/injections.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/home.dart';
import 'package:home/presentation/bloc/get_data_todo_bloc.dart';
import 'package:stats/stats.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInjection();
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigation = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AddTodoBloc>(create: (_) => di.locator<AddTodoBloc>()),
        BlocProvider<GetDataTodoBloc>(
            create: (_) => di.locator<GetDataTodoBloc>()),
        BlocProvider<GetDetailTodoBloc>(
            create: (_) => di.locator<GetDetailTodoBloc>()),
        BlocProvider<RemoveTodoBloc>(
            create: (_) => di.locator<RemoveTodoBloc>()),
        BlocProvider<UpdateTodoBloc>(
            create: (_) => di.locator<UpdateTodoBloc>()),
        BlocProvider<ActiveunTodoBloc>(
            create: (_) => di.locator<ActiveunTodoBloc>()),
        BlocProvider<StatsTodoBloc>(
            create: (_) => di.locator<StatsTodoBloc>())
      ],
      child: MaterialApp(
        title: 'Bloc Advance',
        navigatorKey: navigation,
        debugShowCheckedModeBanner: false,
        theme: FlutterTodosTheme.light,
        home: CurrentIndexPage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings initialRoute) {
          switch (initialRoute.name) {
            case RouteNamed.currentPage:
              return MaterialPageRoute(builder: (_) => CurrentIndexPage());
            case RouteNamed.detailTodo:
              return MaterialPageRoute(
                  builder: (_) => DetailTodoPage(), settings: initialRoute);
            case RouteNamed.addTodo:
              return MaterialPageRoute(builder: (_) => AddTodoPage());
            default:
              return MaterialPageRoute(builder: (_) {
                return const Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
