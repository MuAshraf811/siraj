import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siraj/core/styles/text_styles.dart';
import 'package:siraj/core/utils/constants/app_assets.dart';
import 'package:siraj/core/utils/constants/app_colors.dart';
import 'package:siraj/features/quran/controller/quran_cubit.dart';

class TestQuranJson extends StatelessWidget {
  const TestQuranJson({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 8.0.w, left: 10.w, right: 10.w),
        child: BlocBuilder<QuranCubit, QuranState>(
          buildWhen: (previous, current) =>
              current is LoadingAyahsState ||
              current is LoadedAyahsState ||
              current is ErrorAyahsState,
          builder: (context, state) {
            if (state is LoadedAyahsState) {
              return ListView.separated(
                separatorBuilder: (context, index) =>
                    Image.asset(AssetConstants.divider),
                itemCount: context.read<QuranCubit>().ayahs.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Column(
                    // Space between ayahs
                    children: context
                        .read<QuranCubit>()
                        .ayahs[index]
                        .allAyahInSurah
                        .map(
                          (e) => Text(
                            e.ayahText.replaceAll(
                                "بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ", ""),
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.right, // Align to the right
                            maxLines:
                                5, // Allow up to 5 lines to avoid overflow
                            overflow: TextOverflow
                                .ellipsis, // Add ellipsis for long text
                            style: getSemiBoldStyle(
                              fontSize: 17,
                              color: AppColors.black,
                            ),
                          ),
                        )
                        .toList(),
                  );
                },
              );
            } else if (state is ErrorAyahsState) {
              return Center(
                child: Text(state.error),
              );
            }
            return const CircularProgressIndicator.adaptive();
          },
        ),
      ),
    );
  }
}
