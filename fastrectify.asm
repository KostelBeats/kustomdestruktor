// fast rectify
// cvtps2dq__, 2023
// part of the SmaashFX

streamin in;
streamout abs;
streamout sign;

int ABSMASK=2147483647;
int SIGNMASK=-2147483648;
int ONE=1065353216;

movaps xmm0,in;
andps xmm0,ABSMASK;
// output abs(x)
movaps abs,xmm0;

// the heck happened here?
// fastest way to calculate abs(x) in asm
// is to apply a mask to x
// ABSMASK is a number, when converted to 
// hex, contains a mask for number's mantissa
// removal. if we and x and mask, we will
// get a value, without mantissa
// (i mean, it will be replaced by pos. 
// number mantissa)

movaps xmm1,in;
andps xmm1,SIGNMASK;
movaps xmm0,ONE;
orps xmm0,xmm1;
//output sign(x)
movaps sign,xmm0;

// the heck happened here too?
// fastest way to calculate sign(x) in asm
// is to apply two masks to x
// SIGNMASK is a number, when converted to 
// hex, contains a mask ONLY for
// number's mantissa.
// if and x with mask, we will
// get a sign of the number
// then we need to or it with ONE,
// another magical mask in hex,
// in order to get an sign(x)
