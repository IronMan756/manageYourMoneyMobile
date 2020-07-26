import 'package:manageYourMoneyMobile/store/actions/categories.action.dart';
import 'package:manageYourMoneyMobile/store/models/category.model.dart';

List<CategoryModel> categoriesReducer(
    List<CategoryModel> state, dynamic action) {
  if (action is GetCategoriesSuccess) {
    return action.categories;
  }
  // if (action is LogoutSuccess) {
  //   return null;
  // }
  return state;
}
