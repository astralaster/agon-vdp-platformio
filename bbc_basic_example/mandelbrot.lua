
ITERS=32
SCALE=1
XRANGE=-2.5
YRANGE=-1
XSTP=1
YSTP=1
COLS=64
MAXX=320
MAXY=240
for j=0, MAXY/SCALE, YSTP do
    for k=0, MAXX/SCALE, XSTP do
        CR=XRANGE+k*4/(MAXX/SCALE)
        CI=YRANGE+j*3/(MAXX/SCALE)
        ZM=0
        ZR=0
        ZI=0
        ZR2=0
        ZI2=0
        IT=0
        repeat
            Z1=ZR2-ZI2+CR
            Z2=2*ZR*ZI+CI
            ZR=Z1
            ZI=Z2
            ZR2=ZR*ZR
            ZI2=ZI*ZI
            ZM=ZR2+ZI2
            IT=IT+1
        until IT==ITERS or ZM>=4
        C=COLS-1-math.floor(IT/(ITERS/(COLS-1)))
        -- print("PLOT(69, "..k..", "..j..") with color "..C)
		plot_pixel(k, j, C)
    end
end