import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siraj/features/other/presentation/widgets/hadith_shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/widgets/spacers.dart';
import '../../../quran/presentation/widgets/custom_app_bar.dart';
import '../cubit/sallah_and_radio_cubit.dart';

class RadioView extends StatelessWidget {
  const RadioView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              const VerticalSpacer(height: 20),
              CustomAppBar(
                onTap: () {},
                doAlso: () {},
              ),
              const VerticalSpacer(height: 12),
              BlocBuilder<SallahAndRadioCubit, SallahAndRadioState>(
                buildWhen: (previous, current) =>
                    current is GettingRadioState ||
                    current is RadioErrorState ||
                    current is RadioSuccessState,
                builder: (context, state) {
                  if (state is RadioSuccessState) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: context
                            .read<SallahAndRadioCubit>()
                            .radioChannels
                            .length,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () async {
                            await launchUrl(Uri.parse(context
                                .read<SallahAndRadioCubit>()
                                .radioChannels[index]
                                .url));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 14.h),
                            margin: EdgeInsets.only(bottom: 10.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(color: AppColors.primary),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  width: 100.w,
                                  child: Text(
                                    context
                                        .read<SallahAndRadioCubit>()
                                        .radioChannels[index]
                                        .name,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Container(
                                  width: 100.w,
                                  height: 62.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                      image: DecorationImage(
                                          image: NetworkImage(context
                                              .read<SallahAndRadioCubit>()
                                              .radioChannels[index]
                                              .image),
                                          fit: BoxFit.cover)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }

                  return const Expanded(child: CustomHadithShimmer());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
