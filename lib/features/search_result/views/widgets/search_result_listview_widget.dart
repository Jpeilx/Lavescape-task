import 'package:flutter/material.dart';
import 'package:lavescape/core/shared/models/lavescape_model.dart';
import 'package:lavescape/core/shared/ui_widgets/lavescape_card_view.dart/lavescape_card_view.dart';
import 'package:lavescape/core/utils/helper/spacing.dart';

class SearchResultListViewWidget extends StatelessWidget {
  final List<LavescapeModel> lavescapeData;
  const SearchResultListViewWidget({super.key , required this.lavescapeData});
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all( 20),
      child: ListView.separated( 
         physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
            return LavescapeCardView(lavescapeData: lavescapeData[index],);
            
          },
          itemCount: lavescapeData.length,
          separatorBuilder: (context, index) => verticalSpace(10),
          
          ),
    );
  }
}