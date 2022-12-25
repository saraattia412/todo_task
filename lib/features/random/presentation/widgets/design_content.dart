import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task/features/model/save_data_model.dart';
import 'package:todo_task/features/random/presentation/cubit/states.dart';

import '../cubit/cubit.dart';

class DesignContent extends StatelessWidget {
  final SaveDataModel saveDataModel;
   const DesignContent( {Key? key, required this.saveDataModel }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ToDoCubit,ToDoStates> (
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {



        return Card(
          color: Colors.white,
          elevation: 20.0,
          margin: const EdgeInsetsDirectional.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                 Container(
                   margin: const EdgeInsetsDirectional.all(5),
                   decoration:  BoxDecoration(
                     shape: BoxShape.circle,
                     border: Border.all(),
                   ),
                   child: const Icon(
                       Icons.check
                     )
                 ),
                 Text(saveDataModel.data)
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        ToDoCubit.get(context).deleteTodo(docId: saveDataModel.id);
                      },
                      icon: const Icon(
                        Icons.delete_outline,
                        color: Colors.grey,
                      ))
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
