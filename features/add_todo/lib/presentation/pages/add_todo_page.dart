// import 'package:core/presentation/widget_form_field.dart';
import 'package:add_todo/presentation/bloc/add_todo_bloc.dart';
import 'package:core/core.dart';
import 'package:core/data/models/todo_model.dart';
import 'package:core/domain/entity/todo_entity.dart';
import 'package:core/presentation/widget_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getz/get.dart';

class AddTodoPage extends StatelessWidget {
  AddTodoPage({Key? key}) : super(key: key);
  final TextEditingController titleController = TextEditingController();
  final TextEditingController subtitle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambahkan TODO'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        // mainAxisSize: MainAxisSize.min,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Title',
            style: Theme.of(context).textTheme.bodyText1,
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
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFields(controller: subtitle),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<AddTodoBloc, AddTodoState>(builder: (context, state) {
            if (state is AddTodoLoadingState) {
              return Material(
                color: primaryColors,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  'Loading....',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .button!
                      .copyWith(color: Colors.white),
                ),
              );
            }
            return Material(  
              color: primaryColors,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: TextButton(
                onPressed: () {
                  context.read<AddTodoBloc>().add(AddTodo(TodoEntity(
                        title: titleController.text,
                        description: subtitle.text,
                        active: false,
                      )));
                  if (state is OnAddTodoState) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.green,
                        content: Text('Berhasil Menambahkan TODO'),
                      ),
                    );
                  } else if (state is AddTodoErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('Gagal Menambahkan TODO'),
                      ),
                    );
                  }
                },
                child: Text(
                  'Tambahkan Todo',
                  style: Theme.of(context)
                      .textTheme
                      .button!
                      .copyWith(color: Colors.white),
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
