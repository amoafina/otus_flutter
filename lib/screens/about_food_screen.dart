import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otusfood/model/food.dart';
import 'package:otusfood/utils/utils.dart';
import 'package:otusfood/widgets/cooking_time_info_widget.dart';
import 'package:otusfood/widgets/step_widget.dart';

class AboutFoodScreen extends StatefulWidget {
  final Food food = Food(
      title: "Стейк из говядины по-грузински с кукурузой",
      time: 75,
      id: 3,
      imgLocalSource: "photo_third_recipe.png");

  @override
  State<AboutFoodScreen> createState() {
    return _AboutFoodScreenState();
  }
}

class _AboutFoodScreenState extends State<AboutFoodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black,
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text(
          'Рецепт',
          style: TextStyle(
              fontSize: 20.0,
              color: '#165932'.toColor(),
              fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
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
                  child: Text(
                    widget.food.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 24.0,
                    ),
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
                        height: 220.0,
                        fit: BoxFit.fill,
                        width: 396.0,
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
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'title',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0,
                                ),
                              ),
                              Align(
                                child: Text(
                                  '2312',
                                  style: TextStyle(
                                    color: Color(0XFF797676),
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                alignment: Alignment.centerLeft,
                              ),
                            ],
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
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: StepWidget(),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 27.0,
                    bottom: 81.0,
                  ),
                  child: Center(
                    child: MaterialButton(
                      minWidth: 232.0,
                      height: 48.0,
                      child: Text(
                        'Начать готовить',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                        ),
                      ),
                      color: Color(0XFF165932),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      onPressed: () {},
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
