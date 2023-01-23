import 'dart:async';

import 'package:core/core.dart';
import 'package:detail_todo/detail_todo.dart';
import 'package:detail_todo/presentation/widgets/dialog_edit_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailTodoPage extends StatelessWidget {
  DetailTodoPage({Key? key}) : super(key: key);
  final TextEditingController _titleCon = TextEditingController();
  final TextEditingController _subTitleCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments;
    context.read<GetDetailTodoBloc>().add(OnGetDetailEvent(id: '$id'));
    return Scaffold(
        appBar: AppBar(
          title: const Text('Title Todo'),
          actions: [
            Builder(builder: (context) {
              final message = context.select(
                  (RemoveTodoBloc bloc) => (bloc.state is RemoveTodoSuccess)
                      ? 'success'
                      : (bloc.state is RemoveTodoError)
                          ? 'remove error'
                          : '_');

              return IconButton(
                  onPressed: () async {
                    context.read<RemoveTodoBloc>().add(RemoveEvent('$id'));
                    if (message == 'success') {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.green,
                          content: Text('Success Menghapus Todo'),
                        ),
                      );
                    } else if (message == 'remove error') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('Gagal Menghapus Todo'),
                        ),
                      );
                    }
                  },
                  icon: const Icon(
                    Icons.delete_forever,
                    color: Colors.white,
                  ));
            })

            // BlocBuilder<RemoveTodoBloc, RemoveTodoState>(
            //     builder: (context, state) => IconButton(
            //         onPressed: () async {
            //           context.read<RemoveTodoBloc>().add(RemoveEvent('$id'));
            //           if (state is RemoveTodoSuccess) {
            //             Navigator.pop(context);
            //             ScaffoldMessenger.of(context).showSnackBar(
            //               const SnackBar(
            //                 backgroundColor: Colors.green,
            //                 content: Text('Success Menghapus Todo'),
            //               ),
            //             );
            //           } else if (state is RemoveTodoError) {
            //             ScaffoldMessenger.of(context).showSnackBar(
            //               const SnackBar(
            //                 backgroundColor: Colors.red,
            //                 content: Text('Gagal Menghapus Todo'),
            //               ),
            //             );
            //           }
            //         },
            //         icon: const Icon(
            //           Icons.delete_forever,
            //           color: Colors.white,
            //         )))
          ],
        ),
        body: BlocBuilder<GetDetailTodoBloc, GetDetailTodoState>(
            builder: (context, state) {
          if (state is GetDetailTodoLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 12,
                color: primaryColors,
              ),
            );
          } else if (state is GetDetailTodoHasDataState) {
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              children: [
                Text(
                  state.todo.title,
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  state.todo.description,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            );
          } else {
            return Center(
                child: Text(
              'Terjadi Kesalahan ',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
            ));
          }
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            dialogEdit(
              context,
              titleController: _titleCon,
              subtitle: _subTitleCon,
              id: int.parse('$id'),
              active: false,
            );
          },
          child: const Icon(
            Icons.edit,
            color: Colors.white,
          ),
        ));
  }
}
