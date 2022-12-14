import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:otusfood/model/recipe.dart';
import 'package:otusfood/utils/app_colors.dart';

class ItemRecipeWidget extends StatelessWidget {
  final Recipe recipe;

  const ItemRecipeWidget(this.recipe, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: AppColors.textSecondary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          CachedNetworkImage(
            imageUrl: recipe.getNetworkPath(),
            width: 149,
            height: 136,
            fit: BoxFit.cover,
            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 23.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    recipe.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.watch_later_outlined,
                          size: 16.0,
                          color: Colors.black,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 11.0),
                          child: Text(
                            recipe.getTimeValue(),
                            style: TextStyle(
                              color: AppColors.mainAccent,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
