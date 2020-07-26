import 'package:manageYourMoneyMobile/store/models/category.model.dart';

class GetCategoriesPending {}

class GetCategoriesSuccess {
  GetCategoriesSuccess(this.categories);
  List<CategoryModel> categories;
}

class Category {
  Category(this.img, this.name, this.description);
  String img;
  String name;
  String description;
}

class GetCategoriesError {}

class CreateCategoryPending {
  CreateCategoryPending(this.img, this.name, this.description);
  String img;
  String name;
  String description;
}
