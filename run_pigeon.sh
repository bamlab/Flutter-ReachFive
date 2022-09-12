(cd flutter_reach_five_platform_interface && \
flutter pub run pigeon \
  --input pigeons/info.dart \
  --dart_out lib/info.g.dart \
  --java_out ../flutter_reach_five_android/android/src/main/java/tech/bam/flutter_reach_five/android/Info.java \
  --java_package "tech.bam.flutter_reach_five.android" \
  --objc_header_out ../flutter_reach_five_ios/ios/Classes/info.h \
  --objc_source_out ../flutter_reach_five_ios/ios/Classes/info.m \
)