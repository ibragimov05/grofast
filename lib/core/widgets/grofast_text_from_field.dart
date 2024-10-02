import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grofast/core/theme/app_colors.dart';
import 'package:grofast/core/utils/app_assets.dart';
import 'package:grofast/core/utils/app_utils.dart';

class GroFastTextFromField extends StatefulWidget {
  final bool? enabled;
  final bool isObscure;
  final String? hintText;
  final String labelText;
  final String errorText;
  final Widget? prefixIcon;
  final String? initialValue;
  final bool canRequestFocus;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String? Function(String)? onChanged;
  final String? Function(String?)? validator;
  final List<TextInputFormatter> inputFormatters;
  final TextEditingController? textEditingController;

  const GroFastTextFromField({
    super.key,
    this.textEditingController,
    this.isObscure = false,
    this.inputFormatters = const [],
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.initialValue,
    this.enabled,
    this.canRequestFocus = true,
    this.hintText,
    this.labelText = '',
    this.validator,
    this.errorText = '',
    this.prefixIcon,
  });

  @override
  State<GroFastTextFromField> createState() => _GroFastTextFromFieldState();
}

class _GroFastTextFromFieldState extends State<GroFastTextFromField> {
  bool _isObscure = false;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.isObscure;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText.isNotEmpty) ...[
          Text(
            widget.labelText,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: AppColors.c9C9C9C,
            ),
          ),
          AppUtils.kGap8,
        ],
        Container(
          decoration: BoxDecoration(
            color: AppColors.cf1f5f3,
            borderRadius: AppUtils.kBorderRadius20,
          ),
          child: TextFormField(
            obscureText: _isObscure,
            keyboardType: widget.keyboardType,
            inputFormatters: widget.inputFormatters,
            textInputAction: widget.textInputAction,
            controller: widget.textEditingController,
            initialValue: widget.initialValue,
            enabled: widget.enabled,
            canRequestFocus: widget.canRequestFocus,
            onChanged: widget.onChanged,
            validator: widget.validator,
            decoration: InputDecoration(
              contentPadding: AppUtils.kPaddingHor20Ver16,
              hintText: widget.hintText,
              hintStyle: const TextStyle(fontWeight: FontWeight.w400),
              suffixIcon: widget.isObscure ? _obscureSuffixIcon : null,
              prefixIcon: Padding(
                padding: AppUtils.kPaddingAll12,
                child: widget.prefixIcon,
              ),
              border: InputBorder.none,
            ),
            style: TextStyle(
              color: AppColors.c4B4B4B,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        if (widget.errorText.isNotEmpty) ...[
          AppUtils.kGap8,
          Padding(
            padding: AppUtils.kPaddingHor16,
            child: Text(
              widget.errorText,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.cEC534A,
              ),
            ),
          ),
        ]
      ],
    );
  }

  Widget get _obscureSuffixIcon {
    return IconButton(
      onPressed: () => setState(() => _isObscure = !_isObscure),
      icon: _isObscure
          ? AppAssets.icons.eyeOn.svg()
          : AppAssets.icons.eyeOff.svg(),
    );
  }
}
