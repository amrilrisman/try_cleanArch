import 'package:core/core.dart';
import 'package:core/data/models/todo_model.dart';
import 'package:detail_todo/detail_todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future dialogEdit(
  BuildContext context, {
  required TextEditingController titleController,
  required TextEditingController subtitle,
  required int id,
  required bool active,
}) async {
  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  return showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.transparent,
    builder: (_) => AlertDialog(
      backgroundColor: Colors.white,
      content: Form(
        key: keyForm,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title',
              style: Theme.of(context).textTheme.button,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFields(controller: titleController),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Description',
              style: Theme.of(context).textTheme.button,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFields(controller: subtitle),
          ],
        ),
      ),
      title: const Text('Edit Todo'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Tutup',
            style:
                Theme.of(context).textTheme.button!.copyWith(color: Colors.red),
          ),
        ),
        Builder(builder: (context) {
          final bool message = context.select(
              (UpdateTodoBloc bloc) => bloc.state is UpdateSuccessState
                  ? (bloc.state as UpdateSuccessState).isAdd == true
                      ? true
                      : false
                  : false
              // (bloc.state is UpdateSuccessState).isAdd == true ? true : false,
              );
          print(message);
          return RaisedButton(
            onPressed: () {
              if (keyForm.currentState!.validate()) {
                context.read<UpdateTodoBloc>().add(
                      OnUpdateTodoEvent(
                        TodoModels(
                            id: id,
                            title: titleController.text,
                            description: subtitle.text,
                            active: active),
                      ),
                    );
              }
              if (message == true) {
                Navigator.pop(context);
                context
                    .read<GetDetailTodoBloc>()
                    .add(OnGetDetailEvent(id: '$id'));
              }
            },
            color: primaryColors,
            child: Text(
              'Simpan',
              style: Theme.of(context)
                  .textTheme
                  .button!
                  .copyWith(color: Colors.white),
            ),
          );
        })
      ],
    ),
  );
}
