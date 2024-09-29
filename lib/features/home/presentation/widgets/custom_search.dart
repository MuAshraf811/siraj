import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siraj/core/utils/functions/functions.dart';
import 'package:siraj/features/quran/controller/quran_cubit.dart';
import 'package:siraj/features/quran/presentation/view/quran_view.dart';

import '../../../../core/styles/text_styles.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/widgets/spacers.dart';
import '../../../quran/data/surah_model.dart';
import '../../../quran/presentation/widgets/surah_type_container.dart';

class CustomSearch extends SearchDelegate {
  CustomSearch({
    super.searchFieldLabel,
    super.searchFieldStyle,
    super.searchFieldDecorationTheme,
    super.keyboardType,
    super.textInputAction,
  });
  @override
  String? get searchFieldLabel => "البحث عن سورة";
  @override
  TextStyle? get searchFieldStyle =>
      getMediumStyle(fontSize: 16, color: AppColors.black.withOpacity(0.75));
  @override
  InputDecorationTheme? get searchFieldDecorationTheme => InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primary),
          borderRadius: BorderRadius.circular(8.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primary),
          borderRadius: BorderRadius.circular(8.r),
        ),
        hintStyle: searchFieldStyle,
      );

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white, // Customize the app bar color
      ),
      inputDecorationTheme: searchFieldDecorationTheme,
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Padding(
          padding: EdgeInsets.only(right: 24.w),
          child: const Icon(
            Icons.clear,
            color: Colors.red,
          ),
        ),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Padding(
        padding: EdgeInsets.only(left: 6.w),
        child: const Icon(
          Icons.arrow_back,
          color: AppColors.primary,
        ),
      ),
      onPressed: () => Navigator.of(context).pop(),
      // Exit from the search screen.
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final cubit = BlocProvider.of<QuranCubit>(context);
    cubit.filterSurahsOnSearch(query);
    final filterList = cubit.filteredSurahs;

    return Container(
      color: AppColors.white,
      child: _buildListView(filterList),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final cubit = BlocProvider.of<QuranCubit>(context);
    cubit.filterSurahsOnSearch(query);
    final filterList = cubit.filteredSurahs;

    return Container(
      color: AppColors.white,
      child: _buildListView(filterList),
    );
  }

  Widget _buildListView(List<SurahModel> filterList) {
    if (filterList.isEmpty) {
      return SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/Sandy_Tech-28_Single-11.jpg'),
            const VerticalSpacer(height: 12),
            Text(
              'لم يتم العثور علي نتائج',
              style: getMediumStyle(fontSize: 20, color: AppColors.blackText),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: ListView.separated(
        itemCount: filterList.length,
        padding: EdgeInsets.only(top: 16.h),
        separatorBuilder: (context, index) => Divider(
          color: AppColors.primary,
          height: 32.h,
          indent: 20.w,
          endIndent: 20.w,
        ),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => QuranView(
                  page: goToSpacificSurahDependOnItsOrder(
                      filterList[index].surahOrder - 1)),
            ));
          },
          child: Row(
            children: [
              const Icon(
                Icons.arrow_back_ios,
                fill: 0,
                weight: 0.2,
                size: 18,
                color: AppColors.black,
              ),
              const HorizontalSpacer(width: 16),
              filterList[index].type == "Medinan"
                  ? const SurahTypeContainer(type: "مدنية")
                  : const SurahTypeContainer(type: "مكية"),
              const HorizontalSpacer(width: 20),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    BlocProvider.of<QuranCubit>(context).removeArabicDiacritics(
                      filterList[index].surahArabicName,
                    ),
                    style: getMediumStyle(
                        fontSize: 16, color: AppColors.blackText),
                  ),
                  const VerticalSpacer(height: 4),
                  Text(
                    filterList[index].englishTranslationName,
                  ),
                ],
              ),
              const HorizontalSpacer(width: 24),
              Container(
                width: 28.w,
                height: 28.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primary),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Text(
                  filterList[index].surahOrder.toString(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
