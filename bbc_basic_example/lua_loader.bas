   10 PRINT "Setup"
   20 MAX_FILE_SIZE%=1024
   30 DIM file MAX_FILE_SIZE%
   40 MB%=&40000
  100 PRINT "Reading in lua file"
  110 OSCLI("LOAD mandelbrot.lua " + STR$(MB%+file))
  120 L%=0
  130 FOR I%=0 TO MAX_FILE_SIZE%
  140   C%=?(file+I%)
  150   IF C%<>0 THEN L%=I%+1:PRINT I%":"C%
  160 NEXT
  200 PRINT "Uploading the lua script"
  210 VDU 23,0,&D0,
  220 VDU L%;
  230 FOR I%=1 TO L%
  240   VDU ?(file+I%),
  250 NEXT
  300 PRINT "Start lua script"
  310 VDU 23,0,&D1
