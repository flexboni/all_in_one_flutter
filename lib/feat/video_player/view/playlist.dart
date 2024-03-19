import 'package:all_in_one_flutter/constant/app_colors.dart';
import 'package:all_in_one_flutter/constant/constants.dart';
import 'package:all_in_one_flutter/core/widgets/widgets.dart';
import 'package:all_in_one_flutter/feat/video_player/model/content.dart';
import 'package:all_in_one_flutter/feat/video_player/view/type_indicator.dart';
import 'package:all_in_one_flutter/gen/assets.gen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Playlist extends StatelessWidget {
  const Playlist({
    super.key,
    required this.onClose,
    required this.currentIndex,
    required this.contents,
  });

  final void Function() onClose;
  final int currentIndex;
  final List<Content> contents;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        height: double.maxFinite,
        width: MediaQuery.of(context).size.width * 0.43,
        padding: EdgeInsets.all(16.w),
        color: Colors.black.withOpacity(0.9),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                onPressed: onClose,
                icon: Assets.icons.player.close.svg(width: 24.w),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      // TODO - 적절한 명칭으로 변경
                      Text(
                        '재생목록',
                        style: TextStyle(fontSize: 18.sp, color: Colors.white),
                      ),
                      SpaceH(size: 9.w),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 9.w,
                          vertical: 5.w,
                        ),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.r),
                          ),
                          color: AppColors.BLACK_22,
                        ),
                        child: Text(
                          '${currentIndex + 1}/${contents.length}',
                          style:
                              TextStyle(fontSize: 11.sp, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SpaceV(size: 28.w),
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (_, index) {
                        return PlaylistListItem(
                          content: contents[index],
                          isSelected: index == currentIndex,
                        );
                      },
                      separatorBuilder: (_, __) => SpaceV(size: 20.w),
                      itemCount: contents.length,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlaylistListItem extends StatelessWidget {
  const PlaylistListItem({
    super.key,
    required this.content,
    required this.isSelected,
  });

  final Content content;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4.r),
          child: Container(
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.r),
                side: BorderSide(
                  color: isSelected ? Colors.green : AppColors.GRAY_76,
                ),
              ),
            ),
            child: CachedNetworkImage(
              width: 142.w,
              height: 80.w,
              fit: BoxFit.cover,
              imageUrl: '', // TODO - Thumbnail 데이터 바인딩 필요
              errorWidget: (_, __, ___) => const ProgressBar(),
            ),
          ),
        ),
        SpaceH(size: 12.w),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TypeIndicator(type: content.lectureType),
              SpaceV(size: 4.w),
              Text(
                content.title,
                style: TextStyle(fontSize: 14.sp, color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
