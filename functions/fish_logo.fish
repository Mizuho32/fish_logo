function fish_logo \
    --description="Fish-shell colorful ASCII-art logo" \
    --argument-names outer_color medium_color inner_color msg mouth eye

    # defaults:
    [ $outer_color  ]; or set outer_color  'red'
    [ $medium_color ]; or set medium_color 'f70'
    [ $inner_color  ]; or set inner_color  'yellow'
    [ $mouth ]; or set mouth '['
    [ $eye   ]; or set eye   'O'

    # shortcuts:
    set o (set_color -o $outer_color)
    set m (set_color -o $medium_color)
    set i (set_color -o $inner_color)


    set fish \
'                 '$o'___
'$o'  ___======____='$m'-'$i'-'$m'-='$o')
'$o'/T            \_'$i'--='$m'=='$o')
'$o''$mouth' \ '$m'('$i$eye$m')   '$o'\~    \_'$i'-='$m'='$o')
'$o' \      / )J'$m'~~    '$o'\\'$i'-='$o')
'$o'  \\\\___/  )JJ'$m'~'$i'~~   '$o'\)
'$o'   \_____/JJJ'$m'~~'$i'~~    '$o'\\
   '$m'/ '$o'\  '$i', \\'$o'J'$m'~~~'$i'~~     '$m'\\
'$m'  (-'$i'\)'$o'\='$m'|'$i'\\\\\\'$m'~~'$i'~~       '$m'L_'$i'_
  '$m'('$o'\\'$m'\\)  ('$i'\\'$m'\\\)'$o'_           '$i'\=='$m'__
   '$o'\V    '$m'\\\\'$o'\) =='$m'=_____   '$i'\\\\\\\\'$m'\\\\
          '$o'\V)     \_) '$m'\\\\'$i'\\\\JJ\\'$m'J\)
                      '$o'/'$m'J'$i'\\'$m'J'$o'T\\'$m'JJJ'$o'J)
'$o'                      (J'$m'JJ'$o'| \UUU)
'$o'                       (UU)'
    set fish (echo $fish | sed -e 's/\n//g')
    set msg  (echo -e $msg)
    set fish_len (count $fish)
    set msg_len (count  $msg)
    #echo $fish_len
    #echo $msg_len
    if [ (echo "$fish_len==$msg_len"|bc) = "1" ]
      for i in (seq $fish_len)
        echo -n $msg[$i]
        echo $fish[$i]
        #set fish[$i] $msg[i]$fish[$i]
      end
    else
      for i in (seq $msg_len)
        echo $msg[$i]
      end
    end

    set_color normal
end
