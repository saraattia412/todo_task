

// ignore_for_file: avoid_print, avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task/features/model/save_data_model.dart';
import 'package:todo_task/features/random/presentation/cubit/states.dart';

class ToDoCubit extends Cubit<ToDoStates> {
  ToDoCubit() : super(InitialToDoStates());

  static ToDoCubit get(context) => BlocProvider.of(context);

  final docData = FirebaseFirestore.instance.collection('todo').doc();

  void createTodo({
    required String todo,
  }) {
    emit(LoadingCreateToDoStates());

    SaveDataModel model = SaveDataModel(
      data: todo,
      id: docData.id,
    );
    docData.set(model.toMap()).then((value) {
      print('create done');
      emit(SuccessCreateToDoStates());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorCreateToDoStates());
    });
  }

  List items = [];

  Future getData() async {
    emit(LoadingGetToDoStates());
    await FirebaseFirestore.instance.collection('todo').get()
        .then((value) {
      items = [];
      value.docs.forEach((element) {
        items.add(SaveDataModel.fromJson(element.data()));
      });
      print(items);
      emit(SuccessGetToDoStates());
    }).catchError((error) {
      emit(ErrorGetToDoStates());
    });
  }


  void deleteTodo({
    required String docId
  }) {
    emit(LoadingDeleteToDoStates());
    FirebaseFirestore.instance.collection('todo').doc(docId).delete()
        .then((value) {
      print('delete done');
      emit(SuccessDeleteToDoStates());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorDeleteToDoStates());
    });
  }

}