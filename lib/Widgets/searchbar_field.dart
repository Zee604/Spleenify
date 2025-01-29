import 'package:flutter_svg/svg.dart';
import 'package:spleenify_task/AppUtils/app_imports.dart';

import '../AppUtils/svg_images.dart';

class SearchbarField extends StatelessWidget {

  final TextEditingController controller;
  final void Function(String) onChange;

  const SearchbarField({
    super.key,
    required this.controller,
    required this.onChange
  });

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: controller,
      textInputAction: TextInputAction.done,
      onChanged: (value) =>  onChange(value),
      style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w400
      ),
      cursorColor: Colors.black,
      cursorHeight: 20,
      textAlignVertical: TextAlignVertical.center,

      decoration: InputDecoration(
          hintText: "Search...",
          hintStyle: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400
          ),
          contentPadding: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 18
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: SvgPicture.string(SvgImages.searchIcon,
              height: 18,),
          ),

          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(
                  color: Colors.black,
                  width: 1.3
              )
          ),

          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(
                  color: Colors.black,
                  width: 1.3
              )
          ),

          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(
                  color: Colors.black,
                  width: 1.3
              )
          ),

          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(
                  color: Colors.black,
                  width: 1.3
              )
          )
      ),
    );
  }
}
