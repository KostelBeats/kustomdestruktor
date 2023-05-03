// interpolated read
// asm conversion
// cvtps2dq__, 2023
// part of SmaashFX

streamin readposInt, readposFrac;
streamout posL, weightL, weightR;
float tmp, _F_1=1;

// subtract 1 from position
movaps xmm0,readposInt;
subps xmm0,_F_1;

// output L postion
movaps posL,xmm0;

// weight of L is 
// the same as pos. fraction
movaps xmm0,readposFrac;
movaps weightL,xmm0;

// subtract fraction from 1
movaps xmm0,_F_1;
subps xmm0,readposFrac;

// output weight R
movaps weightR,xmm0;
