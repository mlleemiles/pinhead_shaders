// Lens Halo VS
// ---- Created with 3Dmigoto v1.3.16 on Wed Sep 27 12:19:24 2023
cbuffer cb3 : register(b3)
{
  float4 cb3[3];
}




// 3Dmigoto declarations
#define cmp -
Texture1D<float4> IniParams : register(t120);
Texture2D<float4> StereoParams : register(t125);


void main(
  float4 v0 : POSITION0,
  uint v1 : SV_VERTEXID0,
  uint v2 : SV_INSTANCEID0,
  out float4 o0 : SV_POSITION0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1)
{
  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;
  
/*
  o0.zw = float2(0, 1);
  r0.xyzw = cmp(float4(0,0,0,0) < v0.xyxy);
  r1.xy = r0.zw ? float2(3,1) : float2(-1,-3);
  o0.xy = r1.xy;
  r1.xyzw = r0.zwzz ? float4(2,0,2,2) : float4(0,2,0,0);
  o2.xyzw = r0.xyzw ? float4(-1.732051,0.577350,3.000000,-1.000000) : float4(0.577350,-1.732051,-1.000000,3.000000);
  o1.xyzw = float4(0.000000, 0.000000, -4.000000, 4.000000) + r1.xyzw;
*/
  o0.x = dot(v0.xyzw, cb3[0].xyzw);
  o0.y = dot(v0.xyzw, cb3[1].xyzw);
  o0.z = dot(v0.xyzw, cb3[2].xyzw);
  o0.w = 1;
  r0.xyzw = cmp(float4(0,0,0,0) < v0.xyxy);
  o1.xyzw = r0.xyzw ? float4(2,0,3,-1) : float4(0,2,-1,3);
  o2.xyzw = r0.xyzw ? float4(-1.732051,0.577350,3.000000,-1.000000) : float4(0.577350,-1.732051,-1.000000,3.000000);
/*
  o0.x = dot(v0.xyzw, cb3[0].xyzw);
  o0.y = dot(v0.xyzw, cb3[1].xyzw);
  o0.z = dot(v0.xyzw, cb3[2].xyzw);
  o0.w = 1;
  r0.xyzw = cmp(float4(0,0,0,0) < v0.xyxy);
  o1.xyzw = r0.xyzw ? float4(2,0,3,-1) : float4(0,2,-1,3);
*/
  return;
}