# Logical volume management

PV (Phisical Volume) - метка на диске, которая в дальнейшем показывает пренадлежность диска к структуре LVM. Phisical Volume долен входить в состав группы томов (Volume Group).

VG (Volume Group) - свободное неразмеченное пространство (free space) на диске. должна содержать один или более Phisical Volume.

LG (Logical Volume) - создается на Volume Group, а не нем уже создается файловая система.