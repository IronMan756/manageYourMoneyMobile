import 'package:manageYourMoneyMobile/common/services/categories.service.dart';
import 'package:manageYourMoneyMobile/store/actions/categories.action.dart';
import 'package:manageYourMoneyMobile/store/models/category.model.dart';
import 'package:redux_epics/redux_epics.dart';

import 'package:rxdart/rxdart.dart';

Stream<dynamic> getCategoriesEpic(
    Stream<dynamic> actions, EpicStore<dynamic> _store) {
  return actions
      .where((dynamic action) => action is GetCategoriesPending)
      .switchMap((dynamic action) =>
          Stream<List<CategoryModel>>.fromFuture(getCategories())
              .map((List<CategoryModel> categories) {
            print(categories);
            return GetCategoriesSuccess(categories);
          }));
}
