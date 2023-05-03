// interpolated read
// position splitter
// asm conversion
// cvtps2dq__, 2023
// part of SmaashFX

streamin in;
streamout whole, fraction;
float index, _F_2P5=2.5, _F_5=5, _F_0P5=0.5;
// mutilply pos by 2.5
movaps xmm0,in;
mulps xmm0,_F_2P5;
// add 5 to pos
addps xmm0,_F_5;
// assign changed val to index
movaps index,xmm0;
// sub 0.5 from whole pos
movaps xmm0,index;
subps xmm0,_F_0P5;
// round values (float<->int)
// hey, that's me!
cvtps2dq xmm1,xmm0;
// -> round values (int<->float)
cvtdq2ps xmm0,xmm1;
// output whole pos
movaps whole,xmm0;
// subtract whole from index
movaps xmm0,index;
subps xmm0,whole;
// output fraction
movaps fraction,xmm0;
