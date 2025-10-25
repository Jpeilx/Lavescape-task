import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavescape/core/utils/colors/app_colors.dart';
import 'package:lavescape/core/utils/styles/font_manager.dart';
import 'package:lavescape/core/utils/styles/text_style_manger.dart';


class LocationInputWidget extends StatelessWidget{
  final ValueChanged<String?>? onCityChanged;
  final String? selectedCity;
   final List<String> cities = const  [
    'Riyadh',
    'Jeddah',
    'Dammam',
    'Mecca',
    'Medina',
    'Khobar',
    'Abha',
    'Taif',
    'Hail',
    'Tabuk',
    'Al-Ula',
    'Al Khafji',
    'Najran',
    'Jazan',
    'Al Bahah',
    'Arar',
    'Sakaka',
  ];

  const LocationInputWidget({super.key , required this.onCityChanged , required this.selectedCity} );

  

  @override
  Widget build(BuildContext context) {
    return     Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.w),
      child: Center(
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  hint: 
                      Text(
                       'Cites',
                        style: getMediumStyle(fontSize: FontSize.s15, color: AppColors.kBlackTextColor, fontFamily: FontConstants.interFontfamily) ,
                        overflow: TextOverflow.ellipsis,
                      ),
                  items: cities
                      .map((String item) => DropdownMenuItem<String>(
                           
                            value: item,
                            child: Text(
                              item,
                              style:getMediumStyle(fontSize: FontSize.s15, color: AppColors.kBlackTextColor, fontFamily: FontConstants.interFontfamily),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ))
                      .toList(),
                  value: selectedCity,
                  onChanged: onCityChanged,
                  
                  buttonStyleData: ButtonStyleData(
                    height: 44.h,
                    width: MediaQuery.of(context).size.width ,
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(
                        color: AppColors.kBorderColor
                      ),
                      color: AppColors.kWhiteColor,
                       

                  boxShadow: [
                    BoxShadow(
                      color: AppColors.kBlackColor.withValues(
                        alpha: 0.08,
                      ), // shadow color
                      spreadRadius: 0.2,
                      blurRadius: 1,
                      offset: const Offset(0, 0.5),
                    ),
                  ],
                    ),
                    elevation: 0,

                    
                  ),
                  iconStyleData: const IconStyleData(
                    icon: SizedBox.shrink(),
                  ),
                  dropdownStyleData: DropdownStyleData(

                    maxHeight: 300.h,

                    width: MediaQuery.of(context).size.width - 40.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.r),
                      color: AppColors.kWhiteColor,
                    ),
                    elevation: 4,
                    offset: const Offset(0, 0),

                  ),
                  menuItemStyleData:  MenuItemStyleData(
                    height: 40.h,
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                  ),
                ),
              ),
            
          ),
    );
    
   
  }
}
