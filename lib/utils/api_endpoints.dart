class ApiEndPoints{
  static final String baseUrl = 'https://flutter-developer-hiring-kdij.onrender.com/api/';
  static AuthEndPoints authEndPoints = AuthEndPoints();
}

class AuthEndPoints{
  final String registerUser = 'auth/register';
  final String loginUser = 'auth/login';

  final String profile = 'auth/profile';

  final String getCategories = 'categories/categories';
  final String getSubCategories = 'categories/subcategories';
  final String getSubSubCategories = 'categories/subsubcategories';



  final String gettSubCategories = 'products';
  final String PostCreateData = 'products';
  final String getProductId = 'products/product/';
  // final String getSubSubCategories = 'products/subsubcategories';
  // final String getSubSubCategories = 'products/subsubcategories';

  final String withSubcategories = '/with-subcategories';
  final String getSubSubCategory = '/subsubcategory/';
}

