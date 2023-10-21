part of 'task_bloc.dart';

@immutable
sealed class TaskEvent {}

class TaskInitialEvent extends TaskEvent{}

class TaskAddButtonClickedEvent extends TaskEvent{}

class TaskRemoveButtonClickedEvent extends TaskEvent{}