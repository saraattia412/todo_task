abstract class ToDoStates{}

class InitialToDoStates extends ToDoStates{}


//create todo
class LoadingCreateToDoStates extends ToDoStates{}

class SuccessCreateToDoStates extends ToDoStates{}

class ErrorCreateToDoStates extends ToDoStates{}

//get todo

class LoadingGetToDoStates extends ToDoStates{}

class SuccessGetToDoStates extends ToDoStates{}

class ErrorGetToDoStates extends ToDoStates{}

//delete todo

class LoadingDeleteToDoStates extends ToDoStates{}

class SuccessDeleteToDoStates extends ToDoStates{}

class ErrorDeleteToDoStates extends ToDoStates{}

//update todo

class LoadingUpdateToDoStates extends ToDoStates{}

class SuccessUpdateToDoStates extends ToDoStates{}

class ErrorUpdateToDoStates extends ToDoStates{}

//check is done?

class LoadingCheckDoneToDoStates extends ToDoStates{}

class SuccessCheckDoneToDoStates extends ToDoStates{}

class ErrorCheckDoneToDoStates extends ToDoStates{}