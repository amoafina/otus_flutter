import 'package:flutter/material.dart';
import 'package:otusfood/model/food.dart';
import 'package:otusfood/widgets/cooking_time_info_widget.dart';
import 'package:otusfood/widgets/ingredient_widget.dart';
import 'package:otusfood/widgets/start_finish_cooking_button.dart';
import 'package:otusfood/widgets/step_widget.dart';

class AboutFoodScreen extends StatefulWidget {
  final Food food;

  AboutFoodScreen({
    required this.food,
  });

  @override
  State<AboutFoodScreen> createState() {
    return _AboutFoodScreenState();
  }
}

class _AboutFoodScreenState extends State<AboutFoodScreen> {
  bool _isProcessingCooking = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text(
          'Рецепт',
          style: TextStyle(
              fontSize: 20.0,
              color: Color(0XFF165932),
              fontWeight: FontWeight.w400),
        ),
        bottom: _isProcessingCooking
            ? PreferredSize(
                child: Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Таймер',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '38:59',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 24.0,
                        ),
                      )
                    ],
                  ),
                  height: 59.0,
                ),
                preferredSize: Size.fromHeight(59),
              )
            : null,
        centerTitle: true,
        backgroundColor:
            _isProcessingCooking ? Color(0XFF2ECC71) : Colors.white,
        actions: [
          IconButton(
            color: Colors.black,
            onPressed: () {},
            icon: Image.asset('assets/images/ic_megafon.png'),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Container(
            margin: const EdgeInsets.only(left: 17.0, right: 17.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 27.6),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          widget.food.title,
                          maxLines: 4,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 24.0,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: true,
                        child: IconButton(
                          iconSize: 30.0,
                          icon: Icon(
                            Icons.favorite_outlined,
                            color: widget.food.isFavorite
                                ? Colors.red
                                : Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              widget.food.isFavorite = !widget.food.isFavorite;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: CookingTimeInfoWidget(
                    cookingTime: widget.food.getTimeValue(),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        widget.food.getLocalPath(),
                        height: (MediaQuery.of(context).size.width - 32) / 1.79,
                        fit: BoxFit.fill,
                        width: MediaQuery.of(context).size.width - 32,
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 22.54,
                  ),
                  child: Text(
                    'Ингредиенты',
                    style: TextStyle(
                      color: Color(0Xff165932),
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 18.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFF797676),
                      width: 3.0,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 15.0,
                      ),
                      itemCount: widget.food.ingredients.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            top: index == 0 ? 0.0 : 8.0,
                          ),
                          child: IngredientWidget(
                            foodIngredient: widget.food.ingredients[index],
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 19.0),
                  child: Text(
                    'Шаги приготовления',
                    style: TextStyle(
                      color: Color(0Xff165932),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 19.0),
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: widget.food.steps.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: StepWidget(
                            step: widget.food.steps[index],
                            isProcessingCooking: _isProcessingCooking,
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 27.0,
                    bottom: 81.0,
                  ),
                  child: Center(
                    child: StartFinishCookingButton(
                      onPressedButton: () {
                        setState(() {
                          _isProcessingCooking = !_isProcessingCooking;
                        });
                      },
                      isProcessingCooking: _isProcessingCooking,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
