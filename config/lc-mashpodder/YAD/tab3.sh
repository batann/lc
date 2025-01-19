#!/bin/bash
yad --plug=12345 --tabnum=3 --text="MP3 Player" --borders=20 --list  --mouse \
  --listen \
  --quoted-output \
  --regex-search \
  --grid-lines=both \
  --selectable-labels \
  --columns 4 \
  --search-column=3 \
  --search-column=2 \
  --search-column=1 \
  --wrap-cols=4 \
  --focus-column=3 \
  --column=Position:TEXT \
  --column=Subscription:TEXT \
  --column=Title:TEXT \
  --column=URI:TEXT \
  $(echo "$bcd") \
  --tail \
  --dclick-action="mp trackgo %s" \
  --select-action="mp indice.selected %s" &> res3 & \
