import 'dart:io';

import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:kencana_live_timer/components/custom_button_primary.dart';
import 'package:kencana_live_timer/constant/directory_asset.dart';
import 'package:kencana_live_timer/modules/home/controllers/home_controller.dart';
import 'package:kencana_live_timer/modules/home/views/file_view.dart';
import 'package:kencana_live_timer/themes/theme.dart';
import 'package:kencana_live_timer/utils/sizes.dart';

class PreviewScreend extends StatelessWidget {
  const PreviewScreend({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          right: Sizes.s50, left: Sizes.s50, top: Sizes.s55, bottom: Sizes.s20),
      height: Get.height,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            blurRadius: 1,
            blurStyle: BlurStyle.outer,
            spreadRadius: 1,
            color: AssetColor.inverseSurfaceLight.withOpacity(0.3))
      ], borderRadius: BorderRadius.circular(Sizes.s12), color: Colors.white),
      child: Column(
        children: [
          Row(
            children: [
              const Spacer(),
              Container(
                  margin: EdgeInsets.all(Sizes.s10),
                  height: Sizes.s40,
                  width: Sizes.s140,
                  child: CustomButtonPrimary(
                    icon: IconlyBold.plus,
                    text: "Tambah",
                    onPress: () {},
                  ))
            ],
          ),
          Divider(
            height: Sizes.s10,
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    IconlyLight.paper_plus,
                    color: AppColor.blackgrey,
                    size: Sizes.s60,
                  ),
                  SizedBox(
                    height: Sizes.s10,
                  ),
                  Text(
                    "Tarik file kesini untuk menambahkan",
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: FontSize.s14,
                        color: AppColor.blackgrey,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "(Format file yang didukung : pdf, jpg, jpeg, png, heif)",
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: FontSize.s12,
                        color: AppColor.blackgrey,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PreviewScreen extends StatefulWidget {
  const PreviewScreen({Key? key}) : super(key: key);

  @override
  _PreviewScreenState createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  HomeController homeC = Get.find();

  bool _dragging = false;

  Offset? offset;

  @override
  Widget build(BuildContext context) {
    return DropTarget(
      onDragDone: (detail) async {
        setState(() {
          detail.files.forEach((element) {
            if (["pdf", "png", "jpg", "jpeg", "bmp", "heif"]
                .contains(element.path.split(".").last.toLowerCase())) {
              homeC.listPreview.add(File(element.path));
              homeC.listPreviewName.add(File(element.name));
            } else {
              Get.snackbar(
                  "Format Tidak Didukung", "Format file tidak didukung");
            }
          });
        });

        debugPrint('onDragDone:');
        for (final file in detail.files) {
          debugPrint('  ${file.path} ${file.name}'
              '  ${await file.lastModified()}'
              '  ${await file.length()}'
              '  ${file.mimeType}');
        }
      },
      onDragUpdated: (details) {
        setState(() {
          offset = details.localPosition;
        });
      },
      onDragEntered: (detail) {
        setState(() {
          _dragging = true;
          offset = detail.localPosition;
        });
      },
      onDragExited: (detail) {
        setState(() {
          _dragging = false;
          offset = null;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: _dragging ? Colors.blue.withOpacity(0.4) : Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 1,
                blurStyle: BlurStyle.outer,
                spreadRadius: 1,
                color: AssetColor.inverseSurfaceLight.withOpacity(0.3))
          ],
          borderRadius: BorderRadius.circular(Sizes.s12),
        ),
        margin: EdgeInsets.only(
            right: Sizes.s50,
            left: Sizes.s50,
            top: Sizes.s55,
            bottom: Sizes.s20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Spacer(),
                Container(
                    margin: EdgeInsets.all(Sizes.s10),
                    height: Sizes.s40,
                    width: Sizes.s140,
                    child: CustomButtonPrimary(
                      icon: IconlyBold.plus,
                      text: "Tambah",
                      onPress: () async {
                        var listResult = await homeC.pickFile();
                        if (listResult.isNotEmpty) {
                          setState(() {
                            homeC.listPreview.add(File(listResult[0]));
                            homeC.listPreviewName.add(File(listResult[1]));
                          });
                        }
                      },
                    )),
              ],
            ),
            Divider(
              height: 2,
              color: AppColor.blackgrey,
            ),
            Expanded(
              child: Stack(
                children: [
                  if (homeC.listPreview.isEmpty)
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            IconlyLight.paper_plus,
                            color: AppColor.blackgrey,
                            size: Sizes.s60,
                          ),
                          SizedBox(
                            height: Sizes.s10,
                          ),
                          Text(
                            "Tarik file kesini untuk menambahkan",
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: FontSize.s16,
                                color: AppColor.blackgrey,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: Sizes.s4,
                          ),
                          Text(
                            "(Format file yang didukung : pdf, jpg, jpeg, png, heif)",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: FontSize.s12,
                              color: AppColor.blackgrey,
                            ),
                          )
                        ],
                      ),
                    )
                  else
                    // listFile(homeC.listPreview.map((e) => e.path).join("\n")),
                    // Text(homeC.listPreview.map((e) => e.path).join("\n")),
                    ListView.separated(
                        padding: EdgeInsets.all(Sizes.s20),
                        itemCount: homeC.listPreview.length,
                        separatorBuilder: (ctx, index) {
                          return const Divider(
                            thickness: 0.5,
                          );
                        },
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Expanded(
                                  child: listFile(homeC.listPreview[index].path,
                                      homeC.listPreviewName[index].path)),
                              GestureDetector(
                                onTap: () {
                                  Get.defaultDialog(
                                      title: "Hapus File",
                                      titlePadding:
                                          EdgeInsets.only(top: Sizes.s10),
                                      contentPadding: EdgeInsets.all(Sizes.s20),
                                      middleText:
                                          "Apakah anda yakin akan menghapus file dari preview?",
                                      confirmTextColor: Colors.white,
                                      onConfirm: () {
                                        Get.back();
                                        setState(() {
                                          homeC.listPreview.removeAt(index);
                                          homeC.listPreviewName.removeAt(index);
                                        });
                                      },
                                      content: SizedBox(
                                        height: Sizes.s40,
                                        child: const Text(
                                            "Apakah anda yakin akan menghapus file dari preview?"),
                                      ),
                                      textConfirm: "Hapus",
                                      textCancel: "Batal");
                                },
                                child: const Icon(
                                  IconlyBold.delete,
                                  color: AssetColor.error,
                                ),
                              )
                            ],
                          );
                        }),
                  if (offset != null)
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        '$offset',
                        style: Theme.of(context).textTheme.bodySmall,
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

  Widget listFile(String path, String name) {
    return GestureDetector(
      onTap: () => Get.to(
          () => FileViewPage(
                path: path,
                name: name,
              ),
          arguments: path),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: Sizes.s6, horizontal: Sizes.s6),
        child: Row(
          children: [
            SizedBox(
              height: Sizes.s50,
              width: Sizes.s40,
              child: Image.asset(
                path.split(".").last.toLowerCase() == "pdf"
                    ? DirectoryAsset.pdf
                    : ["png", "jpg", "jpeg", "bmp", "heif"]
                            .contains(path.split(".").last.toLowerCase())
                        ? DirectoryAsset.image
                        : DirectoryAsset.ghostNoteLogo,
                fit: BoxFit.fitHeight,
              ),
            ),
            SizedBox(
              width: Sizes.s10,
            ),
            Text(
              name,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w600,
                  fontSize: FontSize.s24),
            ),
          ],
        ),
      ),
    );
  }
}
