import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/core/helpers/extension.dart';
import 'package:pet_finder_app/features/favourite/presentation/ui/widgets/sequential_loading.dart';
import 'package:pet_finder_app/features/home/presentation/controller/home_cubit.dart';
import 'package:pet_finder_app/features/home/presentation/controller/home_states.dart';
import 'package:pet_finder_app/features/home/presentation/ui/widgets/pet_card.dart';

class PetsList extends StatelessWidget {
  const PetsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      buildWhen: (previous, current) =>
          current is GetBreedsLoading ||
          current is GetBreedsSuccess ||
          current is GetBreedsError,
      builder: (context, state) {
        switch (state) {
          case GetBreedsLoading _:
            return Center(child: SequentialLoading());
          case GetBreedsError _:
            return Center(child: Text(state.message));
          case GetBreedsSuccess _:
            final pets = (state).breeds;

            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              itemCount: pets.length,
              itemBuilder: (context, index) {
                final image = pets[index].imageUrl;
                return Padding(
                  padding: EdgeInsets.only(bottom: 16.h),
                  child: PetCard(
                    breedEntity: pets[index],
                    imageUrl: image.toImageUrl(),
                  ),
                );
              },
            );
          default:
            return SizedBox.shrink();
        }
      },
    );
  }
}
