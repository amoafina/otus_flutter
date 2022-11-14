import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:otusfood/api/food_api.dart';
import 'package:otusfood/bloc/about_recipe_screen_bloc.dart';
import 'package:otusfood/bloc/comments_bloc.dart';
import 'package:otusfood/bloc/user_bloc.dart';
import 'package:otusfood/data/comments_box.dart';
import 'package:otusfood/data/favorite_box.dart';
import 'package:otusfood/data/ingredients_box.dart';
import 'package:otusfood/data/recipe_box.dart';
import 'package:otusfood/data/recipe_step_box.dart';
import 'package:otusfood/data/users_box.dart';
import 'package:otusfood/model/comment.dart';
import 'package:otusfood/model/favorite.dart';
import 'package:otusfood/model/freezer.dart';
import 'package:otusfood/model/ingredient.dart';
import 'package:otusfood/model/recipe.dart';
import 'package:otusfood/model/recipe_ingredient.dart';
import 'package:otusfood/model/recipe_step.dart';
import 'package:otusfood/model/recipe_step_link.dart';
import 'package:otusfood/model/user.dart';
import 'package:otusfood/presenters/messages_presenter.dart';
import 'package:otusfood/presenters/user_presenter.dart';
import 'package:otusfood/repositories/comments_repository.dart';
import 'package:otusfood/repositories/ingredients_repository.dart';
import 'package:otusfood/repositories/recipe_step_repository.dart';
import 'package:otusfood/repositories/recipes_repository.dart';
import 'package:otusfood/repositories/user_repository.dart';
import 'package:otusfood/screens/about_recipe_screen.dart';
import 'package:otusfood/screens/main_screen.dart';
import 'package:otusfood/screens/splash_screen.dart';
import 'package:otusfood/utils/app_colors.dart';

import 'arguments/about_recipe_arguments.dart';
import 'model/entity_link.dart';

void main() {
  Hive.initFlutter();
  Hive.registerAdapter(RecipeAdapter());
  Hive.registerAdapter(IngredientAdapter());
  Hive.registerAdapter(RecipeStepLinkAdapter());
  Hive.registerAdapter(FavoriteAdapter());
  Hive.registerAdapter(RecipeIngredientAdapter());
  Hive.registerAdapter(RecipeStepAdapter());
  Hive.registerAdapter(EntityLinkAdapter());
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(FreezerAdapter());
  Hive.registerAdapter(CommentAdapter());
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final String appName = "Otus Food";
  final FoodApi foodApi = new FoodApi();
  final MessagePresenter _messagePresenter = new MessagePresenter();

  @override
  Widget build(BuildContext context) {
    return new MultiRepositoryProvider(
      providers: [
        RepositoryProvider<RecipeRepository>(
          create: (builder) => new RecipeRepository(
            foodApi: foodApi,
            recipeBox: RecipeBox(),
            favoriteBox: FavoriteBox(),
          ),
        ),
        RepositoryProvider<RecipeStepRepository>(
          create: (context) => RecipeStepRepository(
            foodApi: foodApi,
            baseBox: RecipeStepBox(),
          ),
        ),
        RepositoryProvider<IngredientsRepository>(
          create: (builder) => IngredientsRepository(
            foodApi: foodApi,
            ingredientsBox: IngredientsBox(),
          ),
        ),
        RepositoryProvider<UserRepository>(
          create: (builder) => UserRepository(
            foodApi: foodApi,
            baseBox: UsersBox(),
          ),
        ),
        RepositoryProvider<CommentsRepository>(
          create: (builder) => CommentsRepository(
            foodApi: foodApi,
            commentsBox: new CommentsBox(),
          ),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<UserBloc>(
            create: (builder) => UserBloc(
              userPresenter: new UserPresenter(
                builder.read<UserRepository>(),
                messagePresenter: _messagePresenter,
              ),
            ),
          ),
          BlocProvider<AboutRecipeScreenBloc>(
            create: (builder) {
              return new AboutRecipeScreenBloc(
                ingredientRepository: builder.read<IngredientsRepository>(),
                recipeStepRepository: builder.read<RecipeStepRepository>(),
                recipeRepository: builder.read<RecipeRepository>(),
                userPresenter: BlocProvider.of<UserBloc>(builder).userPresenter,
              );
            },
          ),
          BlocProvider<CommentsBloc>(
              create: (builder) => CommentsBloc(
                    userPresenter:
                        BlocProvider.of<UserBloc>(builder).userPresenter,
                    commentsRepository: builder.read<CommentsRepository>(),
                  )),
        ],
        child: MaterialApp(
          title: appName,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: AppColors.themeColor),
          initialRoute: SplashScreenWidget.splashScreenName,
          onGenerateRoute: (settings) {
            if (settings.name == AboutFoodScreen.aboutFoodScreenName) {
              final args = settings.arguments as AboutRecipeArguments;
              return AboutFoodScreen.createRouteToAboutRecipeScreen(
                args.recipeId,
              );
            } else if (settings.name == SplashScreenWidget.splashScreenName) {
              return PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    SplashScreenWidget(),
              );
            } else if (settings.name == MainScreen.mainScreenName) {
              return  MainScreen.createRouteMainScreen(appName);
            }
            return null;
          },
        ),
      ),
    );
  }
}
