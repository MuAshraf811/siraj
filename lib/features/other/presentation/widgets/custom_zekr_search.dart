import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siraj/features/other/model/azkar_model.dart';
import '../../../../core/styles/text_styles.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/widgets/spacers.dart';
import '../../controller/cubit/zekrand_sebha_cubit.dart';
import '../view/azkar_detailed_view.dart';

class CustomZekrSearch extends SearchDelegate {
  CustomZekrSearch({
    super.searchFieldLabel,
    super.searchFieldStyle,
    super.searchFieldDecorationTheme,
    super.keyboardType,
    super.textInputAction,
  });
  @override
  String? get searchFieldLabel => "البحث عن ذكر";
  @override
  TextStyle? get searchFieldStyle => getMediumStyle(
        fontSize: 16,
        color: AppColors.black.withOpacity(0.75),
      );
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
    final cubit = BlocProvider.of<ZekrandSebhaCubit>(context);
    cubit.filterSurahsOnSearch(query);
    final filterList = cubit.filteredZekr;

    return Container(
      color: AppColors.white,
      child: _buildListView(filterList),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final cubit = BlocProvider.of<ZekrandSebhaCubit>(context);
    cubit.filterSurahsOnSearch(query);
    final filterList = cubit.filteredZekr;

    return Container(
      color: AppColors.white,
      child: _buildListView(filterList),
    );
  }

  Widget _buildListView(List<AzkarModel> filterList) {
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

    return Expanded(
      child: ListView.builder(
        itemCount: filterList.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AzkarDetailedView(index: index),
              ),
            );
          },
          child: Container(
            width: double.infinity,
            height: 56.h,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            margin: EdgeInsets.only(left: 26.w, right: 18.w, bottom: 8.h),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.7),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(26.r),
                bottomLeft: Radius.circular(24.r),
              ),
            ),
            child: Text(
              context.read<ZekrandSebhaCubit>().azkrMOdel[index].category,
              style: getSemiBoldStyle(
                fontSize: 18,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
