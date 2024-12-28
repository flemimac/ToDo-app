import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/category.dart';
import '../../../models/model.dart';
import '../../../models/todo.dart';

part 'category_state.dart';
part 'category_event.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  CategoryBloc() : super(CategoryLoadingState()) {
    on<LoadCategoriesEvent>((event, emit) async {
      emit(CategoryLoadingState());

      List<ToDo> todoList = await _databaseHelper.getToDos();
      List<Category> categories = Category.categoryList();

      // Обновление счетчиков категорий
      _updateCategoryCounters(categories, todoList);

      emit(CategoryLoadedState(categories));
    });
  }

  void _updateCategoryCounters(List<Category> categories, List<ToDo> todoList) {
    for (var category in categories) {
      category.counter = 0;
    }
    for (var todo in todoList) {
      for (var category in categories) {
        if (category.name == 'All') {
          category.counter++;
        }
        if (todo.todoCategory == category.name) {
          category.counter++;
        }
      }
    }
  }
}
