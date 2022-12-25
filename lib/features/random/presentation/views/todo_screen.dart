// ignore_for_file: must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task/features/random/presentation/cubit/cubit.dart';
import 'package:todo_task/features/random/presentation/cubit/states.dart';

import '../widgets/design_content.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  var formKey = GlobalKey<FormState>();

  var todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ToDoCubit, ToDoStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        return RefreshIndicator(
            onRefresh: () {
              return ToDoCubit.get(context).getData();
            },
            child: Scaffold(
              appBar: AppBar(
                title: const Text('TO DO App'),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: formKey,
                  child: Column(children: [
                    Row(
                      children: [
                        Expanded(
                          child: Card(
                            color: Colors.white,
                            elevation: 20.0,
                            margin: const EdgeInsetsDirectional.all(20),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadiusDirectional.circular(10)),
                            child: Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(start: 10),
                              child: TextFormField(
                                controller: todoController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Type Something here...',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'what want you add?';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                          ),
                          child: IconButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                ToDoCubit.get(context)
                                    .createTodo(todo: todoController.text);
                                todoController.text = '';
                              }
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                        child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: ToDoCubit.get(context).items.length,
                      itemBuilder: (context, index) => DesignContent(
                        saveDataModel: ToDoCubit.get(context).items[index],
                      ),
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                        height: 10,
                      ),
                    )),
                  ]),
                ),
              ),
            ));
      },
    );
  }
}
