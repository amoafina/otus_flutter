import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:otusfood/childWidgets/FavoriteButtonWidget.dart';
import 'package:otusfood/childWidgets/recipe_steps_widget.dart';
import 'package:otusfood/childWidgets/start_finish_cooking_button.dart';
import 'package:otusfood/childWidgets/step_widget.dart';
import 'package:otusfood/model/entity_link.dart';
import 'package:otusfood/model/recipe_step.dart';
import 'package:otusfood/model/recipe_step_link.dart';
import 'package:rive/rive.dart';

void main() {
  testWidgets('Add to favorite', (WidgetTester tester) async {
    var isFavorite = false;
    await tester.pumpWidget(new MaterialApp(
      home: Material(
        child: FavoriteButtonWidget(
          onTap: () {
            isFavorite = true;
          },
          isFavorite: isFavorite,
        ),
      ),
    ));
    RiveAnimation animation = tester.widget(find.byType(RiveAnimation));
    expect(animation.artboard == "heartAnimationRed", isFalse);
    expect(isFavorite, isFalse);
    await tester.tap(find.byType(InkWell));
    expect(isFavorite, isTrue);
  });

  testWidgets('remove from favorite', (WidgetTester tester) async {
    var isFavorite = true;
    await tester.pumpWidget(new MaterialApp(
      home: Material(
        child: FavoriteButtonWidget(
          onTap: () {
            isFavorite = false;
          },
          isFavorite: isFavorite,
        ),
      ),
    ));
    RiveAnimation animation = tester.widget(find.byType(RiveAnimation));
    expect(animation.artboard == "heartAnimationRed", isTrue);
    expect(isFavorite, isTrue);
    await tester.tap(find.byType(InkWell));
    expect(isFavorite, isFalse);
  });

  testWidgets(
    'test recipe step widget',
    (WidgetTester tester) async {
      var controller = new ScrollController();
      await tester.pumpWidget(new MaterialApp(
        home: new Material(
          child: Scaffold(
            body: SingleChildScrollView(
              controller: controller,
              child: RecipeStepsWidget(
                scrollController: controller,
                recipeSteps: <RecipeStep>[
                  RecipeStep(
                      id: 1,
                      name: "test",
                      duration: 111,
                      recipeStepLinks: [
                        RecipeStepLink(
                          id: 1,
                          number: 1,
                          recipe: EntityLink(id: 1),
                          step: EntityLink(id: 1),
                        )
                      ]),
                  RecipeStep(
                      id: 2,
                      name: "two step",
                      duration: 111,
                      recipeStepLinks: [
                        RecipeStepLink(
                          id: 1,
                          number: 1,
                          recipe: EntityLink(id: 1),
                          step: EntityLink(id: 1),
                        )
                      ]),
                  RecipeStep(
                      id: 3,
                      name: "third step",
                      duration: 111,
                      recipeStepLinks: [
                        RecipeStepLink(
                          id: 1,
                          number: 1,
                          recipe: EntityLink(id: 1),
                          step: EntityLink(id: 1),
                        )
                      ]),
                ],
              ),
            ),
          ),
        ),
      ));

      var firstWidgetStep = (tester.firstWidget(find.byType(StepWidget)))
          as StepWidget; //?????????????? ???????????? ???????????? ????????

      expect(firstWidgetStep.isProcessingCooking,
          isFalse); //???? ?????????????????? ?? ?????? ?????? ???????????????? ??????????????

      await tester.tap(find.descendant(
          of: find.byType(StartFinishCookingButton),
          matching: find
              .byType(MaterialButton))); //???????????????? ???? ???????????? ???????????? ????????????????

      await tester.pump();

      firstWidgetStep = (tester.firstWidget(find.byType(StepWidget)))
          as StepWidget; //?????????????? ?????????? ???????????? ?????????????? ????????

      expect(
        firstWidgetStep.isProcessingCooking,
        isTrue,
      ); //???? ???????????? ?????????????????? ?? ???????????????? ??????????????

      var isChecked = firstWidgetStep.step.isSuccess;
      expect(isChecked, isFalse); //?????? ???? ?????????????????? ???? ???????????? ???????? ??????????????

      await tester.tap(find.descendant(
          of: find.byType(StepWidget).first,
          matching: find.byType(Checkbox))); //?????????????? ?? ???????????????? ???? checkBox

      await tester.pump();
      firstWidgetStep = (tester.firstWidget(find.byType(StepWidget)))
          as StepWidget; //?????????? ?????????????? ???????????? ?????????????? ????????

      expect(
        firstWidgetStep.step.isSuccess,
        isTrue,
      ); //?????? ???????????? ???????? ????????????????
    },
  );
}
