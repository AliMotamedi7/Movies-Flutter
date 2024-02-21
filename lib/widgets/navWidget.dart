import "package:flutter/material.dart";

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({super.key, this.pageIndex, required this.onTap});

  final pageIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 30),
      padding: const EdgeInsets.only(bottom: 10),
      height: 60,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BottomAppBar(
          elevation: 0.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: navItem(
                  Icons.home_outlined,
                  pageIndex == 0,
                  onTap: () => onTap(0),
                ),
              ),
              Expanded(
                child: navItem(
                  Icons.person_outline,
                  pageIndex == 1,
                  onTap: () => onTap(1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget navItem(IconData icon, bool selected, {Function()? onTap}) {
  return Expanded(
    child: InkWell(
      onTap: onTap,
      child: Icon(
        icon,
        color: selected ? Colors.black : Colors.grey,
      ),
    ),
  );
}
