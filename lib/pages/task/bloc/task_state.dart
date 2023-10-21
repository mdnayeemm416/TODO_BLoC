part of 'task_bloc.dart';

@immutable
sealed class TaskState {}
sealed class TaskActionState extends TaskState{}

final class TaskInitial extends TaskState {}

class TaskLoadingState extends TaskState{}
class TaskSuccessState extends TaskState{}

class TaskAddButtonClickedState extends TaskActionState{}

class TaskRemovedButtonClickState extends TaskActionState{}