#!/bin/bash
skip=44

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -dt`
else
  gztmpdir=/tmp/gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `echo X | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  echo >&2 "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�ժ[mips_bench_run.sh �Um��8���9o���B�[�*U��(���"�^?\��$�$q�}����f��Tr�3��<�ߜ�ȝ9+���B�u�m��Iu�wXQ�N&�2�i���\2L���Q�s�M����T鉎k��}Ę��7ϼ�&@M%e�&� �t��s}h#L\���菇���D�r5@���S�o��]���p֙���k�i�h���ȥe�,XYB� � ,�u��Nϥ-	A�DT�eY}��%�V"_����|�Fݾɝ�<ZfL��b�~����-!��5�g���h���2CBpJ,�0�
��	�&�{�X�r�	��]^�����i��+�^g^0��D*�T����S@bI��s���~�Xռo� ��(+x����3[�P���������B�/�}�K$�7P{�K�J���%ϑ9-%PO)���HBɕ`)��l�ػP3�u�*B�o�gbMR�J�h�<��\+(�D��	�NA&'А4�:�3y��N�UY���̵��p=�u`.���%F�D׽�9�w&r�"�s��2h�䰓6�܋�X������ ��)r���LȖ�����ޤ�n#2�ٖ�BW�� k����ŷ,�x��C&"%�E���t	a{n:ә�f�ҒM�?x�}'��Ƨ���2���:+#�vu_��}��n��~Ǔ.���p�i��E���f�~r���?�S!��!���'�����_�_�3��W�Fe�Z-��+L�`}Q�B��+��q�a����im�;���j<-��93���n���p����m�}^��±���;�TɎ����\ n:��#˜R��F��}x8\�`i������M  