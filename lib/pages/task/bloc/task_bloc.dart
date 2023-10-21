import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {
    on<TaskInitialEvent>(taskInitialEvent);
    on<TaskAddButtonClickedEvent>(taskAddButtonClickedEvent);
    on<TaskRemoveButtonClickedEvent>(taskRemoveButtonClickedEvent);
  }

  FutureOr<void> taskInitialEvent(
      TaskInitialEvent event, Emitter<TaskState> emit) async {
    emit(TaskLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(TaskSuccessState());
  }

  FutureOr<void> taskAddButtonClickedEvent(
      TaskAddButtonClickedEvent event, Emitter<TaskState> emit) {
    emit(TaskAddButtonClickedState());
  }

  FutureOr<void> taskRemoveButtonClickedEvent(
      TaskRemoveButtonClickedEvent event, Emitter<TaskState> emit) {}
}
