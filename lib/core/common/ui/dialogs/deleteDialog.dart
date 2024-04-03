import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../theme/colors.dart';
import '../widgets/PrimaryButton.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog(
      {super.key,
      required this.onCancel,
      required this.onDelete,
      required this.title,
      required this.description,
      this.subDescription});
  final VoidCallback onCancel;
  final VoidCallback onDelete;
  final String title;
  final String description;
  final String? subDescription;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return AlertDialog(
      insetPadding: const EdgeInsets.all(16.0),
      backgroundColor: primaryWhiteColor,
      surfaceTintColor: primaryWhiteColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      content: SingleChildScrollView(
        child: SizedBox(
          width: width * .8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      title,
                      style: theme.textTheme.titleLarge!.copyWith(
                        color: primaryBlackColor,
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      description,
                      style: theme.textTheme.labelSmall!.copyWith(
                        fontSize: 15,
                        color: primaryBlackColor.withOpacity(.8),
                      ),
                      softWrap: true,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              if (subDescription != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        subDescription!,
                        style: theme.textTheme.labelSmall!.copyWith(
                          fontSize: 15,
                          color: primaryBlackColor.withOpacity(.8),
                        ),
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 22.0),
                child: Row(
                  children: [
                    Expanded(
                      child: PrimaryButton(
                        text: 'Cancel',
                        buttonStyle: FilledButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 16.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8.0), // Adjust the radius as needed
                          ),
                          backgroundColor: primaryBlackColor.withOpacity(.5),
                        ),
                        onPressed: onCancel,
                        textStyle: theme.textTheme.labelSmall!.copyWith(
                          fontSize: 15,
                          color: primaryWhiteColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Gap(16.0),
                    Expanded(
                      child: PrimaryButton(
                        text: 'Delete',
                        buttonStyle: FilledButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 16.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8.0), // Adjust the radius as needed
                          ),
                          backgroundColor: primaryRedColor,
                        ),
                        onPressed: onDelete,
                        textStyle: theme.textTheme.labelSmall!.copyWith(
                          fontSize: 15,
                          color: primaryWhiteColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
