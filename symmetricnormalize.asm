// symmetric normalize
// cvtps2dq__, 2023
// part of the SmaashFX

streamin in;
streamout out;
float one = 1, nx = 256;

// normalize around one
movaps xmm0, one;
minps xmm0,in;
movaps in,xmm0;

// multiply by nx
movaps xmm0,in;
mulps xmm0,nx;

// output
movaps out,xmm0;
